### webpackerをインストール
`rails webpacker:install`

### EC2で起動する場合の変更点
docker-compose.ymlのplatformnの記述を削除<br>
config.application.rbにconfig.hosts << "ドメイン名"を追加

### テストデータ
ユーザー名: 1@gmail.com<br>
パスワード:  aaaaaa<br>

ユーザー名は@の前の数字を変えるだけで色々なユーザーデータでログインできます



### httpにする
・docker-compsoe.ymlの以下を削除<br>
- /etc/letsencrypt/live/protan.site/fullchain.pem:/ssl/server.crt<br>
- /etc/letsencrypt/live/protan.site/privkey.pem:/ssl/server.key<br>

ポートを
port: 80:80にする

・nginx.confの以下を削除<br>
proxy_set_header X-Forwarded-Proto https;

listen80にする