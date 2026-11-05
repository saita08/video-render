#!/usr/bin/env bash
# 非公開のリポジトリから書き出す。ここのログは誰でも読めるので、
# install と render の出力は全部ファイルに落とし、ログには結果だけを出す。
# 落ちた時も中身は出さない。同じ引数を非公開の側で走らせて調べる。
set -euo pipefail

log="$RUNNER_TEMP/render.log"
out="$GITHUB_WORKSPACE/out"
mkdir -p "$out"

quiet() {
  local label="$1"; shift
  local started=$SECONDS
  if "$@" >>"$log" 2>&1; then
    echo "$label: ok ($((SECONDS - started))s)"
  else
    echo "$label: failed ($((SECONDS - started))s, output withheld)" >&2
    exit 1
  fi
}

cd "$GITHUB_WORKSPACE/source"
quiet install bun install --frozen-lockfile
quiet render npx --no-install remotion render "$COMPOSITION" "$out/$NAME.mp4" \
  --codec h264 --audio-codec aac
if [[ "$SILENT" == "true" ]]; then
  quiet render-silent npx --no-install remotion render "$COMPOSITION" "$out/${NAME}_silent.mp4" \
    --codec h264 --muted
fi

ls -l "$out" | awk 'NR>1 {print $NF": "$5" bytes"}'
