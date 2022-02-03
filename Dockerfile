FROM ruby:2.5.1

# yarnをインストールするための準備
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# 必要なツールをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs yarn

# ルート直下にwebappという名前で作業ディレクトリを作成（コンテナ内のアプリケーションディレクトリ）
RUN mkdir /myapp 
WORKDIR /myapp

# nvmをインストールしてnodejsを安定版にする ~ではなくrootを使わないと失敗する
RUN git clone git://github.com/creationix/nvm.git /root/.nvm && \  
    echo . /root/.nvm/nvm.sh >> ~/.bashrc && \ 
    . /root/.bashrc && \
    nvm install --lts

# ホストのGemfileとGemfile.lockをコンテナにコピー
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

# bundle installの実行
RUN bundle install

# ホストのアプリケーションディレクトリ内をすべてコンテナにコピー
ADD . /myapp

# puma.sockを配置するディレクトリを作成
RUN mkdir -p tmp/sockets
