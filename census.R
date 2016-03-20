#' ---------------------------------------------------------------
#' @version 1.1.0 Census Data Analysis
#' @title census
#' 
#' @description 
#' This script is used to analyze the Indian census data. 
#' 
#' @author Vijayan Nagarajan
#' ---------------------------------------------------------------

#Setting the environment variable for Java 
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre7\\")

#Adding libraries
library(rJava)
library(XLConnect)

#Data Reading
data <- loadWorkbook("D:\\Datasets\\Census\\EducationLevel.xlsx")
data.education <- readWorksheet(data, sheet = "C-08", header = TRUE)
head(View(data.education))

#Data Preprocessing
data.education <- data.education[-(5:6), ]
data.education <- data.education[-(1:4), ]
colnames(data.education)
colnames(data.education) <- c('TableName','StateCode', 'DistCode', 'AreaName', 'TotalRuralUrban', 'Age',
                              'TotalPerson', 'TotalMale', 'TotalFemale', 'IlliteratePerson',
                              'IlliterateMale', 'IlliterateFemale', 'LiteratePerson', 'LiterateMale',
                              'LiterateFemale', 'LiterateWithoutEduPerson', 'LiterateWithoutEduMale',
                              'LiterateWithoutEduFemale', 'BelowPrimaryPerson', 'BelowPrimaryMale',
                              'BelowPrimaryFemale', 'PrimaryPerson', 'PrimaryMale', 'PrimaryFemale',
                              'MiddlePerson', 'MiddleMale', 'MiddleFemale', 'MatricPerson', 'MetricMale', 
                              'MatricFemale', 'SecondaryPerson', 'SecondaryMale', 'SecondaryFemale',
                              'CertificatePerson', 'CertificateMale', 'CertificateFemale', 'DiplomaPerson',
                              'DiplomaMale', 'DiplomaFemale', 'GraduatePerson', 'GraduateMale',
                              'GraduateFemale', 'UnclassifiedPerson', 'UnclassifiedMale','UnclassifiedFemale')

summary(data.education)

#Subsetting total population data
total <- subset(data.education, AreaName == 'INDIA')
summary(total)
View(total)
total <- as.matrix(total)
total[is.na(total)] <- 0

(meanIllietrate <- mean(as.numeric(total[,7])))

#Subsetting state wise
#totalIlliterateStateWise <- subset(data.education, ) 
par(mfrow = c(2,2))

