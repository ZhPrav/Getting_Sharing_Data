
## Read source data from txt files

x_train <- read.table("X_train.txt")
x_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")

## read names vector

con_x <- file("features.txt")
x_names <- readLines(con_x)
close(con_x)
x_names <- strsplit(x_names, " ")
x_names <- sapply(x_names, function(x) {x[2]})

## name for an additional colunm with activities

x_names <- c(x_names, "activities", "subject")


## read activities

activities <- readLines(file("activity_labels.txt"))
activities_split = strsplit(activities, " ")

## adding activity vectors to the data sets

xy_train <- cbind(x_train, y_train)
xy_train <- cbind(xy_train, subject_train)
xy_test <-  cbind(x_test, y_test)
xy_test <-  cbind(xy_test, subject_test)

## merging of train and test sets

xy_full <- rbind(xy_train, xy_test)

## assigning names for xy_full

colnames(xy_full) <- x_names

# replace activities codes with activity description

for(i in 1:6) {
xy_full$activities <- sub(activities_split[[i]][1], activities_split[[i]][2], xy_full$activities) }

# extract only the measurements on the mean and standard deviation for each measurement

xy_mean_std <- xy_full[, grepl("[Mm]ean|[Ss]td", names(z_full))]

# removes parenthesis, commas and minus chars from variables names

colnames(xy_mean_std) <- sub("\\)", "", sub("\\(", "", names(xy_mean_std)))
colnames(xy_mean_std) <- sub("\\,", "", sub("-", "", names(xy_mean_std)))

#write the data set to a file

write.csv(xy_mean_std, file = "xy_mean_std.csv")

# creating a second data set with averaged by activities + subject values

library(reshape2)
melt_df <- melt(xy_mean_std, id = c("activities", "subject"))
avr_df <- dcast(melt_df, activities + subject ~ variable, mean)

# write the avr_df into csv file

write.csv(avr_df, file = "avr_act_subject.csv")
