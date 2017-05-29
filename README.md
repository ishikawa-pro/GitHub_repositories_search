#iOS / Android課題

##仕様
Hubのrepository search APIを使って、検索結果を一覧表示するアプリを作成。  
検索はインクリメンタルサーチをする。  
今回はユーザー認証していないため、10リクエスト/分の制限がある。そのためインクリメンタルサーチは、SearchBarへ文字を入力してから1秒間次の文字の入力がなければ行われるようにしている。また、１分以内に9回リクエストが発生した場合は、１分が経過するまでインクリメンタルサーチが行われないようになり、キーボードのSearchボタンでの検索用に１回残しておく。

