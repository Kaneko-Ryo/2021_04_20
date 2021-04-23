#!/usr/bin/bash

set +x #コマンドの非表示
value=$1
errorMsg="This Value is Error" #エラーメッセージ
expr $value + 1 > /dev/null 2>&1 #正しい値かどうか判定
ret=$? #判定結果の取得

if [ $((ret)) -lt $((2)) ]; then #正しい値
#正しい値の時
#if [ $((value)) -gt $((1)) ]; then #2以上の時
#2からvalueまで繰り返し
    for ((i=2 ; i<=$((value)) ; i++))
    do
            if [ $((i)) -gt $((2)) ]; then #iが2より大きいとき
                #2からiまで繰り返し
                for ((j=2 ; $((j))<$((i)) ; j++))
                do
                    n=$((i%j)) #割り切れたら素数じゃない
                    if [ $((n)) -eq $((0)) ]; then
                        break #ループ終了
                    fi
                    
                    #最後まで割り切れなかったら素数
                    if [ $((i-1)) -eq $((j)) ]; then
                    echo $i #出力
                    fi
                done
            elif [ $((i)) -eq $((2)) ]; then #iが2の時
                echo $i #2を出力
            fi
    done
else #間違い値の時
echo $errorMsg #エラーメッセージ出力
#fi
fi
set -x #コマンドの非表示解除