# Coursera: Exploratory analysis - Assignement 1
# plot 1
# getting and cleaning data
if (!file.exists("household_power_consumption.txt")) {
       url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
       download.file(url, "hpc.zip", method = "curl")
       unzip("hpc.zip")
       file.remove("hpc.zip")
}
hpc<-read.table("household_power_consumption.txt",
                sep = ";", 
                stringsAsFactors = FALSE,
                header = TRUE,
                na.strings = "?")
hpc$datetime<-as.POSIXct(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")
hpc_sub<-subset(hpc, datetime >= "2007-02-01" & datetime < "2007-02-03")
rm("hpc")
# histogram of Global Active Power
png("plot1.png")
hist(hpc_sub$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
