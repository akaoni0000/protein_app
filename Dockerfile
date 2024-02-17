FROM ruby:3.0.5

# yarnとnodejsをインストール
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
&& apt-get install -y nodejs
RUN npm install --global yarn

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /myapp 
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /myapp

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

# herokuにupするときはコメントアウトを外す
# ENV RAILS_ENV=production
# COPY start.sh /start.sh
# RUN chmod 744 /start.sh
# CMD ["sh", "/start.sh"]

