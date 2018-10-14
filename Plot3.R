# plot 3.R

# read the file into the variable data frame
household_power_consumption <- read.csv("C:/Users/sgupta456/Desktop/SupriyaG/New Innings/Learing/Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt",header=TRUE, sep=";",na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# take the data between only 2007-02-01 and 2007-02-02
hpc<- subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

# change the variable to numeric
hpc$Global_active_power<- as.numeric(hpc$Global_active_power)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)

# plot the histogram
with(hpc, { plot(Sub_metering_1~Datetime,ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')})

# set the annotations
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=2, legend = c("Sub_metering_1","sub_metering_2", "sub_metering_3"))
# copy the plot to a png file
dev.copy(png,file="plot3.png", height=480, width=480)
dev.off()