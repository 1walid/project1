#Crypto
setwd("~/Desktop/Crypto/")
data<- read.csv("all_currencies.csv")

summary(data)
str(data)

head(data)

#split by Symbol
data_split <- split(data,data$Symbol)

library(ggplot2)
library(dplyr)
volume_plot <- ggplot(data, aes(x=Date, y=Volume))
volume_plot + geom_line(aes(group=Symbol))


median(data$Volume,na.rm = T)

filtered_volume <- data  %>%
  filter(Volume>350)

volume_plot <- ggplot(filtered_volume, aes(x=Date, y=log(Volume)))
volume_plot + geom_line(aes(group=Symbol))

btc_eth <- data %>%
  filter(Symbol=='BTC'|Symbol=='ETH')
  
volume_plot <- ggplot(btc_eth, aes(x=Date, y=Close, group=Symbol))
volume_plot + geom_line(aes(color=Symbol))

