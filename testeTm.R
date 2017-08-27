library(tm)

vs <- VectorSource(textos[1,4])

temp <- Corpus(vs)

#Coloca tudo em minúsculo
wc_corpus <- tm_map(temp, tolower)

#Tira a pountuação e palavras ruído
wc_corpus <- tm_map(wc_corpus, removePunctuation)
wc_corpus <- tm_map(wc_corpus, removeWords, stopwords('portuguese'))

#Cria a frequência de palavras
td_mtx <- TermDocumentMatrix(wc_corpus, control = list(minWordLength = 3))
v <- sort(rowSums(as.matrix(td_mtx)), decreasing=TRUE)
df <- data.frame(word=names(v), freq=v,row.names = 1:length(v))

parePalavras <- stopwords('portuguese')