# 0003. Render private repos on a public repo's Actions

- Status: Accepted
- Date: 2026-11-05
- Deciders: Tsukasa

## Context

remotion-movie-studio で作った動画は、依頼した側（grok など）が issue の手順で自分で書き出す形で渡してきた。動画のファイルを issue に直接付ける API は無く、Mac で書き出したり置いたりはしない。Claude のクラウドの作業場所では書き出せるが、ファイルを外へ渡す道が無い。

GitHub Actions は、公開リポジトリなら標準のランナーの時間が無料で、非公開のリポジトリでは月の無料枠を使う。動画を作るリポジトリは非公開のままにしたい。ほかのプロジェクトの動画にも同じ道を使いたい。

## Decision

書き出しだけをする公開リポジトリ saita08/video-render を置き、その Actions の ubuntu のランナーで書き出す。

- 元のリポジトリは、Contents の Read-only だけを持つ fine-grained のトークン一つ（`SOURCE_TOKEN`）で checkout する。書き出す元は targets.txt に並べ、トークンの範囲も同じにする。
- 出来た mp4 はこのリポジトリのリリースに置く。誰でも開ける URL になる。
- 引き金は `workflow_dispatch` と `repository_dispatch` だけ。書き込みの権限がある者だけが走らせられる。
- 元のリポジトリの出力はログに出さない。落ちた時も中身を出さず、元の側で調べる。
- 依頼の issue への知らせは、走らせた側が自分の権限で書く。トークンに issue の書き込みを持たせない。
- これらはスクリプト check-workflows.sh で確かめる。

## Consequences

- 書き出しの時間は無料になり、Mac もクラウドの作業場所も使わない。
- 動画は公開される。出す前の物、見せたくない物をここで書き出してはいけない。
- ログが読めないので、落ちた時の調べは元のリポジトリの側で同じ引数を走らせて行う。
- トークンには期限があり、切れる前に作り直す。
- 今の姿は [docs/render.md](../docs/render.md)。

## Alternatives Considered

- **元のリポジトリの Actions で書き出し、artifact で渡す**: 非公開のリポジトリの時間を使い、artifact はログインした権限のある人しか取れない。grok に渡らない。
- **Mac で書き出す**: Mac に納品物を作らない決まりに反する。
- **クラウドの作業場所で書き出して上げる**: ファイルを外へ出す道が無い。
- **macOS のランナー**: 時間の倍率が高く、使わない決まりがある。
- **`pull_request_target` などで他から頼めるようにする**: 他人の変更が秘密を持って走りうる。
- **トークンに issue の書き込みも持たせ、ワークフローが issue に書く**: 公開の場に置く秘密の力が増える。走らせるのは Claude で、Claude は自分の権限で書ける。
