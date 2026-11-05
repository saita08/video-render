#!/usr/bin/env bash
# 依頼の値を、使う前に形で絞る。値はどれもログとリリースに出るので、
# 決まった形の外の物は通さない。
set -euo pipefail

fail() { echo "rejected: $1" >&2; exit 1; }

grep -qxF "${REPO:-}" targets.txt || fail "repo is not listed in targets.txt"
[[ "${REF:-}" =~ ^[A-Za-z0-9._/-]{1,100}$ ]] || fail "ref"
[[ "${COMPOSITION:-}" =~ ^[A-Za-z0-9-]{1,100}$ ]] || fail "composition"
[[ "${NAME:-}" =~ ^[A-Za-z0-9._-]{1,100}$ ]] || fail "name"
[[ "${SILENT:-false}" =~ ^(true|false)$ ]] || fail "silent"

echo "ok: $COMPOSITION -> $NAME.mp4 (silent copy: $SILENT)"
