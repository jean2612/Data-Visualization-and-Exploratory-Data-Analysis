library(ggplot2)
library(scales) 
rm(list = ls())
setwd("C:/Users/jeanl/Desktop/FURG/Data Visualization and Exploratory Data Analysis/Class-10-24/")

# Create data[
my.data <- read.csv("data_mortalidade_Regiao.csv", check.names = F)
dados <- my.data[-c(0,6),]

# Exer01
ggplot(dados, aes(x=Região, y=Total)) + 
  geom_bar(stat = "identity")

#Exer02
ggplot(dados, aes(x=Região, y=Total)) + 
  geom_bar(stat = "identity", color="black", fill="darkorange2")

#Exer03
ggplot(dados, aes(y = Total, x=Região, fill = Região)) +
  geom_bar(stat = "identity", color="black") +
  scale_fill_brewer(palette = "Set3")

#Exer04
ggplot(dados, aes(y = Total, x=Região, fill=Região)) +
  geom_bar(stat="identity", color="black")+
  scale_fill_manual(values=c("blue",
                             "darkolivegreen3",
                             "plum4",
                             "red",
                             "yellow3"))

#Exer05
ggplot(dados, aes(y = Total, x=reorder(Região, Total), fill=Região)) +
  geom_bar(stat="identity", color="black")+
  scale_fill_manual(values=c("blue",
                             "darkolivegreen3",
                             "plum4",
                             "red",
                             "yellow3"))

#Exer07
ggplot(dados, aes(y = Total, x=reorder(Região, Total), fill=Região)) +
  geom_bar(stat="identity", color="black")+
  scale_fill_manual(values=c("blue",
                             "darkolivegreen3",
                             "plum4",
                             "red",
                             "yellow3"))+
  labs(y = "Total de Mortes", x = "", title="Mortes no Brasil por região em 2021")

#Exer08
ggplot(dados, aes(x = Total, y=reorder(Região, Total), fill=Região)) +
  geom_bar(stat="identity", color="black") +
  scale_fill_manual(values=c("#66CDAA",
                             "darkolivegreen3",
                             "plum4",
                             "#FA8072",
                             "yellow3")) +
  labs(x = "Total de Mortes", y = "", title="Mortes no Brasil por região em 2021")+
  scale_x_continuous(labels = comma_format(big.mark = ".", decimal.mark = ","))+
  theme_light(12) +
  theme(legend.position = "right", panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank())
