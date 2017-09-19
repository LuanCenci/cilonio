#' @title Eliminador de stopwords
#' @name stopWopdsRemoction
#'
#' @description retirar as stopwords em portugues que contem dentro de um texto
#'
#' @param wordList listas de palavras que devem ser eliminadas as stopwords
#' @param stopList data frame contendo as stopwords em portugues 
#'
#'
#' @return um vetor sem as stopWords.
#'
#' @author Luan Cenci
#'
#' @examples
#' 
#' lista <- ("e","o","índio")
#' 
#' stopWordsRemoction(lista,StopList)
#'
#' @export
stopWordsRemoction <- function(wordList,stopList){
  b <- c()
  b <- c("o","a","os","as","um","uma","uns","umas")
  b <- ifelse(listaPalavras %in% stopList$stopWords,NA,listaPalavras)
  b <- ifelse(tolower(b) %in% stopList$stopWords,NA,b)
  b <- ifelse(tolower(b) %in% letters, NA,b)
  b <- ifelse(b %in% "",NA,b)
  b <- na.omit(b)
  return(b)
}