# load required libraries
library(dataRetrieval)
library(EGRET)

# Gather Temperature and Discharge data 
siteID <-     # 8 digit site code
startDate <-  # empty quotes gets earliest date
endDate <-    # e.g., "2013-06-15"
temp_and_discharge_param <- c("00010","00060") # 5 digit USGS parameter codes for temp and discharge
DailyTempAndDischarge <- getDVData(siteID, temp_and_discharge_param, startDate, endDate) # or other parameter info

# Gather sample data
parameter_code <- "<paramater_code>" # 5 digit USGS parameter code for chemical, use "" for all available data
sample <- getSampleData(siteID, parameter_code, startDate, endDate)

# Gather site and parameter metadata(site)
INFO <- getMetaData(siteID, parameter_code, interactive = FALSE)
INFO$shortname <- <"e.g., Arkansas River at downtown bridge, Pueblo, CO">
INFO <- setPA()

# Merge Temperature + Discharge with Sample Data
sample <- mergeReport()

# ----------------------------------

# Check Flow History Data





