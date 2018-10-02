#practice

# create a 100 row DF
# gender, spl, age , exp, grade , placement
library(dplyr)


gender <- sample(c("M","F"),size=100,replace = TRUE,prob = c(0.7,0.3))
gender
table(gender)
class(gender)

spl <- sample(c("Finance","Marketing","HR"),size = 100,replace=TRUE)
table(spl)

grade <- sample(c('A','B','C','D'), size = 100, replace = TRUE)
gradefac <- factor(grade,  ordered = T, levels = c('D','C','B','A'))

exp <- rnorm(100 , mean = 4, sd=1)

placement <- sample(c("Yes","No"),size=100,replace=TRUE)

age <- floor(runif(100, 21 , 30))
age

df <- data.frame(gender,spl,gradefac,placement,age,exp)
df

str(df)

write.csv(df, file = "./data/student.csv")

summary(df)

#library(dplyr) ----
str(df)
df %>% group_by(placement,gender) %>% summarise(mean(exp), max(exp) , mean(age))
df %>% filter(spl == "Marketing" & gender == "F") %>% group_by(spl) %>% summarise(mean(age),mean(exp))

#people with hight exp
df %>% group_by(spl,gender) %>% arrange(spl,gender,exp) %>%top_n(1,exp)


#plots
hist(df$age)
t1=table(df$placement)
t1
barplot(t1,col = 1:2)
boxplot(df$age)
pairs(df[,c('age','exp')])
pie(t1)

par(mfrow=c(2,2))
pie(table(df$gender))
pie(table(df$placement))
pie(table(df$grade))
pie(table(df$spl))
par(mfrow=c(1,1))


#clusterin ----
km3 =kmeans(df[,c('age','exp')],centers = 3)
km3
km3$centers
plot(df[,c('age','exp')],col=km3$cluster)

#descision tree
library(rpart)
library(rpart.plot)

tree = rpart(placement ~ . , data = df)
tree
rpart.plot(tree,nn=T,cex=0.8)
printcp(tree)

ndata = sample_n(df,5)
ndata
predict(tree, newdata = ndata , type= 'class')
predict(tree, newdata = ndata , type= 'prob')

#logistic regression
logitmodel1 = glm(placement ~ . ,data=df, family = 'binomial')
summary(logitmodel1)
#suppose model is significant with age only

logitmodel1a = glm(placement ~ age ,data=df, family = 'binomial')
summary(logitmodel1a)

logitmodel2 = glm(placement ~ age + gender ,data=df, family = 'binomial')
summary(logitmodel2)

#linear regression
linear1 = lm(age ~ . ,data=df)
summary(linear1)
