FROM ruby:3.2.2-slim

# 必要なパッケージのインストール
RUN apt-get update -qq && \
  apt-get install -y build-essential \
  default-libmysqlclient-dev \
  nodejs \
  yarn \
  git \
  pkg-config

WORKDIR /app

# GemfileとGemfile.lockだけを先にコピー
COPY Gemfile Gemfile.lock ./

# bundlerのインストールとgemのインストール
RUN gem install bundler && \
  bundle config set force_ruby_platform true && \
  bundle install

# その他のファイルをコピー
COPY . .

EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]
