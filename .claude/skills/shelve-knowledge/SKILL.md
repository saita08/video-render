---
name: shelve-knowledge
description: Decides which shelf a piece of written knowledge belongs on — CLAUDE.md, README, docs/, a skill in .claude/skills/, adr/, references/, or notes/ — before it is written. Use when about to create, extend, or move a documentation file, a docs/ page above all, or when someone asks where something should be written down. Triggers on "どこに書く", "docs に足して", "書いておいて", "これはスキルにする?", "where should this go", "document this".
---

# 知識を棚に置く

これが済むと、その知識の置き場は一つだけになり、棚の目次がそれを指し、要る人がそこで出会える。

1. 中身を一種類ずつ扱う。種類の混ざったページは分け、分けた一つずつに問いを当てる。
2. 次の順に問い、最初に「はい」になった所に置く。順は大事で、CLAUDE.md は毎回読み込まれるので、いちばん入りにくい棚として最後に問う。
   1. 作業が終われば要らなくなる物か。メモ、見直しの書き出し、試作、引き継ぎ。→ `notes/`
   2. 選んだ事の記録か。何を決め、なぜで、何を捨てたか。→ `adr/`（`write-adr` で）
   3. 生のデータか。行、スキーマ、取った応答など、形を照らすために置く物。→ `references/`
   4. 知る物でなく、行う物か。始まる時と順のある手順。→ `.claude/skills/` のスキル。誰かが手順を書き留めていること自体が、繰り返す証である。
   5. 今あるものを述べるか、今守る決まりを述べるか。→ `docs/` のページ
   6. 初めて来た人が最初に読む物か。これは何で、どこに何があるか。→ ルートの `README.md`
   7. 幾つもの決まりがそこから導ける価値か。→ `CLAUDE.md`。書いたとおりに守れて機械で確かめられる文は決まりなので、5 に戻す。
3. 決まりとそれに仕える手順が一緒に来たら分ける。手順はスキルに、決まりと理由は `docs/` のページに残し、スキルからページへリンクする。
4. 中身が `docs/` に入ったら、もう一度問う。このページが要る時、読む人は探しに来るか。来ないなら、ページに引き金を付ける。関わるファイルで時を名指せるなら `.claude/rules/` の `paths` 付きのルール、そうでなければ状況を description に書いたスキル。引き金は条件とページへのリンクだけを持つ。`paths` の無いルールは書かない。他の引き金が既に名指している時は名指さない。
5. 書く前に、同じ中身が棚にないか探す。既に置き場があれば、そこを足すかリンクする。二つ目の写しは書かない。
6. その棚の形で書き、同じ変更で目次を直す。ページと手順のスキルは `docs/README.md` の表、記録は `adr/README.md` の一覧。
7. 価値とも決まりとも読める物、二つの棚に同じくらい当てはまる物は、持ち主に聞く。知識が何を意味するかは持ち主が言う。

確かめ: 新しい中身が棚の目次から辿れ、残る棚から `notes/` へのリンクが無い。

この手順が仕える決まり: [CLAUDE.md](../../../CLAUDE.md) の文書の節と、ルートの [README.md](../../../README.md) の文書の地図。
