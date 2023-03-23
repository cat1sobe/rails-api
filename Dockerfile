#baseimage、rubyをインストールする
FROM ruby:3.0.0

#Linuxなどで用いられるパッケージ管理ツール、最新情報にアップデートする
RUN apt-get update -qq && apt-get install -y build-essential

RUN mkdir /app
WORKDIR /app

#GemfileをDocker環境にCOPYする
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem update --system \
 && gem install bundler:2.2.3 \
  && bundle config set force_ruby_platform true

RUN bundle install

#Dockerイメージとローカルをマウントすることでローカルと紐付けて開発できる
COPY . /app



