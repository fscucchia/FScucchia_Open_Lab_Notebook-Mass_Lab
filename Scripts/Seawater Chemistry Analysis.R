##### SEAWATER CHEMISTRY ANALYSIS FOR DISCRETE MEASUREMENTS#####
###read in probe measurements of pH, temperature, and salinity and TA calculated from titrations

#Scripts created by Hollie Putnam https://github.com/hputnam

######Read in required libraries#####
library(plotrix) 
library(seacarb) 
library(tidyverse)
library(dplyr)

SW.chem <- readxl::("RAnalysis/Data/Water parameters pH adults.xls", header=TRUE, sep=",", na.strings="NA") #load data with a header, separated by commas, with NA as NA

SW.chem$TA.micomol.kg <- as.numeric(SW.chem$TA.micomol.kg)

#Calculate CO2 parameters using seacarb
#pHscale="T", total scale pH 
# kf="pf", "pf" for using Kf from Perez and Fraga (1987)
# k1k2="l", "l" for using K1 and K2 from Lueker et al. (2000)
# ks="d" 	"d" for using Ks from Dickson (1990) 
#flag = 8 pH and ALK given
carb.output <- carb(flag=8, var1=SW.chem$pH.total, var2=SW.chem$TA.micomol.kg/1000000, S= SW.chem$Salinity.psu, T=SW.chem$Temperature.C, P=0, Pt=0, Sit=0, pHscale="T", kf="pf", k1k2="l", ks="d") #calculate seawater chemistry parameters using seacarb
carb.output$ALK <- carb.output$ALK*1000000 #convert to µmol kg-1
carb.output$CO2 <- carb.output$CO2*1000000 #convert to µmol kg-1
carb.output$HCO3 <- carb.output$HCO3*1000000 #convert to µmol kg-1
carb.output$CO3 <- carb.output$CO3*1000000 #convert to µmol kg-1
carb.output$DIC <- carb.output$DIC*1000000 #convert to µmol kg-1
carb.output <- carb.output[,-c(1,4,5,8,10:13,19)] #subset variables of interest
carb.output <- cbind(SW.chem$Date, SW.chem$Treatment, SW.chem$Tank, carb.output) #combine the sample information with the seacarb output
colnames(carb.output) <- c("Date", "Treatment", "Tank",	"Salinity", "Temperature", "pH",	"CO2",	"pCO2","HCO3",	"CO3",	"DIC", "TA",	"Aragonite.Sat") #Rename columns to describe contents

carb.output <- carb.output[,c(3,4:13)]

chem.table.summary <- carb.output %>% 
  group_by(Tank) %>%
  summarise_each(funs(mean,sd,std.error))

chem.table.summary <- chem.table.summary %>% 
  mutate_at(vars(Salinity_mean, Salinity_sd, Salinity_std.error), round, 1) %>%
  mutate_at(vars(Temperature_mean, Temperature_sd, Temperature_std.error), round, 2) %>%
  mutate_at(vars(pH_mean, pH_sd, pH_std.error), round, 3) %>%
  mutate_at(vars(CO2_mean, CO2_sd, CO2_std.error,
                 pCO2_mean, pCO2_sd, pCO2_std.error,
                 HCO3_mean, HCO3_sd, HCO3_std.error,
                 CO3_mean, CO3_sd, CO3_std.error,
                 DIC_mean, DIC_sd, DIC_std.error,
                 TA_mean, TA_sd, TA_std.error,
                 Aragonite.Sat_mean, Aragonite.Sat_sd, Aragonite.Sat_std.error), round, 1) 



write.table(chem.table.summary, "pH_eperiment_Seawater_chemistry_table_Output_Mean_SD_SEM.csv", sep=",", row.names = FALSE) #save data

