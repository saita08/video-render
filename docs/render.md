# 書き出し

決めた理由は [ADR-0003](../adr/0003-render-private-repos-on-a-public-repos-actions.md)。

## 頼み方

ワークフロー `render`（[.github/workflows/render.yml](../.github/workflows/render.yml)）を、次のどちらかで走らせる。どちらもこのリポジトリへの書き込みの権限が要る。

- `workflow_dispatch`: Actions の画面、`gh workflow run render -R saita08/video-render -f composition=<id> -f name=<名前>`、GitHub の MCP の `actions_run_trigger`。
- `repository_dispatch`: 型は `render`、`client_payload` に同じ名前の値を入れる。

| 値 | 中身 | 既定 |
|---|---|---|
| `repo` | 書き出す元。[targets.txt](../targets.txt) にある物だけ | `saita08/remotion-movie-studio` |
| `ref` | ブランチ、タグ、コミット | `main` |
| `composition` | Composition id。英数字とハイフン | |
| `name` | 出すファイルの名前。`.mp4` は付けない | |
| `silent` | `true` なら音無しの `<name>_silent.mp4` も作る | `false` |

書き出しは `--codec h264 --audio-codec aac`、音無しは `--codec h264 --muted`。元のリポジトリの `bun.lock` で入れ、`npx remotion render` で書き出す。

名前（`name`）が違う依頼は並んで走る。同じ名前の依頼は一本ずつ順に走り、待てるのは一本だけなので、同じ名前を三つ以上続けて頼むと間の物は取り消される（GitHub の concurrency の決まり）。

## 出てくる物

リリース `<name>-r<回の番号>` に mp4 が付く。誰でも開ける URL で、ワークフローの Summary にも出る。リリースの本文は Composition id だけ。依頼した issue への知らせは、走らせた側が自分の権限で書く。このリポジトリのトークンは元のリポジトリを読むことしかできない。

## ログに出さない

このリポジトリのログ、リリース、コミットは誰でも読める。

- install と render の出力はファイルに落とし、ログには段の名前、成否、秒数、出来たファイルの大きさだけを出す。落ちた時も中身は出さない。同じ引数を元のリポジトリの側で走らせて調べる。
- 依頼の値は `run:` に直に埋めず、`env` を通し、[scripts/validate.sh](../scripts/validate.sh) で形を絞ってから使う。
- 秘密は `SOURCE_TOKEN` 一つで、渡し先は元のリポジトリの checkout だけ。どの checkout も `persist-credentials: false`。
- `pull_request_target` と `workflow_run` は使わない。macOS のランナーは使わない。

これらは [scripts/check-workflows.sh](../scripts/check-workflows.sh) が確かめ、ワークフロー `check` が push と pull request のたびに走らせる。

## トークン

`SOURCE_TOKEN` は fine-grained personal access token で、Repository access は targets.txt のリポジトリだけ、Permissions は Contents の Read-only だけ（Metadata の Read-only は自動で付く）。このリポジトリの Settings、Secrets and variables、Actions に置く。書き出す元を足す時は、targets.txt に一行足し、トークンの Repository access にも足す。

トークンには期限がある。期限はトークンの設定の画面で見て、ここには書かない。切れると書き出しが元の checkout で落ちるので、同じ範囲と権限で作り直し、Secrets の値を替える。
