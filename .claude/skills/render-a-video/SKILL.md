---
name: render-a-video
description: Renders a Remotion composition from a private source repository on this repository's Actions, waits for the run, checks the mp4 on the release, and hands over the release URL. Use from any project whenever a finished video is to be shown to someone or delivered for a request. Triggers on "書き出して", "レンダして", "動画を渡して", "納品", "Release に出して", "video-render で".
---

# 動画を書き出して渡す

これが済むと、リリース `<name>-r<回の番号>` に mp4 があり、開いて確かめてあり、その URL が頼んだ相手に届いている。値と出てくる物の決まりは [docs/render.md](../../../docs/render.md)。

1. 書き出す物が元のリポジトリの `main`（か渡す `ref`）に入っていることを確かめる。リリースは誰でも開けるので、公開前の物、見せたくない物なら書き出さずに止める。
2. 元のリポジトリが [targets.txt](../../../targets.txt) に無ければ、一行足す PR をこのリポジトリに出してマージし、Tsukasa に `SOURCE_TOKEN` の Repository access へ足してもらう（画面でしかできないので、Chrome に渡す頼みをコードブロックで書く）。足し終わるまで次へ進まない。
3. 同じ `name` の回が走っていれば、終わるのを待つ。
4. ワークフロー `render` を走らせる。`gh workflow run render -R saita08/video-render -f composition=<id> -f name=<名前>`（音無しも要るなら `-f silent=true`、元が remotion-movie-studio の main でなければ `-f repo=<owner/name> -f ref=<ref>`）、または GitHub の MCP の `actions_run_trigger`（`workflow_id: render.yml`、`ref: main`、同じ値を `inputs` に）。
5. 回の終わりを待つ。`gh run watch <run-id> -R saita08/video-render` をバックグラウンドで走らせ、終わりの知らせで戻る。
6. 落ちた時は、ログに中身が出ないので、同じ引数で元のリポジトリの側で書き出して調べる。checkout で落ちたならトークンの期限切れを疑い、Tsukasa に伝える（[docs/render.md](../../../docs/render.md) の「トークン」）。
7. 通ったら `gh release download <name>-r<回の番号> -R saita08/video-render` で mp4 を落とし、`ffprobe` で長さ、大きさ、音を見て、コマを何枚か抜いて目で見る。
8. リリースの URL を、頼んだ場の決まりに沿って渡す。AI の依頼なら [saita08/ai-talk の README](https://github.com/saita08/ai-talk#delivering-and-closing)、Tsukasa にはチャットで。

確かめ: 渡した URL を開くと mp4 が落とせ、それが頼まれた Composition である。
