---
name: close-notes
description: Closes a task's notes by promoting what deserves a durable shelf and deleting the rest. Use when a task is closing — its pull request is merging, its feature has landed, its handover has been picked up — and notes/ holds what the task left behind. Triggers on "作業を閉じる", "メモを片付けて", "マージした", "締めて", "close the task", "clean up the notes".
---

# 作業のメモを閉じる

これが済むと、`notes/` に閉じた作業の物は残らず、残す価値のあった物は、次に読む人が探す棚にある。

1. `notes/` のうち、閉じる作業のファイルを挙げる。まだ開いている作業のメモには触れない。
2. ファイルを一つずつ読み、中身を分ける。選んだ事と理由は `write-adr` で `adr/` へ。決まりや今あるものの説明は `docs/` のページへ。手順は `.claude/skills/` のスキルへ。生のデータは `references/` へ。それ以外は行き先が無い。
3. 持ち主に二つの一覧を見せる。何をどこへ上げるか、何を消すか。答えを待つ。メモが何を意味するかは持ち主が言う。
4. 上げる物は、行き先の棚の形で書き直し、その棚の目次を直す。メモのファイルをそのまま残る棚へ移さない。
5. その作業のメモのファイルを `git rm` で消す。

確かめ: `grep -rn "notes/" README.md CLAUDE.md docs adr .claude/skills` で `notes/` へのリンクが出ない。

この手順が仕える決まり: [CLAUDE.md](../../../CLAUDE.md) の文書の節。
