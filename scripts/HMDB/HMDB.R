# Load the package required to read website
library(XML)

# wegpage address 
url <- "https://hmdb.ca/downloads/"

# method one: for people who is luckiest (not me, so sad)
df1 <- readHTMLTable(url, header=T, stringsAsFactors = F)
# Error: failed to load external entity "url"

# method two: use RCurl package, for people who is much luckier (only work on my laptop, not the computer in the office, crying)
library(RCurl)
xmldoc <- './hmdb_metabolites.xml'
df2 <- readHTMLTable(xmldoc, stringsAsFactors = F)

# method three: use httr package, for people who is not lucky
library(httr)
tabs <- GET(url)
df3 <- readHTMLTable(rawToChar(tabs$content), as.data.frame = T, stringsAsFactors = F)
