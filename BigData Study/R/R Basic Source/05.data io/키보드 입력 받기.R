# scan() 함수를 이용하면 숫자를 입력 받을 수 있다.
print('정수 입력')
num <- scan()
# 10
# 20
# 30
# 40
# 50

# 키보드 입력을 종료하려면 엔터 키를 누르면 된다.
num

length(num)
sum(num)

members <- scan(what = character())
members
# 김철수
# 강감찬
# 이순신

for( mem in  members){
  cat(mem, '님 안녕하세요', '\n')
}


print('edit 편집기')
df <- data.frame()# 데이터프레임 생성
df = edit(df)# 데이터 편집기
df
#     name age
# 1 김철수 100
# 2 박영희 200
df = edit(df)
df
