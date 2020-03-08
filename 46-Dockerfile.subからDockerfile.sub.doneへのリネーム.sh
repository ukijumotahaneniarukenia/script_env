#!/bin/bash

usage(){
cat <<EOS
Usage:
  $0 script-env
EOS
exit 0
}

REPO=$1;shift

[ -z $REPO ] && usage

while read tgt;do
  if [ -f $tgt/Dockerfile.sub.done ];then
    #Dockerfile.sub.doneが存在する場合はクレンジングをしない
    :
  elif [ -f $tgt/Dockerfile.sub.undone ];then
    #Dockerfile.sub.undoneが存在する場合は着手はしたが完了していない状態のため、個別対応スクリプトを用意して、ここではクレンジングしない
    :
  else
    #Dockerfile.sub.doneが存在しない場合はクレンジングをする
    RT="$(cat $tgt/Dockerfile.sub | grep -v OS_VERSION)"
    if [ -z "$RT" ];then
      #OS_VERSION以外が検出できなければ、クレンジング完了とする
      echo "mv $tgt/Dockerfile.sub $tgt/Dockerfile.sub.done" | bash
      echo "git rm $tgt/Dockerfile.sub" | bash
    else
      :
    fi
  fi
done < <(find $HOME/$REPO -mindepth 1 -type d | grep -vP '\.git|docker-log')
