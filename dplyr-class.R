
install.packages("dplyr")
library(dplyr)


?mtcars

dplyr::filter(mtcars, mpg > 25 & am == 1)
filter(mtcars, mpg > 25 & am == 1)


mtcars %>% filter(mpg > 25 & am ==1) %>% arrange(wt) 
mtcars %>% filter(mpg > 25 & am ==1) %>% arrange(wt) %>% count()

count(mtcars)

mtcars %>% group_by(am) %>% summarise(mean(mpg))




#mutate----
mutate(mtcars, displ_l = disp / 61.0237) #keeps other col
transmute(mtcars, displ_l = disp / 61.0237) #removes other cols
mutate(mtcars, cyl = NULL) #do not display cyl


#slice-----
slice(mtcars, 1L)
slice(mtcars, n())
slice(mtcars, 5:n())
slice(mtcars, c(2,4,5,10))

#summarise----
summarise(mtcars, mean(disp))  
summarise(group_by(mtcars, cyl), mean(disp)) 
summarise(group_by(mtcars, cyl), m = mean(disp), sd = sd(disp))


#summarise_all
mtcars %>% group_by(am, gear) %>% summarise_all(mean)
mtcars %>% group_by(am, gear)%>% summarise_all(c("min", "max"))
mtcars %>% group_by(am, gear)%>% summarise_all(funs(med = median))







