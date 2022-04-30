### Preamble ###
# purpose: generate percent differences between text documents for book 1
# Author: Sampson Zhao
# Contact: sampson.zhao@mail.utoronto.ca
# Date: 2022-04-27
# Pre-requisites: 
# - reticulate::py_config() needs to be run at least once before fuzzywuzzyR 
#   package can be used for text differences.

# REQUIREMENT: please run reticulate::py_config() before loading the workspace 
# setup packages, as fuzzywuzzyR needs to ensure that an environment can be 
# formed before it can run the requisite comparison method. 

#### Workspace setup ####
library(tidyverse)
library(here)
library(tesseract)
library(magick)
library(magrittr)
library(diffr)
library(RecordLinkage)
library(readr)
reticulate::py_config()
library(reticulate)
library(fuzzywuzzyR)
library(reshape2)


# Because the data is developed from images taken from /inputs/, they will be 
# loaded and processed before being accessed in the main document. All images 
# accessed will be in jpg format before being placed in /inputs/ for consistency.

# Everything from here is processing images for the paper. This section will be 
# processing items related to the first book, "Basic and Clinical Pharmacology 
# 14th Edition" by Bertram E. Katzung

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
Percent_Difference_3 <- c(percentdiff_a_1, percentdiff_a_2, percentdiff_a_3, percentdiff_a_4, percentdiff_a_5)
Percent_Difference_1 <- c(percentdiff_uc_1,percentdiff_uc_2,percentdiff_uc_3,percentdiff_uc_4,percentdiff_uc_5)
Percent_Difference_2 <- c(percentdiff_c_1,percentdiff_c_2,percentdiff_c_3,percentdiff_c_4,percentdiff_c_5)
bkpage <- c('100','259','493','613','1099')

Percent_Difference <- as.data.frame(cbind(bkpage, Percent_Difference_1, Percent_Difference_2, Percent_Difference_3), stringsAsFactors = FALSE)

# Percent_Difference <- melt(Percent_Difference, id.vars = 'bkpage')

write_csv(Percent_Difference, here::here("inputs/data/book_1_percent_diff.csv"))

#Everything from here is processing images for the paper. This section will be 
# processing items related to the second book, "Life and Literature Book One 
# Grade 7" by Thomas Nelson & Son

# Generate Percent Difference between original text and raw OCR

uc_6 <- read_file(here::here('inputs/data/Book2/b2_1_unclean.txt'))
orig_6 <- read_file(here::here('inputs/data/Book2/b2_1_original.txt'))
comp_6 <- SequenceMatcher$new(string1 = orig_6, string2 = uc_6)
percentdiff_uc_6 <- comp_6$ratio()

uc_7 <- read_file(here::here('inputs/data/Book2/b2_2_unclean.txt'))
orig_7 <- read_file(here::here('inputs/data/Book2/b2_2_original.txt'))
comp_7 <- SequenceMatcher$new(string1 = orig_7, string2 = uc_7)
percentdiff_uc_7 <- comp_7$ratio()

uc_8 <- read_file(here::here('inputs/data/Book2/b2_3_unclean.txt'))
orig_8 <- read_file(here::here('inputs/data/Book2/b2_3_original.txt'))
comp_8 <- SequenceMatcher$new(string1 = orig_8, string2 = uc_8)
percentdiff_uc_8 <- comp_8$ratio()

uc_9 <- read_file(here::here('inputs/data/Book2/b2_4_unclean.txt'))
orig_9 <- read_file(here::here('inputs/data/Book2/b2_4_original.txt'))
comp_9 <- SequenceMatcher$new(string1 = orig_9, string2 = uc_9)
percentdiff_uc_9 <- comp_9$ratio()

uc_10 <- read_file(here::here('inputs/data/Book2/b2_5_unclean.txt'))
orig_10 <- read_file(here::here('inputs/data/Book2/b2_5_original.txt'))
comp_10 <- SequenceMatcher$new(string1 = orig_10, string2 = uc_10)
percentdiff_uc_10 <- comp_10$ratio()

# Generate Percent Difference between original text and processed OCR

c_6 <- read_file(here::here('inputs/data/Book2/b2_1_clean.txt'))
comp_6a <- SequenceMatcher$new(string1 = orig_6, string2 = c_6)
percentdiff_c_6 <- comp_6a$ratio()

c_7 <- read_file(here::here('inputs/data/Book2/b2_2_clean.txt'))
comp_7a <- SequenceMatcher$new(string1 = orig_7, string2 = c_7)
percentdiff_c_7 <- comp_7a$ratio()

c_8 <- read_file(here::here('inputs/data/Book2/b2_3_clean.txt'))
comp_8a <- SequenceMatcher$new(string1 = orig_8, string2 = c_8)
percentdiff_c_8 <- comp_8a$ratio()

c_9 <- read_file(here::here('inputs/data/Book2/b2_4_clean.txt'))
comp_9a <- SequenceMatcher$new(string1 = orig_9, string2 = c_9)
percentdiff_c_9 <- comp_9a$ratio()

c_10 <- read_file(here::here('inputs/data/Book2/b2_5_clean.txt'))
comp_10a <- SequenceMatcher$new(string1 = orig_10, string2 = c_10)
percentdiff_c_10 <- comp_10a$ratio()

# Generate Percent Difference between original text and advanced processed OCR

a_6 <- read_file(here::here('inputs/data/Book2/b2_1_adv.txt'))
comp_6b <- SequenceMatcher$new(string1 = orig_6, string2 = a_6)
percentdiff_a_6 <- comp_6b$ratio()

a_7 <- read_file(here::here('inputs/data/Book2/b2_2_adv.txt'))
comp_7b <- SequenceMatcher$new(string1 = orig_7, string2 = a_7)
percentdiff_a_7 <- comp_7b$ratio()

a_8 <- read_file(here::here('inputs/data/Book2/b2_3_adv.txt'))
comp_8b <- SequenceMatcher$new(string1 = orig_8, string2 = a_8)
percentdiff_a_8 <- comp_8b$ratio()

a_9 <- read_file(here::here('inputs/data/Book2/b2_4_adv.txt'))
comp_9b <- SequenceMatcher$new(string1 = orig_9, string2 = a_9)
percentdiff_a_9 <- comp_9b$ratio()

a_10 <- read_file(here::here('inputs/data/Book2/b2_5_adv.txt'))
comp_10b <- SequenceMatcher$new(string1 = orig_10, string2 = a_10)
percentdiff_a_10 <- comp_10b$ratio()


# enter data into CSV
Percent_Difference_6 <- c(percentdiff_a_6, percentdiff_a_7, percentdiff_a_8, percentdiff_a_9, percentdiff_a_10)
Percent_Difference_4 <- c(percentdiff_uc_6,percentdiff_uc_7,percentdiff_uc_8,percentdiff_uc_9,percentdiff_uc_10)
Percent_Difference_5 <- c(percentdiff_c_6,percentdiff_c_7,percentdiff_c_8,percentdiff_c_9,percentdiff_c_10)
bkpage_2 <- c('65','127','183','235','318')

Percent_Difference_2 <- as.data.frame(cbind(bkpage_2, Percent_Difference_4, Percent_Difference_5, Percent_Difference_6), stringsAsFactors = FALSE)

# Percent_Difference_2 <- melt(Percent_Difference_2, id.vars = 'bkpage_2')

write_csv(Percent_Difference_2, here::here("inputs/data/book_2_percent_diff.csv"))

