# https://cran.r-project.org/web/packages/wbstats/vignettes/Using_the_wbstats_package.html

library(rtweet)
library(twitteR)

library(ggplot2)
library(dplyr)

library(tidytext)

library(cronR)

library(miniUI)
library(shiny)
library(shinyFiles)

library(taskscheduleR)

library(wbstats)

########################################################

# Find available data with wb_cachelist
data <- str(wb_cachelist, max.level = 1)

# Access updated available data with wbcache()
new_cache <- wbcache()

# Search available data with wbsearch()
unemploy_vars <- wbsearch(pattern = "unemployment")
head(unemploy_vars)
blmbrg_vars <- wbsearch(pattern = "Bloomberg", fields = "surceOrg")
head(blmbrg_vars)
povemply_vars <- wbsearch(pattern = "poverty|unemployment|employment")
head(povemply_vars)
wb_cachelist_es <- wbcache(lang = "es")
gini_vars <- wbsearch(pattern = "Coeficiente de Gini", cache = wb_cachelist_es)
head(gini_vars)

# Download data with wb()
pop_data <- wb(indicator = "SP.POP.TOTL",
               startdate = 2000,
               enddate = 2002)
head(pop_data)
pop_data <- wb(country = c("ABW", "AF", "SSF", "ECA"),
               indicator = "SP.POP.TOTL",
               startdate = 2012,
               enddate = 2012)
head(pop_data)
pop_gdp_long <- wb(country = c("US", "NO"), indicator = c("SP.POP.TOTL", "NY.GDP.MKTP.CD"),
                   startdate = 1971, enddate = 1971)
head(pop_gdp_long)
pop_gdp_wide <- wb(country = c("US", "NO"), indicator = c("SP.POP.TOTL", "NY.GDP.MKTP.CD"),
                   startdate = 1971, enddate = 1971, return_wide = TRUE)
head(pop_gdp_wide)

# Use mrv
eg_data <- wb(country = c("IN"), indicator = 'EG.ELC.ACCS.ZS', mrv = 1)
eg_data
eg_data <- wb(country = c("IN"), indicator = 'EG.ELC.ACCS.ZS', mrv = 3)
eg_data
# You can increase this value and it will return no more than the
# mrv value. However, if mrv is greater than the number of available
# data it will return less

# Use gapfill = TRUE
# Because gapfill returns data that does not reflect actual observed
# values, use this option with care.
eg_data <- wb(country = c("IN"), indicator = 'EG.ELC.ACCS.ZS', mrv = 10, gapfill = TRUE)
eg_data

# Use POSIXct = TRUE
oil_data <- wb(indicator = "CRUDE_BRENT", mrv = 10, freq = "M", POSIXct = TRUE)
head(oil_data)
# This next step requires ggplot2
oil_data <- wb(indicator = c("CRUDE_DUBAI", "CRUDE_BRENT", "CRUDE_WTI", "CRUDE_PETRO"),
               startdate = "2012M01", enddate = "2014M12", freq = "M", POSIXct = TRUE)
ggplot(oil_data, aes(x = date_ct, y = value, colour = indicator)) + geom_line(size = 1) +
  labs(title = "Crude Oil Price Comparisons", x = "Date", y = "US Dollars")
gold_data <- wb(indicator = "GOLD", mrv = 120, freq = "M", POSIXct = TRUE)
plat_data <- wb(indicator = "PLATINUM", mrv = 60, freq = "M", POSIXct = TRUE)
metal_data <- rbind(gold_data, plat_data)
ggplot(metal_data, aes(x = date_ct, y = value, colour = indicator)) + geom_line(size = 1) +
  labs(title = "Precious Metal Prices", x = "Date", y = "US Dollars")

# Most Recent Values
per_data_1 <- wb(country = "all", indicator = 'per_lm_ac.cov_pop_tot', mrv = 1)
per_data_1
per_data_2 <- wb(country = "all", indicator = 'per_lm_ac.cov_pop_tot', mrv = 2)
per_data_2

# Searching In Other Languages
cache_en <- wbcache()
sum(is.na(cache_en$indicators$indicator))
cache_es <- wbcache(lang = "es")
sum(is.na(cache_es$indicators$indicator))

f <- system.file(package = "cronR",
                 data,
                 "helloworld.R")

cmd <- cron_rscript(f)
cmd

cron_add(command = cmd, frequency = 'minutely', id = 'test1', description = 'My process 1', tags = c('lab', 'xyz'))
cron_add(command = cmd, frequency = 'daily', at='7AM', id = 'test2')
cron_njobs()

cron_ls()
cron_clear(ask=FALSE)
cron_ls()

cmd <- cron_rscript(f, rscript_args = c("productx", "arg2", "123"))
cmd
cron_add(cmd, frequency = 'minutely', id = 'job1', description = 'Customers')
cron_add(cmd, frequency = 'hourly', id = 'job2', description = 'Weather')
cron_add(cmd, frequency = 'hourly', id = 'job3', days_of_week = c(1, 2))
cron_add(cmd, frequency = 'hourly', id = 'job4', at = '00:20', days_of_week = c(1, 2))
cron_add(cmd, frequency = 'daily', id = 'job5', at = '14:20')
cron_add(cmd, frequency = 'daily', id = 'job6', at = '14:20', days_of_week = c(0, 3, 5))
cron_add(cmd, frequency = 'daily', id = 'job7', at = '23:59', days_of_month = c(1, 30))
cron_add(cmd, frequency = 'monthly', id = 'job8', at = '10:30', days_of_month = 'first', days_of_week = '*')
cron_add(cmd, frequency = '@reboot', id = 'job9', description = 'Good morning')
cron_add(cmd, frequency = '*/15 * * * *', id = 'job10', description = 'Every 15 min')   
cron_ls()
cron_clear(ask=FALSE)

cron_save("cron.backup")

# name <- "Creative Block"
# key <- ""
# secret <- ""
# token <- create_token(app_name = name,
#                       consumer_key = key,
#                       consumer_secret = secret,
#                       access_token = access_token,
#                       access_secret = access_secret)

# setup_twitter_oauth("consumer-key",
#                     "consumer-secret",
#                     "access-token",
#                     "access-secret")
# 
# terms <- c("Trump", "trump")
# 
# terms_search <- paste(terms, collapse = " OR ")
# 
# trump <- searchTwitter(terms_search, n = 1000, lang = "en")
# trump <- twListToDF(trump)
# 
# write.table(trump,
#             "C:\Users\14438\Documents\creativeblock\trump.csv",
#             append = T,
#             row.names = F,
#             col.names = T,
#             sep = ",")




