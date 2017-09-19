#' @title atomizador de texto
#' @name atomizeText
#'
#' @description Uma função que realiza a quebra de partes de um texto em portugues em palavras.
#'
#' @param text um texto ou frases em portugues
#'
#'
#' @return um vetor com todas as palavras do texto.
#'
#' @author Luan Cenci
#'
#' @examples
#' 
#' frase <- c(”Alegações extraordinárias exigem evidências extraordinárias.”)
#'
#' atomizeText(frase)
#' 
#' @importFrom stringr str_replace_all
#' @importFrom stringr str_split
#'
#' @export
atomizeText <- function(text){
  a <- unlist(stringr::str_split(text,"\n"))
  a <- unlist(stringr::str_split(a,boundary("word")))
  a2 <- c()
  for(i in 1:length(a)){
    a2 <- c(a2, stringr::str_replace_all(a[i],"[.]|[,]|[!]|[?]|[*]|[;]",""))
  }
  a2 <- a2[a2 != ""]
  return(a2)
}

