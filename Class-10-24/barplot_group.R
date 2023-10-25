library(ggplot2)
library(tidyverse)
library(RColorBrewer)
#library(showtext)
library(scales)
rm(list = ls())
setwd("C:/Users/jeanl/Desktop/FURG/Data Visualization and Exploratory Data Analysis/Class-10-24/")
my.data<-read.csv("data_mortalidade_Regiao.csv")
new.names<-c("Região", "<1", "1~4", "5~9", "10~14", "15~19", "20~29", "30~39", "40~49", "50~59", "60~69", "70~79", ">80", "Ignorada", "Total")
colnames(my.data)<-new.names
dados <- my.data[-c(6),-c(0,15)]
my.data<-dados%>%
  pivot_longer(
    cols = -c(1),
    names_to = "FaixaEtaria",
    values_to = "NroMortes"
  )
my.data$FaixaEtaria<-factor(my.data$FaixaEtaria,levels = new.names)
sort(my.data$FaixaEtaria)

#Exer01
ggplot(my.data, aes(x = Região, y=NroMortes, fill=FaixaEtaria)) +
  geom_bar(stat="identity", color="black", position=position_dodge())+
  scale_y_continuous(labels = comma_format(big.mark = ".", decimal.mark = ","))+
  scale_fill_brewer(palette = "Paired")+
  labs(y = "Total de Mortes", x = "", title="Mortes no Brasil por região em 2021")

#Exer02
ggplot(my.data, aes(x = Região, y=NroMortes, fill=FaixaEtaria)) +
  geom_bar(stat="identity", color="black")+
  scale_y_continuous(labels = comma_format(big.mark = ".", decimal.mark = ","))+
  scale_fill_brewer(palette = "Set3")+
  labs(y = "Total de Mortes", x = "", title="Mortes no Brasil por região em 2021")

#Exer03
ggplot(my.data, aes(x = Região, y=NroMortes, fill=FaixaEtaria)) +
  geom_bar(stat="identity", color="black", position = "fill")+
  scale_y_continuous(labels = comma_format(big.mark = ".", decimal.mark = ","))+
  scale_fill_brewer(palette = "Paired")+
  labs(y = "Total de Mortes", x = "", title="Mortes no Brasil por região em 2021")

#Exer04
ggplot(my.data, aes(x = Região, y=FaixaEtaria, fill=NroMortes)) +
  geom_tile(stat="identity")+
  scale_fill_distiller(palette = "Spectral")

#Exer05
ggplot(my.data, aes(x = Região, y=FaixaEtaria, fill=NroMortes)) +
  geom_tile(stat="identity", color="black")+
  geom_text(aes(label=NroMortes))+
  scale_fill_distiller(palette = "Spectral")



