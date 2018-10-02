# xts  - create object and export data
install.packages("xts")
library(xts)
######### creating 30 dates data
(startdt = as.Date("2018-09-01", format="%Y-%m-%d"))
(sep_days = startdt + 0:29)
class(sep_days)
(stprice=matrix(floor(rnorm(90,mean = 100,sd=10)),ncol=3,byrow = F))
(ts_xts_sep = xts(x=stprice,order.by=sep_days))
colnames(ts_xts_sep) = c('SBI','ICICI','HDFC')
ts_xts_sep
plot(ts_xts_sep)
class(ts_xts_sep)
#########

#create matrix : 1 col for 1 share
(stockprices = matrix(c(100,103, 105, 205, 210, 207, 530, 500, 535), ncol=3, byrow = F))
(cdtindex = c('25-09-2018', '27-09-2018', '28-09-2018'))
#convert to date format
(dtindex = as.Date(cdtindex, format="%d-%m-%Y"))

#now we have index + matrix for xts object

(ts_xts = xts(x=stockprices, order.by=dtindex))


#this series is not continuous but has missing dates

#-----
#matrix data extract
coredata(ts_xts)
coredata(ts_xts_sep)
#extract dates
index(ts_xts)
index(ts_xts_sep)


#write to csv file
write.zoo(ts_xts, "./data/zoodata.csv")

write.zoo(ts_xts_sep, "./data/zoodata.csv")
