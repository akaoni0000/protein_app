### webpackerをインストール
`rails webpacker:install`

### EC2で起動する場合の変更点
docker-compose.ymlのplatformnの記述を削除<br>
config.application.rbにconfig.hosts << "ドメイン名"を追加

### テストデータ
ユーザー名: 1@gmail.com<br>
パスワード:  aaaaaa<br>

ユーザー名は@の前の数字を変えるだけで色々なユーザーデータでログインできます

