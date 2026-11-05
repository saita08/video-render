# video-render

非公開のリポジトリにある Remotion の動画を GitHub Actions で書き出し、このリポジトリのリリースに置く。書き出しだけをする公開のリポジトリで、動画のコードはここに無い。

remotion-movie-studio（非公開）で作った動画を人に見せる時の出口で、Claude がワークフローを手で走らせ、出来たリリースの URL を渡す。渡し方は [saita08/ai-talk](https://github.com/saita08/ai-talk) の決まりに従い、ここでは決めない。

## ドキュメント

このリポジトリの知識は四つの棚に分けて置く。同じ中身を二つの棚には書かない。決まりは [ADR-0002](adr/0002-adopt-shelved-documentation.md)。

- **[CLAUDE.md](CLAUDE.md)** — 価値と判断のよりどころ
- **[docs/](docs/README.md)** — 今どうなっているか、守る決まり
- **.claude/skills/** — 手順。目次は [docs/README.md](docs/README.md)
- **[adr/](adr/README.md)** — なぜそう決めたか

手を入れる前に [docs/README.md](docs/README.md) から読む。
