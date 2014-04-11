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
INFO$shortname <- <string "e.g., Arkansas River at downtown bridge, Pueblo, CO">
INFO <- setPA()

# Merge Temperature + Discharge with Sample Data
sample <- mergeReport()

# ----------------------------------

# Check flow history data
annualSeries <- makeAnnualSeries()
plotFlowSinge(istat=7, qUnit="thousandCfs")
plotSDLogQ()
plotFour(qUnit=3)
plotFourStats(qUnit=3)


# Check sample data
boxConcMonth()
boxQTwice()
plotLogConcTime()
plotConcTime()
plotConcQ()
plotLogConcQ()
plotLogFluxQ()
multiPlotDataOverview()

# ----------------------------------

# Run WRTDS model
modelEstimation()

# ----------------------------------
 
# CHECK MODEL RESULTS

# Require sample + info variables
plotConcTimeDaily()
plotFluxTimeDaily()
plotConcPred()
plotfluxPred()
plotLogconcPred()
plotResidPred()
plotResidQ()
plotResidTime()
boxResidMonth()
boxConcThree()

# Require annualResults + info variables
plotConcHist()
plotFluxHist()

# Multi-line plots
date1 <- "<date1>"
date2 <- "date2>"
date3 <- "date3>"
qBottom <- 100
qTop <- 5000

plotLogConcQSmooth(date1, date2, date3, qBottom, qTop, concMax=2, concMin=0.1, qUnit=1) )
plotConcQSmooth(date1, date2, date3, qBottom, qTop, concMax=2, qUnit=1)

q1 <- 10
q2 <- 25
q3 <- 75
centerDate <- "0701"
plotConcTimeSmooth(q1, q2, q3, centerDate, 2000, yearEnd)

# Multiplots
fluxBiasMulti()

# Contour plots:
clevel <- seq(0, 2.0, 0.5)
maxDiff <- 0.8
yearStart <- 2000
yearEnd <- 2010

plotContours(yearStart, yearEnd, qBottom, qTop, contourLevels = clevel, qUnit = 1)
plotDiffContours(yearStart, yearEnd, qBottom, qTop, maxDiff, qUnit=1)

# Unit cheat sheets
printqUnitCheatSheet()

printFluxUnitCheatSheet()

