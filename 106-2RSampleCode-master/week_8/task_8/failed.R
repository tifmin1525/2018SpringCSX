library(e1071)
library(dplyr)
library(magrittr)
raw <- read.csv("/Users/good.eddy/Documents/GitHub/106-2RSampleCode/week_8/task_8/titanicTrain.csv")
b <- raw[-c(1001:1310),]

b$boat <- as.character(b$boat)
b$boat[b$boat == "13 15 B"] <- "13 15"
for(i in 1:length(b$boat)){
  if (b$boat[i] == "") {
    b$boat[i] = "GG"
  }
}
b$survived <- as.factor(b$survived)
b$sex <- as.factor(b$sex)
b$boat <- as.factor(b$boat)


female.MeanAge = mean(b$age[b$sex == "female"], na.rm = TRUE)
male.MeanAge = mean(b$age[b$sex == "male"], na.rm = TRUE)
for(i in 1:length(b$age[b$sex == "female"])){
  if(is.na(b$age[b$sex == "female"][i])){
    b$age[b$sex == "female"][i] = female.MeanAge
  }
}

for(i in 1:length(b$age[b$sex == "male"])){
  if(is.na(b$age[b$sex == "male"][i])){
    b$age[b$sex == "male"][i] = male.MeanAge
  }
}

a <- b %>%
  filter(boat !="GG" & survived == 0) %>%
  group_by(survived) 

aa <- b %>%
  filter(boat == "GG" & survived != 0) %>%
  group_by(survived)

false <- rbind(a,aa)

trainc <- data.frame(survived = b$survived, age = b$age,sex = b$sex, boat = b$boat)

trainset <- subset(trainc, select = -survived)
y <- b$survived
model <- svm(survived ~ boat + sex + age, data = trainc)
pred_result <- predict(model, trainset)
confus.matrix = table(pred_result, y)
confus.matrix
sum(diag(confus.matrix))/sum(confus.matrix)

test <- read.csv("/Users/good.eddy/Documents/GitHub/106-2RSampleCode/week_8/task_8/titanicQuestion.csv")
  
test$boat <- as.character(test$boat)
for(i in 1:length(test$boat)){
  if (test$boat[i] == "") {
    test$boat[i] = "GG"
  }
}
test$survived <- as.factor(test$survived)
test$sex <- as.factor(test$sex)
test$boat <- as.factor(test$boat)


female.MeanAge = mean(test$age[test$sex == "female"], na.rm = TRUE)
male.MeanAge = mean(test$age[test$sex == "male"], na.rm = TRUE)
for(i in 1:length(test$age[test$sex == "female"])){
  if(is.na(test$age[test$sex == "female"][i])){
    test$age[test$sex == "female"][i] = female.MeanAge
  }
}

for(i in 1:length(test$age[test$sex == "male"])){
  if(is.na(test$age[test$sex == "male"][i])){
    test$age[test$sex == "male"][i] = male.MeanAge
  }
}
testc <- data.frame(survived = test$survived, age = test$age,sex = test$sex, boat = test$boat)

testset <- subset(testc, select = -survived)
pred_result <- predict(model, testset)

















