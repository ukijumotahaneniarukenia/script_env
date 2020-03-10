#!/bin/bash

#perl使う予定
usage(){
  cat <<EOS
Usage:
  $0 script-env script-repo
EOS
exit 0
}

ENV_REPO="$1";shift
INSTALLER_REPO="$1";shift

[ -z $ENV_REPO ] && usage
[ -z $INSTALLER_REPO ] && usage

#env-build-arg.mdにあってDockerfile.doneにないもの
while read dir;do
  echo $dir
  OS_VERSION=$(echo $dir | grep -Po '[a-z]+(-[0-9]{1,}){1,}')
  while read arg;do
    while read cmd;do
      echo "( export $arg;export OS_VERSION=$OS_VERSION;export REPO=$INSTALLER_REPO;echo \"$cmd\")" | bash | grep -Po "$OS_VERSION.+\.sh"
    done < <(grep VERSION.sh $dir/Dockerfile.done)
  done < <(grep VERSION $dir/env-build-arg.md)
done < <(find $HOME/$ENV_REPO -mindepth 1 -type d | grep -vP '\.git|docker-log' )

#Dockerfile.doneにあってenv-build-arg.mdにないもの

#repoからファイル抽出
#find $HOME/script-repo -type f | grep -vP '\.git|md$'
