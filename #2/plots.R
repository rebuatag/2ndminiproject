# load the package data.table 
library(data.table)

# Reading the data using fread from data.table library with missing values = ?
power <- fread("../specdata/household_power_consumption.txt", na.strings = "?")

# Filtering the dates that will be used for this problem
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]

# I created the figures folder to store plots png files
# If the folder exists then it won't create one, else it would
if (!file.exists('figures')){
    dir.create('figures')
}

################################################################################
#PLOT 1

# Creating the png file of specified size 480 by 480 using the png() graphic device
# This outputs a png file stored in figures folder
# In this case it outputs the png file for plot1
png("figures/plot1.png", width = 480, height = 480, units = 'px')

# Creating the first plot using hist function with 
# main title = Global Active Power and x-axis label = Global Active Power (kilowatts)
# color = red of the bar graph
hist(
    power$Global_active_power,
    xlab = "Global Active Power (kilowatts)",
    ylab = "",
    main = "Global Active Power",
    col = "Red"
)

# Shutting down the specified graphic device, in this case I used png 
dev.off()

################################################################################
#PLOT 2

# Using as.Date to convert the Date column to the specified format (d/m/y) of Date class
power$Date <- as.Date(power$Date, '%d/%m/%Y')

# Using as.POSIXct function to convert the Date and Time and storing it to DateTime column
power$DateTime <- as.POSIXct(paste0(power$Date, power$Time))

# Creating the png file of specified size 480 by 480 using the png() graphic device
# This outputs a png file stored in figures folder
# In this case it outputs the png file for plot2
png("figures/plot2.png", width = 480, height = 480, units = 'px')

# Aside from hist() function, we can also use plot() to create a plot of arguments given.
# In this case, I created a plot with x = DateTime and y = Global active power.
# type is an attribute to specify the type of plot, in this case I used l = lines.
# xlab and ylab corresponds to the x-axis label and y-axis label.
plot(
    power$DateTime,
    power$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatts)"
)

# Shutting down the specified graphic device, in this case I used png
dev.off()

################################################################################
#PLOT 3

# Creating the png file of specified size 480 by 480 using the png() graphic device
# This outputs a png file stored in figures folder
# In this case it outputs the png file for plot3
png("figures/plot3.png", width = 480, height = 480, units = 'px')

# Using the plot() function to create a plot of arguments given.
# In this case, I created a plot with x = DateTime and y = Sub Metering 1.
# As for the type of plot I used l = lines.
# xlab and ylab corresponds to the x-axis label and y-axis label.
plot(
    power$DateTime,
    power$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy Sub Metering"
)

# Creating the lines to join in the plot
# As seen in the image, the red color is the line for the DateTime and Sub Metering 2
# Blue is for the line for the DateTime and Sub Metering 3
lines(power$DateTime, power$Sub_metering_2,col = 'red')
lines(power$DateTime, power$Sub_metering_3,col = 'blue')

# Creating the legend to add in the plots as I used or plot 3 data
# Here I have specified the position of the legend on the topright
# col here are the color that appears on the legend, in this case black, blue and red
# legend is the character or label for each corresponding color
# lty refers to the line type 
legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1)

# Shutting down the specified graphic device, in this case I used png
dev.off()

################################################################################
#PLOT 4 - this plot includes 4 plots 

# Creating the png file of specified size 480 by 480 using the png() graphic device
# This outputs a png file stored in figures folder
# In this case it outputs the png file for plot3
png("figures/plot4.png", width = 480, height = 480, units = 'px')

# par here is used to set the layout of the plots
# as speficied in mfrow the layout will be a 2 by 2 by rows
par(mfrow = c(2,2))

# In this plot, I created a plot with x = DateTime and y = Global active power.
# type is an attribute to specify the type of plot, in this case I used l = lines.
# xlab and ylab corresponds to the x-axis label and y axis label = Global Active Power (kilowatts).
# This plot is located in the top left
plot(
    power$DateTime,
    power$Global_active_power,
    type = "l",
    xlab = "",
    ylab = "Global Active Power (kilowatt)"
)

# In this plot, I created a plot with x = DateTime and y = Voltage.
# type is an attribute to specify the type of plot, in this case I used l = lines.
# xlab and ylab corresponds to the x-axis label = date time and y axis label = Voltage.
# This plot is located in the top right
plot(
    power$DateTime,
    power$Voltage,
    type = "l",
    xlab = "datetime",
    ylab = "Voltage"
)

# Using the plot() function to create a plot of arguments given.
# In this case, I created a plot with x = DateTime and y = Sub Metering 1.
# As for the type of plot I used l = lines.
# xlab and ylab corresponds to the x-axis label and y-axis label.
# This plot is located in the bottom left
plot(
    power$DateTime,
    power$Sub_metering_1,
    type = "l",
    xlab = "",
    ylab = "Energy Sub Metering"
)

# Creating the lines to join in the plot
# As seen in the image, the red color is the line for the DateTime and Sub Metering 2
# Blue is for the line for the DateTime and Sub Metering 3
lines(power$DateTime, power$Sub_metering_2,col = 'red')
lines(power$DateTime, power$Sub_metering_3,col = 'blue')

# Creating the legend to add in the plots as I used or plot 3 data
# Here I have specified the position of the legend on the topright
# col here are the color that appears on the legend, in this case black, blue and red
# legend is the character or label for each corresponding color
# lty refers to the line type 
# bty refers to the type of box around the legend, if set to 'n' there will be no box drawn
legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1, bty = 'n')

# Using the plot() function to create another plot of arguments given.
# In this case, I created a plot with x = DateTime and y = lobal reactive power
# As for the type of plot I used l = lines.
# xlab and ylab corresponds to the x-axis label = datetime and y-axis label = Global reactive power.
# This plot is located in the bottom right
plot(
    power$DateTime,
    power$Global_reactive_power,
    type = "l",
    xlab = "datetime",
    ylab = "Global_reactive_power"
)

# Shutting down the specified graphic device, in this case I used png
dev.off()

