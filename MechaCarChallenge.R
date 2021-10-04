#DELIVERABLE 1

library(dplyr)

MechaCar_df <- read.csv(file = 'MechaCar_mpg.csv',check.names = F, stringsAsFactors = F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_df)) 



lm(vehicle_length ~ mpg,MechaCar_df)
summary(lm(vehicle_length ~ mpg,MechaCar_df))

lm(vehicle_weight ~ mpg,MechaCar_df)
summary(lm(vehicle_weight ~ mpg,MechaCar_df))

lm(spoiler_angle ~ mpg,MechaCar_df)
summary(lm(spoiler_angle ~ mpg,MechaCar_df))

lm(ground_clearance ~ mpg,MechaCar_df)
summary(lm(ground_clearance ~ mpg,MechaCar_df))

lm(AWD ~ mpg,MechaCar_df)
summary(lm(AWD ~ mpg,MechaCar_df))

lm(mpg ~ mpg,MechaCar_df)
summary(lm(mpg ~ mpg,MechaCar_df))


cor(MechaCar_df$vehicle_length, MechaCar_df$mpg)
cor(MechaCar_df$vehicle_weight, MechaCar_df$mpg)
cor(MechaCar_df$spoiler_angle, MechaCar_df$mpg)
cor(MechaCar_df$ground_clearance, MechaCar_df$mpg)
cor(MechaCar_df$AWD, MechaCar_df$mpg)


# DELIVERABLE 2

MechaCar_tbl <- read.csv(file = 'suspension_coil.csv',check.names = F, stringsAsFactors = F)

summary_table <- MechaCar_tbl %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI=var(PSI), Stdev_PSI=sd(PSI), .groups = 'keep') #create summary table

lot_summary <- MechaCar_tbl  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Var_PSI=var(PSI), Stdev_PSI=sd(PSI), .groups = 'keep') #create lot summary table


# DELIVERABLE 3

t.test(lot_summary$Mean_PSI, mu=1500) 

t.test(MechaCar_tbl$PSI, mu=1500) 

Lot_1 <- subset(MechaCar_tbl, Manufacturing_Lot = "Lot1")
Lot_2 <- subset(MechaCar_tbl, Manufacturing_Lot = "Lot2")
Lot_3 <- subset(MechaCar_tbl, Manufacturing_Lot = "Lot3")

t.test(Lot_1$PSI, mu=1500)
t.test(Lot_2$PSI, mu=1500)
t.test(Lot_3$PSI, mu=1500)