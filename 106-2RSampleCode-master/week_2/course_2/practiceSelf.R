library(httr)
library(dplyr)
library(magrittr)
library(rvest)
c = NULL

html <- read_html("http://www.8591.com.tw/mallList-list.html?&group=1&searchType=0&priceSort=0&ratios=0&searchGame=22&searchServer=1778&firstRow=0&totalRows=105#menu")
repeat {
  url <- html %>%
    html_nodes("div#Col22Right > div.newPage.clearfix > div > a.next01") %>%
    html_attr("href") %>%
    paste("http://www.8591.com.tw/",.,sep = "")
  if (url != "http://www.8591.com.tw/"){
    html <- read_html(url)
  } else break
  
  txt <- html %>%
    html_nodes("ul#wc_list > li > div > a") %>%
    html_text()
  
  a <- regmatches(txt, gregexpr("【1\\:\\d+萬】",txt))
  b <- regmatches(txt, gregexpr("【1\\:\\d+\\.\\d+萬】",txt))
  a <- gsub("萬】","",a)
  b <- gsub("萬】","",b)
  for(i in 1:length(a)){
    j = length(c) + 1
    if(a[[i]] != "character(0)") {
      c[j] = strsplit(a[[i]],":")[[1]][2]
    } else {
      c[j] = strsplit(b[[i]],":")[[1]][2]
    }
  }
  
}
dat <- paste(Sys.Date(),".txt",sep = "")
write(c,file = dat)




