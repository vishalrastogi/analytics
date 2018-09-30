(grades = sample(c(LETTERS[1:4]), size = 30 ,replace = T ,prob=c(0.4,0.2,0.3,0.1)))

(gradesF = factor(grades))

summary(grades)

summary(gradesF)

table(grades)

table(gradesF)
class(gradesF)
(gradesF0 = factor(grades, ordered = T))
summary(gradesF0)
(gradesF01 = factor(grades, ordered=T, levels=c('B','C','A','D')))
summary(gradesF01)

(marks = ceiling(rnorm(30,60,5)))
(gender = factor(sample(c('M','F'),size = 30, replace= T)))
(student1 = data.frame(marks,gender ,gradesF01))
boxplot(marks ~ gradesF01, data=student1)
boxplot(marks ~ gradesF01 +gender , data=student1)

boxplot(marks)
summary(marks)
abline(h=summary(marks))
quantile(marks)
