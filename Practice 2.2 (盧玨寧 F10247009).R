#Homework 2 (Week 3 class)

#Homework 2 (Week 3 class)
library(dplyr)
library(tidyr)

rairuoho = read.table('C:/Users/j0893/OneDrive/桌面/Rcourse/Week3/rairuoho.txt', header=T, sep='\t', dec='.')
rairuoho

rairuoho = dplyr::select(rairuoho, -row, -column) #delete meaningless part
rairuoho$treatment = ifelse(rairuoho$treatment == 'nutrient', 'enriched', 'water')
name_mix = paste0(rairuoho$spatial1, '_', rairuoho$spatial2)
rairuoho$spatial = name_mix
rairuoho = dplyr::select(rairuoho, -spatial1, -spatial2)
rairuoho

rairuoho_long = pivot_longer(rairuoho, cols = day3:day8, names_to = "day", values_to = "length")
rairuoho_long
