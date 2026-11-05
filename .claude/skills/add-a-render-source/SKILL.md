---
name: add-a-render-source
description: Adds a private repository as a source the render workflow may check out. Use when videos from a repository not yet in targets.txt are to be rendered here. Triggers on "書き出す元を足す", "別のリポジトリの動画も書き出したい", "targets.txt に足す".
---

# 書き出す元を足す

これが済むと、新しいリポジトリの Composition を `-f repo=<owner/name>` で書き出せる。決まりは [docs/render.md](../../../docs/render.md) の「トークン」、理由は [ADR-0003](../../../adr/0003-render-private-repos-on-a-public-repos-actions.md)。

1. 元のリポジトリが Remotion の動画を持ち、`bun.lock` で入れられ、`npx remotion render` で書き出せることを確かめる。
2. [targets.txt](../../../targets.txt) に `owner/name` を一行足す。
3. Tsukasa に、`SOURCE_TOKEN` の Repository access にそのリポジトリを足してもらう。GitHub の画面でしかできないので、Chrome に渡す頼みをコードブロックで書く（Settings、Developer settings、Fine-grained tokens、そのトークン、Repository access に足す。Permissions は Contents の Read-only のまま）。
4. `scripts/check-workflows.sh` を通し、PR にする。
5. マージの後、スキル `request-a-render` で一本書き出して確かめる。

確かめ: 新しい元からの書き出しが、Validate request と checkout を通ってリリースに mp4 を置く。
