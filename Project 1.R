# Part I: There are 20 files with .dat extention.

getwd()

list.files()

file_list <- list.files()

combineFiles <- function(file_list){
for (file in file_list){
  
  # if the merged dataset doesn't exist, create it
  if (!exists("dataset")){
    dataset <- read.table(file, header=TRUE, sep="\t")
  }
  
  # if the merged dataset does exist, append to it
  if (exists("dataset")){
    temp_dataset <-read.table(file, header=TRUE, sep="\t")
    dataset<-rbind(dataset, temp_dataset)
    rm(temp_dataset)
  }
  return(dataset)
}
}

filelist <- list.files(pattern = ".dat")

combinedDataset <- combineFiles(filelist)

combinedDataset

summary(combinedDataset)


#Part II : The data is present in xml format, with file name, iris.xml.

install.packages("XML")
library("XML")

??xmlToDataFrame()

xmlToDf <- xmlToDataFrame(doc = "iris.xml")

xmlToDf

getwd()


#Part III: Convert the iris data into the JSON format and read the data in JSON format and convert it into dataframe "iris_data". 

install.packages("rjson")
library("rjson")

iris

?toJSON

json_test <- toJSON(iris)

json_test

list.files()

?fromJSON

iris_data <- fromJSON(json_test)

iris_data


#Part IV: Use dplyr function on the data iris_data. 
# Implement select, match, filter, arrange, rename, and mutate function on the iris_data.

install.packages("dplyr")
library(dplyr)

?select
select(iris_data$Petal.Length)

select(.data = iris_data)

?match

match(iris_data,iris)

?filter

iris_data

?as.list

iris_list <- as.list(iris_data)
iris_list

filter_(.data = iris_list, iris_list$Sepal.Length > 2)

?rename

iris_data <- rename(.data = iris_data, iris_data$Species = "Groups")


#Part V: Print the summary of iris_data 

summary(iris_data)