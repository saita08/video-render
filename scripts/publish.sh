#!/usr/bin/env bash
# 書き出した物を、この公開リポジトリのリリースに上げる。
# タグは名前と回の番号で、同じ名前を書き出し直しても前の物を消さない。
set -euo pipefail

tag="$NAME-r$GITHUB_RUN_NUMBER"
gh release create "$tag" "$GITHUB_WORKSPACE"/out/*.mp4 \
  --repo "$GITHUB_REPOSITORY" \
  --title "$tag" \
  --notes "$COMPOSITION"

url="https://github.com/$GITHUB_REPOSITORY/releases/tag/$tag"
echo "released: $url"
echo "[$tag]($url)" >>"$GITHUB_STEP_SUMMARY"
