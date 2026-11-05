---
name: renew-source-token
description: Replaces SOURCE_TOKEN before or after it expires, keeping the same narrow access. Use when a render fails at checking out the source repository with an authentication error, or when the token's expiry is near. Triggers on "トークンが切れた", "SOURCE_TOKEN を作り直す", "checkout が落ちる".
disable-model-invocation: true
---

# SOURCE_TOKEN を作り直す

これが済むと、`SOURCE_TOKEN` は新しい期限を持ち、範囲と権限は前と同じで、書き出しが通る。決まりは [docs/render.md](../../../docs/render.md) の「トークン」。トークンの値は、Claude も含めて誰も会話や issue やファイルに書かない。

1. Tsukasa に頼む文をコードブロックで書く。GitHub の Settings、Developer settings、Fine-grained tokens で、そのトークンを Regenerate する（または同じ形で作り直す）。Repository access は [targets.txt](../../../targets.txt) のリポジトリだけ、Permissions は Contents の Read-only だけ。
2. 続けて、このリポジトリの Settings、Secrets and variables、Actions で `SOURCE_TOKEN` を新しい値に替えてもらう。
3. スキル `request-a-render` で一本書き出し、checkout が通ることを確かめる。

確かめ: 書き出しの回が checkout を通り、リリースに mp4 が付く。
