#!/bin/bash

echo SUMMARY

RETRY_MX_CNT=10

#gitignore整備
ls -l ~/script_env | grep -P '^d' | awk '{print $9}' | xargs -I@ echo cp ~/script_env/.gitignore ~/script_env/@/.gitignore | sh

#作業ディレクトリに移動
cd ~/script_env

BUILD_START=$(date '+%s')

#初回ビルド開始
bash ~/script_env/docker-build-parallel.sh &

#psコマンドで検索できるように少しまつ
sleep 10

printf "starting docker init build proccess.\n"
printf "waiting for docker init build proccess done.\n"

#docker buildプロセスがヒットしなくなるまで、まつ
while $(ps aux | grep 'docker build' | grep -vq 'grep')
do
  sleep 1
done

BUILD_END=$(date '+%s')

#すこし待った分差し引く
BUILD_ELAPSED=$(expr $BUILD_END - $BUILD_START - 10)

printf "docker init build process has done.ending docker init build proccess.elapsed time[%s(seconds)]\n" $BUILD_ELAPSED

echo

for ((RETRY_ROUND_CNT=1;RETRY_ROUND_CNT<=$RETRY_MX_CNT;RETRY_ROUND_CNT++));do

  BUILD_START=$(date '+%s')

  printf "starting docker retry $RETRY_ROUND_CNT round build proccess.\n"
  printf "waiting for docker retry $RETRY_ROUND_CNT round all build proccess done.\n"

  #初回ビルドに失敗したイメージに関してはリカバリ時間を短縮するために、到達可能なStepまでのキャッシュを作成しておく
  #リトライログ用にRETRY_ROUND_CNTを引数に渡す
  bash ~/script_env/docker-build-parallel-retry.sh $RETRY_ROUND_CNT &

  #psコマンドで検索できるように少しまつ
  sleep 10

  #docker buildプロセスがヒットしなくなるまで、まつ
  while $(ps aux | grep 'docker build' | grep -vq 'grep')
  do
    sleep 1
  done

  BUILD_END=$(date '+%s')

  #すこし待った分差し引く
  BUILD_ELAPSED=$(expr $BUILD_END - $BUILD_START - 10)

  printf "docker retry $RETRY_ROUND_CNT round build process has done.ending docker retry $RETRY_ROUND_CNT round build proccess.elapsed time[%s(seconds)]\n" $BUILD_ELAPSED
done

git add .gitignore
git add --all * 1>/dev/null 2>&1
git commit -m "環境構築" 1>/dev/null 2>&1

git status

echo DETAILS #この行以降に詳細ログを追記されていく
