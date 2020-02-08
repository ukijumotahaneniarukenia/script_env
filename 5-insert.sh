#!/bin/bash

#Usage
#第一引数が見つかった指定行の直下に第二引数を差し込む
#$./c.sh 'ARG OS_VERSION' 'ARG GIT_VERSION'

TGT_WORD="$1"
AHEAD_WORD="$2"

while read tgt;do

  TGT_FILE=$(echo $tgt | tr ':' '\n' | sed -n '1p')
  TGT_ROWN=$(echo $tgt | tr ':' '\n' | sed -n '2p')

  printf "sed -i \x27%si%s\x27 %s\n" "$(($TGT_ROWN+1))" "$AHEAD_WORD" "$TGT_FILE"

done < <(grep -n -P "$TGT_WORD" -r . | grep -P 'Dockerfile')