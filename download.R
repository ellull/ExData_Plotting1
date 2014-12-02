url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("data")){
  dir.create("data")
}

temp <- "./data/temp.zip"
download.file(url,temp, method="curl")
unzipped <- unzip(temp, exdir="./data")
unlink(temp)
