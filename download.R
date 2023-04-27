
company_code<-2883
year<-110
# Specify URL where file is stored
url <- paste("https://mops.twse.com.tw/server-java/FileDownLoad?step=9&filePath=/home/html/nas/protect/t100/&fileName=t100sa11_", company_code, "_", year, ".pdf", sep = "")
print(url)
# Specify destination where file should be saved
filename <- paste("t100sa11_", company_code, "_", year, ".pdf", sep = "")
#destfile <- file.path("C:", "Users", "pojid", "desktop", "SplitandPath_pdf", "company_ESG", filename)
# Apply download.file function in R
download.file(url,filename,mode = "wb")

