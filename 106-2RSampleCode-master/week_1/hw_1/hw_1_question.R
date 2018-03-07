### hw_1_question


########################################################### Task 1

# 查看內建資料集: 鳶尾花(iris)資料集
iris

# 使用dim(), 回傳iris的列數與欄數
dim(iris)

# 使用head() 回傳iris的前六列
head(iris)

# 使用tail() 回傳iris的後六列
tail(iris)

# 使用str() 
str(iris)

# 使用summary() 查看iris敘述性統計、類別型資料概述。
summary(iris)

########################################################### Task 2

# 使用for loop 印出九九乘法表
# Ex: (1x1=1 1x2=2...1x9=9 ~ 9x1=9 9x2=18... 9x9=81)
for(i in 1:9){
  for(j in 1:9){
    print(paste(i,"x",j ,"=", i*j))
  }
}


########################################################### Task 3

# 使用sample(), 產出10個介於10~100的整數，並存在變數 nums
nums <- sample(c(10:100),size = 10)

# 查看nums
nums

# 1.使用for loop 以及 if-else，印出大於50的偶數，並提示("偶數且大於50": 數字value)
# 2.特別規則：若數字為66，則提示("太66666666666了")並中止迴圈。
for (i in 52:66){
  if(i %% 2 == 0 & i < 66) {
    print(paste("偶數且大於50:", i)) 
  } else if(i == 66) print("太66666666666了")
}
  
  
  
  



########################################################### Task 4

# 請寫一段程式碼，能判斷輸入之西元年分 year 是否為閏年
year <- function(a){
  if (a %% 400 == 0){
    print(paste(a, "是閏年"))
  } else if (a %% 100 == 0){
    print(paste(a, "不是閏年"))
  } else if (a %% 4 == 0){
    print(paste(a, "是閏年"))
  } else {
    print(paste(a, "不是閏年"))
  }
}







########################################################### Task 5

# 猜數字遊戲
# 1. 請寫一個由電腦隨機產生不同數字的四位數(1A2B遊戲)
# 2. 玩家可重覆猜電腦所產生的數字，並提示猜測的結果(EX:1A2B)
# 3. 一旦猜對，系統可自動計算玩家猜測的次數
guess = NULL
n = 0
Ans <- sample(0:9,4)
Ans
repeat {
  for(i in c(1:4)){
    print(paste("第",i,"個數字?"))
    guess[i]<-scan(n=1,quiet=T)
  }
  a <- 0
  b <- 0
  for(i in c(1:4)){
    for(j in c(1:4)){
      if (guess[i] == Ans[j] & i == j) {
        a = a + 1
      } else if (guess[i] == Ans[j]) {
        b = b + 1
      }
    }
    
  }
  n = n + 1
  if (a == 4) {
    print("正確")
    print(paste("共猜",n,"次"))
    
    break
  } else {
    print(paste(a,"A",b,"B"))
  }
  
  print("-------------------------")

}




