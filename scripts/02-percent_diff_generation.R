### Preamble ###
# purpose: generate percent differences between text documents for book 1
# Author: Sampson Zhao
# Contact: sampson.zhao@mail.utoronto.ca
# Date: 2022-04-27
# Pre-requisites: 
# - reticulate::py_config() needs to be run at least once before fuzzywuzzyR 
#   package can be used for text differences.

#### Workspace setup ####
library(tidyverse)
library(here)
library(tesseract)
library(magick)
library(magrittr)
library(diffr)
library(RecordLinkage)
library(readr)
library(fuzzywuzzyR)

# Because the data is developed from images taken from /inputs/, they will be 
# loaded and processed before being accessed in the main document. All images 
# accessed will be in jpg format before being placed in /inputs/ for consistency.

# Generate Percent Difference between original text and raw OCR
uc_1 <- read_file(here::here('inputs/data/Book1/b1_1_unclean.txt'))
orig_1 <- read_file(here::here('inputs/data/Book1/b1_1_original.txt'))
comp_1 <- SequenceMatcher$new(string1 = orig_1, string2 = uc_1)
percentdiff_uc_1 <- comp_1$ratio()

uc_2 <- read_file(here::here('inputs/data/Book1/b1_2_unclean.txt'))
orig_2 <- read_file(here::here('inputs/data/Book1/b1_2_original.txt'))
comp_2 <- SequenceMatcher$new(string1 = orig_2, string2 = uc_2)
percentdiff_uc_2 <- comp_2$ratio()

uc_3 <- read_file(here::here('inputs/data/Book1/b1_3_unclean.txt'))
orig_3 <- read_file(here::here('inputs/data/Book1/b1_3_original.txt'))
comp_3 <- SequenceMatcher$new(string1 = orig_3, string2 = uc_3)
percentdiff_uc_3 <- comp_3$ratio()

uc_4 <- read_file(here::here('inputs/data/Book1/b1_4_unclean.txt'))
orig_4 <- read_file(here::here('inputs/data/Book1/b1_4_original.txt'))
comp_4 <- SequenceMatcher$new(string1 = orig_4, string2 = uc_4)
percentdiff_uc_4 <- comp_4$ratio()

uc_5 <- read_file(here::here('inputs/data/Book1/b1_5_unclean.txt'))
orig_5 <- read_file(here::here('inputs/data/Book1/b1_5_original.txt'))
comp_5 <- SequenceMatcher$new(string1 = orig_5, string2 = uc_5)
percentdiff_uc_5 <- comp_5$ratio()

# Generate Percent Difference between original text and processed OCR

c_1 <- read_file(here::here('inputs/data/Book1/b1_1_clean.txt'))
comp_1a <- SequenceMatcher$new(string1 = orig_1, string2 = c_1)
percentdiff_c_1 <- comp_1a$ratio()

c_2 <- read_file(here::here('inputs/data/Book1/b1_2_clean.txt'))
comp_2a <- SequenceMatcher$new(string1 = orig_2, string2 = c_2)
percentdiff_c_2 <- comp_2a$ratio()

c_3 <- read_file(here::here('inputs/data/Book1/b1_3_clean.txt'))
comp_3a <- SequenceMatcher$new(string1 = orig_3, string2 = c_3)
percentdiff_c_3 <- comp_3a$ratio()

c_4 <- read_file(here::here('inputs/data/Book1/b1_4_clean.txt'))
comp_4a <- SequenceMatcher$new(string1 = orig_4, string2 = c_4)
percentdiff_c_4 <- comp_4a$ratio()

c_5 <- read_file(here::here('inputs/data/Book1/b1_5_clean.txt'))
comp_5a <- SequenceMatcher$new(string1 = orig_5, string2 = c_5)
percentdiff_c_5 <- comp_5a$ratio()

# Generate Percent Difference between original text and advanced processed OCR

a_1 <- read_file(here::here('inputs/data/Book1/b1_1_adv.txt'))
comp_1b <- SequenceMatcher$new(string1 = orig_1, string2 = a_1)
percentdiff_a_1 <- comp_1b$ratio()

a_2 <- read_file(here::here('inputs/data/Book1/b1_2_adv.txt'))
comp_2b <- SequenceMatcher$new(string1 = orig_2, string2 = a_2)
percentdiff_a_2 <- comp_2b$ratio()

a_3 <- read_file(here::here('inputs/data/Book1/b1_3_adv.txt'))
comp_3b <- SequenceMatcher$new(string1 = orig_3, string2 = a_3)
percentdiff_a_3 <- comp_3b$ratio()

a_4 <- read_file(here::here('inputs/data/Book1/b1_4_adv.txt'))
comp_4b <- SequenceMatcher$new(string1 = orig_4, string2 = a_4)
percentdiff_a_4 <- comp_4b$ratio()

a_5 <- read_file(here::here('inputs/data/Book1/b1_5_adv.txt'))
comp_5b <- SequenceMatcher$new(string1 = orig_5, string2 = a_5)
percentdiff_a_5 <- comp_5b$ratio()

# enter data into CSV
Percent_Difference_Advanced <- c(percentdiff_a_1, percentdiff_a_2, percentdiff_a_3, percentdiff_a_4, percentdiff_a_5)
Percent_Difference_Uncleaned <- c(percentdiff_uc_1,percentdiff_uc_2,percentdiff_uc_3,percentdiff_uc_4,percentdiff_uc_5)
Percent_Difference_cleaned <- c(percentdiff_c_1,percentdiff_c_2,percentdiff_c_3,percentdiff_c_4,percentdiff_c_5)

Percent_Difference <- as.data.frame(cbind(Percent_Difference_Uncleaned, Percent_Difference_cleaned, Percent_Difference_Advanced), stringsAsFactors = FALSE)
write_csv(Percent_Difference, here::here("inputs/data/book_1_percent_diff.csv"))
