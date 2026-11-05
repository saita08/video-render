#!/usr/bin/env bash
# 公開リポジトリのワークフローが、秘密と非公開のコードを外へ出さない形かを確かめる。
# 決まりは docs/render.md、理由は adr/0003。
set -euo pipefail
cd "$(dirname "$0")/.."

problems=0
bad() { echo "NG: $1"; problems=$((problems + 1)); }

wf=.github/workflows

# 他人の変更で秘密を持って走る引き金と、macOS のランナーは使わない。
grep -nE 'pull_request_target|workflow_run' "$wf"/*.yml && bad "forbidden trigger"
grep -nE 'runs-on:.*macos' "$wf"/*.yml && bad "macOS runner"

# 秘密を読むのは render.yml だけで、渡し先は非公開の側の checkout だけ。
others=$(grep -lE 'secrets\.' "$wf"/*.yml | grep -v '/render.yml$' || true)
[[ -z "$others" ]] || bad "secrets used outside render.yml: $others"
uses=$(grep -cE 'secrets\.' "$wf/render.yml" || true)
[[ "$uses" == 1 ]] || bad "render.yml must read exactly one secret, found $uses"
grep -qE 'token: \$\{\{ secrets\.SOURCE_TOKEN \}\}' "$wf/render.yml" || bad "SOURCE_TOKEN must go only to checkout"

# render.yml は依頼の時だけ走る。
grep -qE '^\s+(push|pull_request|schedule):' "$wf/render.yml" && bad "render.yml must run only on dispatch"

# 依頼の値を run: に直に埋めない（シェルへの差し込みを防ぐ）。env を通す。
grep -nE '^\s*(- )?run:.*\$\{\{' "$wf"/*.yml && bad "expression inside run:"

# 認証を作業場所に残さない。
n_co=$(grep -cE 'uses: actions/checkout@' "$wf"/*.yml | awk -F: '{s+=$2} END {print s}')
n_pc=$(grep -cE 'persist-credentials: false' "$wf"/*.yml | awk -F: '{s+=$2} END {print s}')
[[ "$n_co" == "$n_pc" ]] || bad "every checkout needs persist-credentials: false"

# スクリプトはコマンドをログに出さず、非公開の側の出力はファイルへ落とす。
grep -nE 'set -[a-z]*x|set -o xtrace' scripts/validate.sh scripts/render.sh scripts/publish.sh && bad "xtrace prints commands"
grep -qE '"\$@" >>"\$log" 2>&1' scripts/render.sh || bad "render.sh must send output to the log file"
grep -nE '^\s*(bun|npx|bunx|npm|node) ' scripts/render.sh && bad "render.sh runs a command outside quiet"

[[ $problems == 0 ]] && echo "ok" || exit 1
