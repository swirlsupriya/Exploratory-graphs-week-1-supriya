# plot 4.R

# read the file into the variable data frame
household_power_consumption <- read.csv("C:/Users/sgupta456/Desktop/SupriyaG/New Innings/Learing/Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# take the data between only 2007-02-01 and 2007-02-02
hpc<- subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

# change the variable to numeric
hpc$Global_active_power<- as.numeric(hpc$Global_active_power)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)

# create the matrix of 2*2 to plot 4 graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# plot the first graph 
with(hpc, plot(Global_active_power~Datetime, type="l",
               ylab="Global Active Power", xlab=""))
# plot the second graph
with(hpc, plot(Voltage~Datetime, type="l",
               ylab="Voltage", xlab=""))
# plot the 3rd graph 
with(hpc, { plot(Sub_metering_1~Datetime, type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=2, legend = c("Sub_metering_1","sub_metering_2", "sub_metering_3"))
# plot the 4th graph 
with(hpc, plot(Global_reactive_power~Datetime, type="l",
               ylab="Global reactive power", xlab=""))

# copy to a apng file
dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()