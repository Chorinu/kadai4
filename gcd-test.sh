#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"


#テスト1－1（正常終了）
./gcd.sh 4 12 > $result
echo "4" > $ans
diff $ans $result || echo "error in test1-1" >> $err

#テスト1－2（正常終了）
./gcd.sh 273 390 > $result
echo "39" > $ans
diff $ans $result || echo "error in test1-2" >> $err 

#テスト2－1（引数が少ない）
echo "入力引数が足りません" > $ans
./gcd.sh 5 > $result 
diff $ans $result || echo "error in test2-1" >> $err

#テスト2－2（引数が多い）
echo "入力引数が多すぎます" > $ans
./gcd.sh 5 15 98 > $result
diff $ans $result || echo "error in test2-2" >> $err

#テスト3－1（引数の1つ目に文字を指定）
./gcd.sh a 3 > $result
echo "1つ目の引数が整数ではありません" > $ans
diff $ans $result || echo "error in test3-1" >> $err

#テスト3－2（引数の2つ目に文字を指定）
./gcd.sh 3 a > $result
echo "2つ目の引数が整数ではありません" > $ans
diff $ans $result || echo "error in test3-2" >> $err

#テスト3－3（引数の1つ目に小数を指定）
./gcd.sh 1.5 3 > $result
echo "1つ目の引数が整数ではありません" > $ans
diff $ans $result || echo "error in test3-3" >> $err

#テスト3－4（引数の2つ目に小数を指定）
./gcd.sh 3 1.5 > $result
echo "2つ目の引数が整数ではありません" > $ans
diff $ans $result || echo "error in test3-4" >> $err

#テスト3－5（引数の1つ目に負の数を指定）
 ./gcd.sh -5 3 > $result
echo "1つ目の引数が自然数ではありません" > $ans
diff $ans $result || echo "error in test3-5" >> $err

#テスト3－6（引数の2つ目に負の数を指定）
 ./gcd.sh 3 -5 > $result
echo "2つ目の引数が自然数ではありません" > $ans
diff $ans $result || echo "error in test3-6" >> $err

#エラーログが1つでもあればエラー内容を表示
if [ -f "$err" ]; then
	cat $err
	rm /tmp/$$-*
	exit 1
fi
