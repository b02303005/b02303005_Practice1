library(readxl)
library(ggplot2)

#從World Bank、中華民國主計處抓下兩岸經貿相關的Excel檔案，並輸入Excel檔案到R

file_path<-"/Users/Eric/Documents/R study/Week3/Week3 Data.xlsx"
China_and_Taiwan_Trade_Data<-data.frame(read_excel(file_path))

#檢查資料的結構
str(China_and_Taiwan_Trade_Data)

#圖表一：中國自台灣進口額（plot圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015,y=Import.from.Taiwan))+geom_point()+xlab("Year")+ylab("Import Amount From Taiwan ")+ggtitle("China Import Amount From Taiwan (USD)")

#圖表二：中國進口總額（plot圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015,y=Total.Import))+geom_point()+xlab("Year")+ylab("Total Import Amount")+ggtitle("China Total Import Amount(USD)")

#圖表三：中國自台灣進口額佔中國進口總額比例（line圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015,y=Import.from.Taiwan/Total.Import))+geom_line()+xlab("Year")+ylab("Import From Taiwan Ratio")+ggtitle("China Import From Taiwan Ratio")

#圖表四：台灣在中國的投資額（plot圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015,y=Foreign.Direct.Investment.from.Taiwan))+geom_point()+xlab("Year")+ylab("FDI Amount From Taiwan")+ggtitle("China FDI Amount From Taiwan (USD)")

#圖表五：中國接受的外資總額（plot圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015,y=Total.Foreign.Direct.Investment))+geom_point()+xlab("Year")+ylab("Total FDI Amount")+ggtitle("China Total FDI Amount (USD)")

#圖表六：台灣在中國的投資額佔中國接受的外資總額比例（line圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015,y=Foreign.Direct.Investment.from.Taiwan/Total.Foreign.Direct.Investment))+geom_line()+xlab("Year")+ylab("FDI from Taiwan Ratio")+ggtitle("China FDI From Taiwan Ratio")

#圖表七：比較“中國自台灣進口比例”、“台資佔中國接受的外資總額比例”之趨勢（line圖）
ggplot(China_and_Taiwan_Trade_Data,aes(x=1990:2015))+geom_line(aes(y=Import.from.Taiwan/Total.Import),colour="blue")+geom_line(aes(y=Foreign.Direct.Investment.from.Taiwan/Total.Foreign.Direct.Investment),colour="green")+xlab("Year")+ylab("Ratio")+ggtitle("Green:China FDI From Taiwan Ratio    Blue:China Import From Taiwan Ratio")



