# video-render のドキュメント

非公開のリポジトリから Remotion の動画を書き出してリリースに置く、公開のリポジトリ。ここにあるのはワークフローと、それが外へ何も漏らさないことを確かめるスクリプトだけである。

## このディレクトリの役割

`docs/` は今あるものと守る決まりを書く。なぜそう決めたかは [adr/](../adr/README.md)、価値はルートの [CLAUDE.md](../CLAUDE.md) にある。同じ中身を二か所に書かず、各ページはその裏にある ADR へリンクする。

この作業に要るページだけを下の表から選んで読む。表から探せない時は、読み方でなく表を直す。

## ページ

| ファイル | 中身 |
|---|---|
| [render.md](render.md) | 書き出しの頼み方、出てくる物、ログに出さない決まり、トークン |

## 手順

手順は `.claude/skills/` にある。Claude はその時が来ると読み込み、人はファイルを読むか名前で呼ぶ。

| スキル | 始まる時 |
|---|---|
| [shelve-knowledge](../.claude/skills/shelve-knowledge/SKILL.md) | 文書を作る、足す、動かす前 |
| [write-adr](../.claude/skills/write-adr/SKILL.md) | 後から理由を辿れなくなる選択をする時 |
| [close-notes](../.claude/skills/close-notes/SKILL.md) | 作業を閉じ、`notes/` に残り物がある時 |
| [request-a-render](../.claude/skills/request-a-render/SKILL.md) | 一本書き出し、リリースの mp4 を確かめる時 |
| [add-a-render-source](../.claude/skills/add-a-render-source/SKILL.md) | 書き出す元のリポジトリを足す時 |
| [renew-source-token](../.claude/skills/renew-source-token/SKILL.md) | `SOURCE_TOKEN` が切れた、切れそうな時。人が呼ぶ |

## 関わる判断

- [ADR-0002](../adr/0002-adopt-shelved-documentation.md) — 知識を棚に分ける
- [ADR-0003](../adr/0003-render-private-repos-on-a-public-repos-actions.md) — 非公開のリポジトリを公開のリポジトリの Actions で書き出す
