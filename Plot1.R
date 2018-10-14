# plot 1.R

# read the file into the variable data frame
household_power_consumption <- read.csv("C:/Users/sgupta456/Desktop/SupriyaG/New Innings/
  Learing/Exploratory Data Analysis/Week 1/Assignment/household_power_consumption.txt", 
  header=TRUE, sep=";")

# take the data between only 2007-02-01 and 2007-02-02
hpc<- subset(household_power_consumption,Date %in% c("1/2/2007","2/2/2007"))

# change the variable to numeric
hpc$Global_active_power<- as.numeric(hpc$Global_active_power)

# plot the histogram
hist(hpc$Global_active_power, main="Global Active Power", col="red", 
     xlab = "Global Active Power")
# copy the plot to a png file
png("plot1.png", width=480, height=480)
dev.off()