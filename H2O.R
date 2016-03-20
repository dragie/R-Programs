if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_60\\")

library(h2o)
localH2O = h2o.init()
localH2O <- h2o.init(ip = 'localhost', port = 54321, max_mem_size = '4g')
