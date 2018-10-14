# plot 2.R

# read the file into the variable data frame
household_power_consumption <- read.csv("C:/Users/sgupta456/Desktop/SupriyaG/New Innings/
                                        Learing/Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", 
                                        header=TRUE, sep=";")

# take the data between only 2007-02-01 and 2007-02-02
hpc<- subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

# change the variable to numeric
hpc$Global_active_power<- as.numeric(hpc$Global_active_power)
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(hpc$Date), hpc$Time)
hpc$Datetime <- as.POSIXct(datetime)

# plot the histogram
with(hpc, plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab=""))
# copy the plot to a png file
png("plot1.png", width=480, height=480)
dev.off()