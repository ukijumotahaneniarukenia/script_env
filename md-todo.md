- texこまんどソースからいんすこすると7時間ぐらい本当にかかるから要注意!!!並列ビルドする際に一緒に仕込んでおくと、並列化できているかの指標になって逆にわかりやすい。

- rubyでxmlファイル処理するコマンドまとめる。

- 各環境ディレクトリの引数を一元管理するためのマークダウンファイルが欲しい。

- 適用されている値を一覧で管理したい。優先度を管理する。

- editorは切り離すことができたので、とりあえず、落ち着いたら、テンプレートに切り出しておく

- 必要十分条件にするためには十分条件が必要。必要条件を定義しないといけない。十分条件は絞る必要はあまりない。必要条件はテキストマイニングと呼ばれるもので、規則を見つけてパタン定義。

- gradleはsdkからインスこすればいい。ホストからマウントする必要ない。

- デフォルトイメージリストに既存DockerfileのFROMコマンドのイメージバージョンが含まれているか・

- プログラム更新頻度を調べたい。バージョン版数への関心を更新頻度に反比例させたい。メンテが大変になるので。

- プログラム単位でデフォルトバージョンを管理したい

- Dockerfile-ARG対応し忘れていた。

- Dockerfile.subの実行順序
  - patchの名称はデフォルトでpre-patch
  1. pre-patch（あれば）
  2. install
  3. post-patch（あれば）
  4. config
  5. healthcheck

- もう事前ビルドしてマウントだな。
  - https://qiita.com/IanMLewis/items/badc55b5d8e188ace34a
  - repo管理しててよかった。

- MySQL build しくってたのがここでリカバレるかも。必要そうなライブラリが乗ってて、ビルド手順乗っている。
  - https://mroonga.org/ja/docs/install/others.html
  - mysqlは5.6!!

- テンプーレトにキャッシュ削除するスクリプトを追加する。
  - centos
    - https://easyramble.com/yum-clean-and-update.html
  - Ubuntu
    - https://qiita.com/SUZUKI_Masaya/items/1fd9489e631c78e5b007

- gpuを利用したディープラーニング
  - https://techable.jp/archives/118651

- rust製のコマンド
  - https://qiita.com/navitime_tech/items/c249269a3b47666c784b

- groongaのバージョン組み合わせ作れるだけ作ってみる

- ruby groonga
  - http://ranguba.org/ja/

- スクリプトに参照を持たせ始めるタイミングと処理順序を意識し始めるタイミングは同じことが改めてわかった。処理順序をファイルで管理する。ファイル名に縛られないために。

- ダイナミックリンクディレクトリのエントリディレクトリをシステム単位でキャッシュ作成対象として認識させておく際に、

```
/etc/ld.conf.d/プロセス名.conf
```
といった名称で、

例えば、

```
/etc/ld.conf.d/postgres.conf
```

のように。環境個別に設定を利かすのがよさげ。記載するプロセス名はscript-envに格納しているディレクトリ名から選択する。

- カンマ区切り文字列をbashでunnestがレコードの意味付けを保ったままできたので、sketchに投入しておく

- 各環境ディレクトリ特有の動作確認スクリプトをヘルスチェックスクリプトととしてレポに登録しておきたい。リグレッションで使い勝手いいように。
  - 名前はconfirmじゃなくてhealthcheckがいいか。

- windowsパッチファイルで複数ファイルに対してサクラエディタ のマクロよく適用させているから、まとめておきたい。visualbox上で再現撮っておきたい。

- Postgres-pgroongaにルビーのメモリに関するスクリプトあった。

- makeのマルチスレッド数こんな感じで制御するのを変数化して、デフォルトと環境個別で制御したい。

make -j$(grep '^processor' /proc/cpuinfo | wc -l)

- コンテナの使用頻度を出したい。それをリスト化してスケジューリングしたい。常に全てのイメージができている必要はないので。

- 各OSコンテナにvim,dev,tool,networkが入ったコンテナを用意しておく。

- メンテスクリプトはその場限りのパッチには先頭にPを運用していくパッチには先頭にOをつけ、分類する。
こういうのがつかえそう
```
aine@centos ~/script-env$seq -w 000 020 | awk -v FS='' '{print $1,$2,$3}'
0 0 0
0 0 1
0 0 2
0 0 3
0 0 4
0 0 5
0 0 6
0 0 7
0 0 8
0 0 9
0 1 0
0 1 1
0 1 2
0 1 3
0 1 4
0 1 5
0 1 6
0 1 7
0 1 8
0 1 9
0 2 0
```

- md-step.mdにビルド時間も抽出して埋め込みたい。

- 遅延時間を表示したい

- gron commandの使い方。
  - mediamからサジェストきた。面白い。
  - JSON Processing Pipelines with gron
  - https://medium.com/capital-one-tech/json-processing-pipelines-with-gron-6fbd531155d7

- script-repoは肥大化していく一方なので、各環境ディレクトリごとに必要なものをインストールし終えたら、削除するようにする。
  - 初回ログイン時にscript-repoを再クローンして差分更新を行えば、ディスクイメージは不用意に増やさずに、差分リフレッシュができる。💩

- perl の順列ファンクション作って思ったのは、単一スクリプトファイルを複数のosで跨いで使用する場合は最初に実行マシン搭載のosを区別する必要があってUsageを出し分ける必要がある。ライブラリのインストール方法は異なるので。

- oracleでユーザー定義ファンクションで任意の文章を受け取ってjava拡張で組み込んだMecab解析結果をコレクションとして返却するファンクションを作成したい。
  - 便利そう。おもいついた。

- twiiter認証文言テンプーレトこれ試してみようかな→rejectされたので、とても悲しい。メールアドレス１こ残っているけど大切にしないとなー。とにかく悲しい。熟考してから送信すること。
  - https://note.com/mogya/n/nbd9a720f8a5b

- sqlserver bulk imort
  - https://qiita.com/ExA_DEV/items/2d0cdff5bdd43591f7ce

- flockコマンドで排他制御できる実例 プロセスがシーケンシャルに起動されていることがflockコマンドのおかげでわかる
  - https://b.ueda.tech/?post=02709

- phpバインドもあるgroonga
  - https://www.clear-code.com/blog/category/groonga/2.html

- ruby バインドのrrooongaもあるそう
  - https://qiita.com/groonga/items/7642e9e22bcda4b4327f

- perlのflockとbashのflock
  - http://perl.no-tubo.net/2006/10/22/flock%e3%82%92%e4%bd%bf%e3%81%a3%e3%81%9f%e5%bc%b7%e5%9b%ba%e3%81%aa%e6%8e%92%e4%bb%96%e5%87%a6%e7%90%86/

- perlもある！最高である。
  - http://tsucchi.github.io/slides/yokohamapm/11/

- json日本語データ作成はpython経由がハンディかな
  - https://qiita.com/ohbarye/items/452fefa2be5d56268b50

- elasticsearch 日時指定検索
  - http://togattti.hateblo.jp/entry/2017/08/17/174953

- elasticsearch import export ダンプコマンド別途あり

  - https://qiita.com/nakazii-co-jp/items/3199433d685d0600c6d6

  - https://qiita.com/datake914/items/2313894c684a7cba992c

- compose用のレポジトリ作成しようかな
  - script-jam
  - https://github.com/YoshinoriN/docker-redmine-orchestration

- oracle import export mysqlと同じような仕組みだろう
  - https://qiita.com/toshihirock/items/86931e3c52dc47287dd2

- perlで標準入力からgroup byできそう。trdsql使えば一発だけど。
  - http://www.tohoho-web.com/perl/hash.htm

- groongaのインポートエクスポートまとめる。エクスポートのみが残っている。

- oracleのインポートエクスポートまとめる

- sqlserverのインポートエクスポートまとめる

- Nodejsとgroonga連携まとめる

- コピペチェッカー使い方調べる

- postgresへdbeaverから繋ぐ

- マイリーダー用にjsonファイルからマークダウンファイルに変換するコマンド必要なので、
スクラッチから作る。
  - https://gist.github.com/mignonstyle/083c9e1651d7734f84c99b8cf49d57fa

- 検索スピード上げるツール
  - https://qiita.com/youwht/items/7f5686a30eed16864954
  - Linux版はいけなかったので、wikiないし辞書データをgroongaに投入してコマンドで引けるようにする。

- ビルド対象を保持期間日数で管理するようにする

- 最終的には環境をダイナミックに作りたい。特にライブラリの依存関係。ソースからビルドが安全か。

  - OS名とそのバージョン　単一
  - アプリとそのバージョン　単一ないし複数
  - メモリ量　システムデフォルトとコンテナ個別
  - ユーザー名　システムデフォルトとコンテナ個別