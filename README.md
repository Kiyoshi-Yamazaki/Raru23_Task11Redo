# Raru23_Task11Redo
Raru23_Task11をやり直したAppです。

# 問題点
* セルを選択した時にsegueが2回呼ばれていた
* delegateの設定タイミング

# 修正
segueが2回呼ばれている
* 以前 : cell自身にunwindSegueの設定を行っていた為Segueが呼ばれ、performSegueでもunwindSegueをidentifier指定で呼んでいた
* 修正 : cell自身に紐づけていたunwindSegueの設定を削除。performSegueのみで特定のsegueを指定し改善

delegateの設定
* 以前 : unwindSegueで前のViewに戻った時に指定
* 修正 : 画面が表示されるタイミングで設定
