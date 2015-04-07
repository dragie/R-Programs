install.packages("tm")
install.packages("SnowballC")
install.packages("qdap")
install.packages("qdapDictionaries")
install.packages("dplyr")
install.packages("RColorBrewer")
install.packages("ggplot2")
install.packages("scales")
install.packages("Rgraphviz")

library(tm) # Framework for text mining.
library(SnowballC) # Provides wordStem() for stemming.
library(qdap) # Quantitative discourse analysis of transcripts.
library(qdapDictionaries)
library(dplyr) # Data preparation and pipes %>%.
library(RColorBrewer) # Generate palette of colours for plots.
library(ggplot2) # Plot word frequencies.
library(scales) # Include commas in numbers.
library(Rgraphviz) # Correlation plots.

getSources()
getReaders()

cname <- file.path (".", "corpus", "txt")
length(dir(cname))
dir(cname)
docs <- Corpus(DirSource(cname))

#to read pdf files
#docs <- Corpus(DirSource(cname), readerControl =list (reader=readPDF))

#word documents
#docs <- Corpus(DirSource(cname), readerControl =list (reader=readDOC))
#specifying character string argument
#docs <- Corpus(DirSource(cname), readerControl =list (reader  =readDOC  ("-r -s")))

#inspect(docs[1])

getTransformations()

toSpace <- content_transformer( function(x, pattern) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/--")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

# docs <- tm_map(docs, toSpace, "/|@|\\|")

docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeWords, stopwords("english"))

length(stopwords("english"))
stopwords("english")

docs <- tm_map (docs, removeWords, c("m", "th"))
docs <- tm_map(docs, stripWhitespace)

toString <- content_transformer(function(x, from, to) gsub(from, to, x))
docs <- tm_map(docs, toString, "united states", "US")

docs <- tm_map(docs, stemDocument)

dtm <- DocumentTermMatrix(docs)
#class(dtm)
#dim(dtm)

tdm <- TermDocumentMatrix(docs)

freq <- colSums(as.matrix(dtm))
ord <- order(freq)
freq[head(ord)]
#freq(ord)
freq[tail(ord)]
#frequency of frequncies
head(table(freq), 15)
head(tail(freq), 15)

m <- as.matrix(dtm)
dim(m)

## Error in vector(typeof(x$v), nr * nc) : vector size cannot be NA
## In addition: Warning message:
## In nr * nc : NAs produced by integer overflow

write.csv(m, file="dtm.csv")

dtms <- removeSparseTerms(dtm, 0.1)
freq <- colSums(as.matrix(dtms))
freq
table(freq)
findFreqTerms(dtm, lowfreq = 50)
findAssocs(dtm, "data", corlimit = 0.0)

plot(dtm, terms = findFreqTerms(dtm, lowfreq = 50)[1:50], colThreshold = 0.5)

plot(dtm)

freq <- sort(colSums(as.matrix(dtm)), decreasing = TRUE)
wf <- data.frame(word = names(freq), freq = freq)

library(wordcloud)
set.seed(123)
wordcloud(names(freq), freq, min.freq =40)

set.seed(142)
wordcloud(names(freq), ,freq, max.words = 25)
set.seed(142)
wordcloud(names(freq), freq, min.freq = 50, scale = c(5,.1), rot.per = 0.2, colors = brewer.pal(6, "Dark2"))
