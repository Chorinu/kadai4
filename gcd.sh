#!/bin/bash

a=$1
b=$2

#引数の数が2でない場合
if [ $# -lt 2 ];then
	echo "入力引数が足りません"
	exit 1
fi

if [ $# -gt 2 ];then
	echo "入力引数が多すぎます"
	exit 1
fi 

#整数以外が入力された場合
expr $a + 1 > /dev/null 2>$1
if [ $? -eq 2 ] ;then
	echo "1つ目の引数が整数ではありません"
	exit 1
fi

expr $b + 1 > /dev/null 2>$1
if [ $? -eq 2 ] ;then
         echo "2つ目の引数が整数ではありません"
         exit 1
fi

#自然数でない場合
if [ "$a" -lt 0 ] ;then
	echo "1つ目の引数が自然数ではありません"
	exit 1
fi

if [ "$b" -lt 0 ] ;then
	echo "2つ目の引数が自然数ではありません"
	exit 1
fi

#2つの引数の大小を確認
#a<bだった場合はa>bになるようにする
if [ "$a" -lt "$b" ];
then
	a=$2
	b=$1
fi

#最大公約数を計算
while [ ! $b -eq 0 ];do
	x=$((a%b))
	a="$b"
	b="$x"
done
echo "$a"

rm $1
