library(rvest)
library(XML)
library(magrittr)

all_data <- matrix(ncol=10,nrow=0)

for (tyear in 2013:2017){
    stockURL <- paste("http://www.boxofficemojo.com/yearly/chart/?page=1&view=releasedate&view2=domestic&yr=",tyear,"&p=.htm",sep="")

    sdat1 <- html(stockURL)  %>% 
      html_nodes("table") %>%
      extract2(4) %>%
      html_nodes("td") %>%
      html_text()
    temp <- matrix(sdat1[15:914],nrow=100,byrow = TRUE)
    
    all_temp <- cbind(rep(tyear,100),temp)
    
    all_data <- rbind(all_data,all_temp)
}

BoxofficeDF <- data.frame(all_data)
colnames(BoxofficeDF) <- c("Year","Yearly_Ranking","Title","Studio","Total_Gross","Number_of_Theaters","Open_Date_Gross","Number_of_Open_Date_Theaters","Open_Date","End_Date")

write.table(BoxofficeDF,file="/Users/Eric/Documents/R study/Final Project/BoxofficeDF.csv",row.names=FALSE,sep=",")
