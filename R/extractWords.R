#' @title extrator de Termos
#' @name extractWords
#'
#' @description um função que retorna palavras ou termos compostos dentro de um texto em portuges.
#'
#' @param text um texto ou frases em portugues
#' @param targetWords vetores contendo termos ou termos compostos
#'
#' @return retorna todos os termos pedidos nas targetsWords, mesmo se repetirem no texto.
#'
#' @author Luan Cenci
#'
#' @examples
#' 
#' frase <- c(”Alegações extraordinárias exigem evidências extraordinárias.”)
#' 
#' palavra <- "evidência"
#'
#' atomizeText(frase,palavra)
#' 
#' @importFrom stringr str_extract_all
#'
#' @export
extractWords <- function(text,targetWords){
  
  extractWords <- c()
  i <- 0
  
  for(i in 1:length(text)){
    extractWords <- c(extractWords,stringr::str_extract_all(text[i],targetWords))
  }
  
  return(unlist(extractWords))
}



