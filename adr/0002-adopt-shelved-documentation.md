# 0002. Adopt the shelved documentation contract

- Status: Accepted
- Date: 2026-11-05

## Context

O2Cafe のほかのリポジトリ（Games、our-website、remotion-movie-studio）は、知識を CLAUDE.md、docs/、.claude/skills/、adr/、notes/ に分ける shosoin の決まりで揃えている。このリポジトリも Claude が手を入れるので、同じ所に同じ物がある方が迷わない。

## Decision

知識を棚に分ける。価値は CLAUDE.md、今の姿と決まりは docs/、手順は .claude/skills/、理由は adr/、作業の間だけの物は notes/。同じ中身を二つの棚に書かない。自分用のメモリを閉じ、生成の署名を付けず、絵文字をファイルに入れないことは、.claude/ の設定とフックで守る。生のデータは無いので references/ は作らない。

## Consequences

- 棚の地図はルートの [README.md](../README.md)、ページと手順の目次は [docs/README.md](../docs/README.md)。
- ほかのリポジトリと同じ三つの手順（shelve-knowledge、write-adr、close-notes）を持つ。
- 小さなリポジトリにしては棚が多い。中身の無い棚は作らないことで抑える。

## Alternatives Considered

- **README 一枚に全部書く**: 今は足りるが、決まりと理由が混ざり、変えた時に理由が消える。
- **wiki に書く**: リポジトリと別に動き、コードと一緒に直されない。
- **何もしない**: ほかのリポジトリと形が違い、Claude が毎回迷う。
