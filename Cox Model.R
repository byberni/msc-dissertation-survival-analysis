library(survival)
library(ggplot2)
library(ggfortify)
library(dplyr)
library(readxl)
library(shiny)
# data
df <- read_excel("4 years, merged.xlsx")
# Kaplan Meier
km <- survfit(Surv(Time, Status) ~ 1, data = df)
autoplot(km)
km1 <- survfit(Surv(Time, Death) ~ Gender, data = df) # по полу
autoplot(km1)
km2 <- survfit(Surv(Time, Death) ~ GB, data = df) # по гипертонии
autoplot(km2)
km3 <- survfit(Surv(Time, Death) ~ SD, data = df) # по сахарному диабету
autoplot(km3)
km4 <- survfit(Surv(Time, Death) ~ Regime, data = df) # по Режиму стимуляции новому
autoplot(km4)
km5 <- survfit(Surv(Time, Death) ~ TypeSSU, data = df) # по типу СССУ новому
autoplot(km5)
km6 <- survfit(Surv(Time, Death) ~ IM, data = df) # по инфаркту
autoplot(km6)
