adjustDate <- function(days){
  library(stringr);library(stringi)
     days <- tolower(days)
     meses <- tolower(c("janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"))
    alterado <- c()
    cc <- str_replace_all(days,"(de)","/")
     i = 1;j =1
      for(i in 1:length(days)){
        citado = tolower(str_extract(cc[i],"([a-z]+| [A-Z]+)"))
        while((meses[j] == citado) == FALSE){
          j=j+1
        }
        alterado <- c(alterado,str_replace(cc[i],citado,as.character(j)))
        j <- 1
      }
     
     alterado <- str_replace_all(alterado," ","/")
     alterado <- str_replace_all(alterado,"///","/")
     ano <- str_extract(alterado,"/\\d{4}")
     ano <- str_replace(ano,"/","")
     alterado <- str_replace(alterado,"/\\d{4}","")
     mes <- str_extract(alterado,"/\\d+")
     mes <- str_replace(mes,"/","")
     alterado <- str_replace(alterado,"/\\d+","")
     
     data <- as.Date(paste0(ano,"-",mes,"-",alterado))
    return(data)
}


a <- "10 de dezembro de 2017"

adjustDate(a)


