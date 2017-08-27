# Files Loader
loaderFiles <- function(url,edicao,paginas,dia){
  
  curl::curl_download(url,"url.pdf")
  orig <- pdftools::pdf_text("url.pdf")[paginas]
  
  ibagens <- pdftools::pdf_convert("url.pdf",format = 'png',pages = paginas,dpi = 300)
  
  t <- tesseract::ocr(ibagens,engine = tesseract::tesseract(language = 'por'))
  
  datas <- rep(dia,length(paginas))
  
  edicoes <- rep(edicao,length(paginas))
  
  dados <- data.frame(datas,edicoes,paginas,t)
  
  return(dados)
}