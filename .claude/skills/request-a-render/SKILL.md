---
name: request-a-render
description: Runs the render workflow for one composition and checks the mp4 on the release it produces. Use when a video from a listed source repository is to be rendered here, re-rendered, or tried after a change to the workflow. Triggers on "video-render で書き出して", "render を走らせて", "Release に出して", "書き出し直して".
---

# 書き出しを頼む

これが済むと、リリース `<name>-r<回の番号>` に mp4 があり、開いて確かめてある。値と出てくる物の決まりは [docs/render.md](../../../docs/render.md)。

1. 書き出す物が元のリポジトリの `main`（か渡す `ref`）に入っていて、公開してよい物であることを確かめる。リリースは誰でも開ける。
2. ワークフロー `render` を走らせる。`gh workflow run render -R saita08/video-render -f composition=<id> -f name=<名前>`（音無しも要るなら `-f silent=true`、元を変えるなら `-f repo=<owner/name> -f ref=<ref>`）、または GitHub の MCP の `actions_run_trigger`（`workflow_id: render.yml`、`ref: main`、同じ値を `inputs` に）。
3. 同じ `name` を続けて頼む時は、前の回が終わってから頼む。
4. 回が終わったら、Summary かリリースの一覧から `<name>-r<回の番号>` を開き、mp4 を落として、長さ、大きさ、音、間を確かめる。
5. 落ちた時は、ログに中身が出ないので、同じ引数で元のリポジトリの側で書き出して調べる。

確かめ: リリースの URL を開くと mp4 が落とせ、開いた動画が頼んだ Composition である。
