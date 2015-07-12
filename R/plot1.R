setwd("~/Desktop/R")
tab=read.table("household_power_consumption.txt", header=TRUE, sep=";")
x=as.Date(tab$Date, format="%d/%m/%Y")
tab$Date=x
tab_temp=tab[tab$Date=="2007-02-01",]
tab_temp=rbind(tab_temp,tab[tab$Date=="2007-02-02",])
y=strptime(paste(tab_temp$Date, tab_temp$Time), "%Y-%m-%d %H:%M:%S")
tab_temp=tab_temp[,-1]
tab_temp$Time<-y

par(bg='white')
###plot 1 ###
hist(as.numeric(as.character(tab_temp$Global_active_power)), xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red')
dev.copy(png, file='plot1.png')
dev.off()
