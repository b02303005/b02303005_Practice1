library(httr)

#爬蟲的頁面：PCHome搜尋"macbook air 13"後的搜尋結果
url <- "https://ecshweb.pchome.com.tw/search/v3.3/all/results?q=macbook%20air%2013&page=1&sort=rnk/dc"
get_url <- GET(url)
get_url_json = content(get_url)
do.call(rbind,get_url_json$prods)

#輸入dataframe
macbook_air_dataframe <- data.frame(do.call(rbind,get_url_json$prods))

#整理出有興趣的部分（商品名稱、敘述、目前售價、標準定價）
my_macbook_air_dataframe <- macbook_air_dataframe[,c("name","describe","price","originPrice")]

#顯示我整理後的新dataframe
View(my_macbook_air_dataframe)




