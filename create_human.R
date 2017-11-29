
library(dplyr)

#read data from the net 
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#hd has 195 observations and 8 variables, integers, numbers, and character
str(hd)
dim(hd)
summary(hd)

#gii has 195 observations and 8 variables, also integers, numbers, and characters
str(gii)
dim(gii)
summary(gii)

#shorten volumn names in both tables.
colnames(hd)[1] <- "HDI_rank"
colnames(hd)[2] <- "country"
colnames(hd)[3] <- "HDI"
colnames(hd)[4] <- "life_expect"
colnames(hd)[5] <- "expect_edu"
colnames(hd)[6] <- "mean_edu"
colnames(hd)[7] <- "GNI_per_capita"
colnames(hd)[8] <- "GNI_per_capita_minus_HDA_rank"
colnames(gii)[1] <- "GII_rank"
colnames(gii)[2] <- "country"
colnames(gii)[3] <- "GII"
colnames(gii)[4] <- "maternal_mort"
colnames(gii)[5] <- "adolescent_birth"
colnames(gii)[6] <- "per_representation"
colnames(gii)[7] <- "fem_sec_edu"
colnames(gii)[8] <- "male_sec_edu"
colnames(gii)[9] <- "female_labor"
colnames(gii)[10] <- "male_labor"

#make new columns based on F/M ratio
gii <- mutate(gii, sec_edu_F_to_M = (fem_sec_edu/male_sec_edu))
gii <- mutate(gii, lab_F_to_M = (female_labor/male_labor))

#Join tables by the country name.
join_by <- c("country")
human <- inner_join(hd, gii, by = join_by)

#The new table has 195 observations and 19 variables, as expected. The file is written to a csv file. 
str(human)
dim(human)
summary(human)
write.csv(human, file = "C:/HY-Data/LEIGH/course material/introduction_to_open_data_science/IODS_project_6_nov/data/human.csv", 
          row.names = FALSE)



