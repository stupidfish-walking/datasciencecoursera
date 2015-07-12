setwd("~/Desktop/R")
tab=read.table("household_power_consumption.txt", header=TRUE, sep=";")
x=as.Date(tab$Date, format="%d/%m/%Y")
tab$Date=x
tab_temp=tab[tab$Date=="2007-02-01",]
tab_temp=rbind(tab_temp,tab[tab$Date=="2007-02-02",])
y=strptime(paste(tab_temp$Date, tab_temp$Time), "%Y-%m-%d %H:%M:%S")
tab_temp=tab_temp[,-1]
tab_temp$Time<-y

###plot 3###
plot(tab_temp$Time, as.numeric(as.character(tab_temp$Sub_metering_1)), type="l", ylab='Energy sub metering', xlab="")
lines(tab_temp$Time, as.numeric(as.character(tab_temp$Sub_metering_2)), col='red')
lines(tab_temp$Time, as.numeric(as.character(tab_temp$Sub_metering_3)), col='blue')
legend("topright", legend=c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red','blue'), lty=c(1,1))
dev.copy(png, file='plot3.png')
dev.off()
