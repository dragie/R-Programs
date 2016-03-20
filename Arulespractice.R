if(!file.exists("SQF_Codebook.pdf")) {
  download.file("http://www.nyclu.org/files/SQF_Codebook.pdf", "SQF_Codebook.pdf")
}

if(!file.exists("SQF 2012.csv")) {
  download.file("http://www.nyclu.org/files/stopandfrisk/Stop-and-Frisk-2012.zip",
                "Stop-and-Frisk-2012.zip")
  unzip("Stop-and-Frisk-2012.zip")
}

dat <- read.csv("SQF 2012.csv")
dim(dat)

summary(dat)
dat$datestop <- as.Date(sprintf("%08d", dat$datestop), format ="%m%d%Y")
dat$timestop <- as.integer(substr(sprintf("%04d", dat$timestop), 1, 2))
dat$perobs[ dat$perobs<1 | dat$perobs>120 ] <- NA
head(dat$perstop)
dat$perstop[dat$perstop =="**"] <- NA
dat$perstop <- as.numeric(dat$perstop)
dat$dob <- NULL
hist(dat$age)
table(dat$age)
dat$age[dat$age < 10 | dat$age > 90] <- NA
hist(dat$age, breaks=40)
table(dat$height)
barplot(table(dat$height))
dat$height[dat$height < 40 | dat$height > 90] <- NA
hist(dat$height, breaks=40)
table(dat$weight)
barplot(table(dat$weight))
dat$weight[dat$weight < 50 | dat$weight > 400] <- NA
hist(dat$weight, breaks=40)
dat$city <- factor(dat$city, labels=c("Manhattan", "Brooklyn", "Bronx",
                                      "Queens", "Staten Island"))
dat$race <- factor(dat$race, labels=c("Black", "Black Hispanic",
                                      "White Hispanic", "White", "Asian/Pacific Islander",
                                      "Am. Indian/ Native Alaskan"))

dat$sex <- factor(dat$sex+1L, label=c("female", "male"))

dat$build <- factor(dat$build, labels=c("heavy", "muscular",
                                        "medium", "thin"))

dat$forceuse <- factor(dat$forceuse, labels =c("defense of other",
                                               "defense of self", "overcome resistence", "other",
                                               "suspected flight", "suspected weapon"))

dat$inout <- factor(dat$inout+1L, labels=c("outside", "inside"))

dat$trhsloc <- factor(dat$trhsloc+1L, labels=c("neither",
                                               "housing authority", "transit authority"))
crimecodes <- read.csv("crimecodes.csv", header = FALSE)
dat$detailcm <- factor(dat$detailcm, levels= crimecodes[,1],
                       labels=crimecodes[,2])
dat$pct <- as.factor(dat$pct) # use names instead?
dat$addrpct <- as.factor(dat$addrpct)
dat$sector <- as.factor(dat$sector)
dat$typeofid <- factor(dat$typeofid,
                       labels=c("photo id", "verbal id", "refused to provide id", "unknown"))
dat$repcmd <- as.factor(dat$repcmd)
dat$revcmd <- as.factor(dat$revcmd)
binary <- strsplit("frisked searched contrabn pistol riflshot asltweap knifcuti machgun othrweap arstmade sumissue sumoffen",
                   " ")[[1]]
for(b in binary) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("cs_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("rf_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("sb_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("ac_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])
for(b in grep("pf_", colnames(dat), value=TRUE)) dat[[b]] <- as.logical(dat[[b]])

dat$othpers <- as.logical(dat$othpers)
dat$explnstp <- as.logical(dat$explnstp)
dat$offunif <- as.logical(dat$offunif)
dat$offverb <- as.logical(dat$offverb)
dat$offverb[dat$offunif] <- NA
dat$officrid <- as.logical(dat$officrid)
dat$officrid[dat$offunif] <- NA
dat$offshld <- as.logical(dat$offshld)
dat$offshld[dat$offunif] <- NA

dat$radio <- as.logical(dat$radio)
dat$year <- NULL # we only have 2012
dat$haircolr <- NULL
dat$eyecolor <- NULL
dat$ser_num <- NULL
dat$othfeatr <- NULL
dat$arstoffn <- NULL
dat$crimsusp <- NULL
dat$premname <- NULL
dat$addrnum <- NULL
dat$stname <- NULL
dat$stinter <- NULL
dat$ crossst <- NULL
dat$beat <- NULL
dat$post <- NULL
dat$recstat <- NULL
dat$linecm <- NULL
save(dat, file="SFQ_clean.rda")
oldpar <- par("mar" = c(6,4,4,2)+.1)
barplot(table(dat$city), ylab="Number of Stops", las=3)
par(oldpar)
pop <- c(Manhattan =1626159, Brooklyn = 2592149, Bronx = 1418733,
         Queens =2296175, 'Staten Island'=472621)
oldpar <- par("mar" = c(6,4,4,2)+.1)
barplot(table(dat$city)/pop*100, ylab="Stops in % of Population",
        las=3, ylim=c(0,10))
par(oldpar)

tbl <- table(dat$race)
names(tbl) <- abbreviate(names(tbl), 8)
barplot(tbl, ylab="Number of Stops", las=3)
pop <- c(White=44.6, Black=25.1, Hispanic=27.5, Other=11.8)
sum(pop)
pop <- pop/sum(pop)

tbl <- table(dat$race)
tbl <- c(tbl["White"], tbl["Black"],
         tbl["White Hispanic"]+tbl["Black Hispanic"],
         tbl["Asian/Pacific Islander"]+tbl["Am. Indian/ Native Alaskan"])
names(tbl) <- c("White", "Black", "Hispanic", "Other")
tbl <- tbl/sum(tbl)

barplot((rbind(pop, tbl)*100), beside = TRUE, ylab="Proportion [%]",
        col=gray.colors(2), ylim=c(0,70), main = "Stops in NYC")
legend(x = "topright", legend = c("Population", "Stops"),
       fill=gray.colors(2), bty="n")
if(! "vcd" %in% installed.packages()) install.packages("vcd", depend = TRUE)
library(vcd)
assoc(~ sex + race, data=dat, shade=TRUE, abbreviate_labs=6)
assoc(~ sex + forceuse, data=dat, shade=TRUE,
      labeling_args = list(rot_labels = c(25, 90, 0, 90), varnames=FALSE))
assoc(~ arstmade + sex, data=dat, shade=TRUE)
assoc(~ arstmade + race, data=dat, shade=TRUE, abbreviate_labs=6)

if(! "arules" %in% installed.packages()) install.packages("arules", depend = TRUE)
if(! "arulesViz" %in% installed.packages()) install.packages("arulesViz", depend = TRUE)
library(arules)
library(arulesViz)
library(TSP)
install.packages('registry')
library(registry)
install.packages('caTools')
library(caTools)

d <- dat[, c(
  grep("rf_", colnames(dat), value = TRUE),
  grep("cs_", colnames(dat), value = TRUE),
  grep("ac_", colnames(dat), value = TRUE),
  grep("pf_", colnames(dat), value = TRUE),
  "arstmade", "sumissue", "detailcm", "race",
  "pct",
  #"city", ### city and precinct are related
  "typeofid", "othpers"
)]

d$female <- dat$sex == "female"
#d$detailcm[!(d$arstmade | d$sumissue)] <- NA
d$weapon <- dat$pistol | dat$riflshot | dat$asltweap |
  dat$knifcuti | dat$machgun | dat$othrweap
d$no_uniform <- !dat$offunif

d$inside <- dat$inout == "inside"
d$trhsloc <- dat$trhsloc
d$trhsloc[dat$trhsloc == "neither"] <- NA

d$minor <- dat$age<18
d$height <- discretize(dat$height, method = "frequency", 3)

trans <- as(d, "transactions")
trans