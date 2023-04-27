#Load needed packages
library(readxl)
library(pdftools)
library(Rserve)
library(openxlsx)

# Set the path to your Excel file
path <- "C:/Users/pojid/desktop/SplitandPath_pdf/2881_110_etr.xlsx"
# Define the directory path to save the output PDFs
output_dir <- "C:/Users/pojid/desktop/SplitandPath_pdf/SaveOutput_pdf"

# Read in the Excel file as a dataframe
df <- read_excel(path)
df


# Loop through each cell in the 'numbers' column
for (i in seq_along(df$pages)) {
  # Split the cell contents into individual numbers
  num_list <- strsplit(df$pages[i], ",")[[1]]
  # Convert the numbers to integers
  num_list <- as.integer(num_list)
  
  # Generate the corresponding PDF file
  output_file <- paste0(i, ".pdf")
  pdf_path <- paste0(output_dir, output_file)
  pdf_subset("C:/Users/pojid/desktop/SplitandPath_pdf/Fubon_ESGreport_110.pdf", pages = num_list, output = pdf_path)
  
  # Update the pdf_path column in the new dataframe
  df[i, "pdf_path"] <- pdf_path
  
}

# Write the modified dataframe to a different sheet in the same Excel file
write.xlsx(df, path, sheetName = "Modified Data", append = TRUE)
