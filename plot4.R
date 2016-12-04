
# Зчитування даних
dataframe <- read.csv("C:/temp/household_power_consumption.txt", header=TRUE, dec=".",sep=";")

# Очищення всіх полів з "?"
cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]


cleanframe$Global_active_power = as.numeric(levels(cleanframe$Global_active_power))[cleanframe$Global_active_power]
cleanframe$Voltage = as.numeric(levels(cleanframe$Voltage))[cleanframe$Voltage]
cleanframe$Sub_metering_1 = as.numeric(levels(cleanframe$Sub_metering_1))[cleanframe$Sub_metering_1]
cleanframe$Sub_metering_2 = as.numeric(levels(cleanframe$Sub_metering_2))[cleanframe$Sub_metering_2]
cleanframe$Sub_metering_3 = as.numeric(levels(cleanframe$Sub_metering_3))[cleanframe$Sub_metering_3]
cleanframe$Global_reactive_power = as.numeric(levels(cleanframe$Global_reactive_power))[cleanframe$Global_reactive_power]
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")

par(mfrow=c(2,2))

# Графік 1
plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_active_power"]
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Global Active Pover (kilowatts)")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))

# Графік 2
plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Voltage"]
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Voltage")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))

# Графік 3
plot(plotdata1,type="l",xaxt="n", xlab="", ylab="Energy sub metering")
lines(plotdata2, type="l",col="red")
lines(plotdata3, type="l",col="blue")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
legend(1200,38, c("Sub metering 1","Sub metering 2","Sub metering 3"),  col=c("black","red","blue"), lty=1)

# Графік 4
plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_reactive_power"]
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Global Rective Pover")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))

# Зберігання зображення
dev.copy(device = png, filename = 'C:/temp/Plot4.png', width = 480, height = 480)
dev.off ()


