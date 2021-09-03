# assign working directory because r is the only code that doesnt run relative
# to the fucking directory i run it in
# SET THIS YOURSELF 
setwd("/Users/cademccumber/projects/SAV")

# assign to dataframes
median_income <- read.csv(file="median_income.csv")
reservations <- read.csv(file="reservations2020.csv")

# first row of this file is bullshit, delete it
median_income = median_income[-c(1),]

# add column to dataframe for join, cut from full ID
median_income$customerzip = substr(median_income$GEO_ID, 10, 14)

# clean up the zip codes with extensions
# for example, some zips are 99709-6072 or 997070681
reservations$customerzip <- strtrim(reservations$customerzip, 5)

# merge the two into a new dataset via a natural join
# this means you only keep the rows where there is a match, think
# the inner portion of the venn diagram
combined <- merge(median_income, reservations, by="customerzip", all=FALSE)

# Write the information to a new csv file for future use
write.csv(combined, file="combined.csv")

# exit gracefully
quit(status = 0)

#-------------------------------------------------------------------------------
# information from dataframes for testing everything combined right.
# The length of the combined dataframe should be the length of the two
# frames we are joining, - 1. This is because we are joining on customerzip,
# so there shouldn't be two customerzip columns, they should merge.
#-------------------------------------------------------------------------------
# test it worked:
length(names(reservations)) + length(names(median_income)) - 1 == length(names(combined))

head(median_income)
head(reservations)
names(median_income)
names(reservations)
length(names(median_income))
length(names(reservations))
length(names(combined))

