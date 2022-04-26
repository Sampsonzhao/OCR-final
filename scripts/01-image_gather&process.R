### Preamble ###
# purpose: load and gather image file from '/inputs/'
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
# accessed will be in png format before being placed in /inputs/ for consistency.

# Everything from here is the processing of a test document.

# unprocessed raw photo OCR and export to text
# file_1_uncleaned <- image_read(here::here("inputs/data/bowers.png")) %>%
  # image_ocr()

# file_uc<-file(here::here('inputs/data/BookTest/ocr_1_unclean.txt'))
# writeLines(file_1_uncleaned, file_uc, useBytes = TRUE)
# close(file_uc)

# processed raw photo OCR and export to text
# file_1_cleaned <- image_read(here::here("inputs/data/bowers.png")) %>%
  # image_resize("2000") %>%
  # image_convert(colorspace = 'gray') %>%
  # image_trim() %>%
  # image_ocr()

# file_c<-file(here::here('inputs/data/BookTest/ocr_1_clean.txt'))
# writeLines(file_1_cleaned, file_c, useBytes = TRUE)
# close(file_c)

# Compare the two generated OCR files to original text visually
# compare_clean <- diffr(here::here('inputs/data/BookTest/ocr_1_original.txt'), here::here('inputs/data/BookTest/ocr_1_clean.txt'), contextSize = 0, minJumpSize = 500)
# compare_unclean <- diffr(here::here('inputs/data/BookTest/ocr_1_original.txt'), here::here('inputs/data/BookTest/ocr_1_unclean.txt'), contextSize = 0, minJumpSize = 500)

# Generate Percent Difference between original text and OCR
# file_1_ccomp <- levenshteinSim(here::here('inputs/data/BookTest/ocr_1_original.txt'), here::here('inputs/data/BookTest/ocr_1_clean.txt'))
# file_1_unccomp <- levenshteinSim(here::here('inputs/data/BookTest/ocr_1_original.txt'), here::here('inputs/data/BookTest/ocr_1_unclean.txt'))

# Everything from here is processing images for the paper. This section will be 
# processing items related to the first book, "Basic and Clinical Pharmacology 
# 14th Edition" by Bertram E. Katzung

# unprocessed raw photo OCR and export to text
b1_1_uncleaned <- image_read(here::here("inputs/data/Book1/images/book1_100_1.jpg")) %>%
  image_ocr()

b1_1_uc<-file(here::here('inputs/data/Book1/b1_1_unclean.txt'))
writeLines(b1_1_uncleaned, b1_1_uc, useBytes = TRUE)
close(b1_1_uc)

b1_2_uncleaned <- image_read(here::here("inputs/data/Book1/images/book1_259_1.jpg")) %>%
  image_ocr()

b1_2_uc<-file(here::here('inputs/data/Book1/b1_2_unclean.txt'))
writeLines(b1_2_uncleaned, b1_2_uc, useBytes = TRUE)
close(b1_2_uc)

b1_3_uncleaned <- image_read(here::here("inputs/data/Book1/images/book1_493_2.jpg")) %>%
  image_ocr()

b1_3_uc<-file(here::here('inputs/data/Book1/b1_3_unclean.txt'))
writeLines(b1_3_uncleaned, b1_3_uc, useBytes = TRUE)
close(b1_3_uc)

b1_4_uncleaned <- image_read(here::here("inputs/data/Book1/images/book1_613_2.jpg")) %>%
  image_ocr()

b1_4_uc<-file(here::here('inputs/data/Book1/b1_4_unclean.txt'))
writeLines(b1_4_uncleaned, b1_4_uc, useBytes = TRUE)
close(b1_4_uc)

b1_5_uncleaned <- image_read(here::here("inputs/data/Book1/images/book1_1099_2.jpg")) %>%
  image_ocr()

b1_5_uc<-file(here::here('inputs/data/Book1/b1_5_unclean.txt'))
writeLines(b1_5_uncleaned, b1_5_uc, useBytes = TRUE)
close(b1_5_uc)

# processed photo OCR and export to text

b1_1_cleaned <- image_read(here::here("inputs/data/Book1/images/book1_100_1_crop.jpg")) %>%
  image_resize("2000") %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b1_1_c<-file(here::here('inputs/data/Book1/b1_1_clean.txt'))
writeLines(b1_1_cleaned, b1_1_c, useBytes = TRUE)
close(b1_1_c)

b1_2_cleaned <- image_read(here::here("inputs/data/Book1/images/book1_259_1_crop.jpg")) %>%
  image_resize("2000") %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b1_2_c<-file(here::here('inputs/data/Book1/b1_2_clean.txt'))
writeLines(b1_2_cleaned, b1_2_c, useBytes = TRUE)
close(b1_2_c)

b1_3_cleaned <- image_read(here::here("inputs/data/Book1/images/book1_493_2_crop.jpg")) %>%
  image_resize("2000") %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b1_3_c<-file(here::here('inputs/data/Book1/b1_3_clean.txt'))
writeLines(b1_3_cleaned, b1_3_c, useBytes = TRUE)
close(b1_3_c)

b1_4_cleaned <- image_read(here::here("inputs/data/Book1/images/book1_613_2_crop.jpg")) %>%
  image_resize("2000") %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b1_4_c<-file(here::here('inputs/data/Book1/b1_4_clean.txt'))
writeLines(b1_4_cleaned, b1_4_c, useBytes = TRUE)
close(b1_4_c)

b1_5_cleaned <- image_read(here::here("inputs/data/Book1/images/book1_1099_2_crop.jpg")) %>%
  image_resize("2000") %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b1_5_c<-file(here::here('inputs/data/Book1/b1_5_clean.txt'))
writeLines(b1_5_cleaned, b1_5_c, useBytes = TRUE)
close(b1_5_c)

# advanced processed photo OCR and export to text

b1_1_adv <- image_read(here::here("inputs/data/Book1/images/book1_100_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b1_1_a<-file(here::here('inputs/data/Book1/b1_1_adv.txt'))
writeLines(b1_1_adv, b1_1_a, useBytes = TRUE)
close(b1_1_a)

b1_2_adv <- image_read(here::here("inputs/data/Book1/images/book1_259_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b1_2_a<-file(here::here('inputs/data/Book1/b1_2_adv.txt'))
writeLines(b1_2_adv, b1_2_a, useBytes = TRUE)
close(b1_2_a)

b1_3_adv <- image_read(here::here("inputs/data/Book1/images/book1_493_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b1_3_a<-file(here::here('inputs/data/Book1/b1_3_adv.txt'))
writeLines(b1_3_adv, b1_3_a, useBytes = TRUE)
close(b1_3_a)

b1_4_adv <- image_read(here::here("inputs/data/Book1/images/book1_613_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b1_4_a<-file(here::here('inputs/data/Book1/b1_4_adv.txt'))
writeLines(b1_4_adv, b1_4_a, useBytes = TRUE)
close(b1_4_a)

b1_5_adv <- image_read(here::here("inputs/data/Book1/images/book1_1099_2_crop.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b1_5_a<-file(here::here('inputs/data/Book1/b1_5_adv.txt'))
writeLines(b1_5_adv, b1_5_a, useBytes = TRUE)
close(b1_5_a)

# Compare the two generated OCR files to original text visually

comp_uc_1_1 <- diffr(here::here('inputs/data/Book1/b1_1_unclean.txt'), here::here('inputs/data/Book1/b1_1_original.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_1_2 <- diffr(here::here('inputs/data/Book1/b1_2_unclean.txt'), here::here('inputs/data/Book1/b1_2_original.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_1_3 <- diffr(here::here('inputs/data/Book1/b1_3_unclean.txt'), here::here('inputs/data/Book1/b1_3_original.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_1_4 <- diffr(here::here('inputs/data/Book1/b1_4_unclean.txt'), here::here('inputs/data/Book1/b1_4_original.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_1_5 <- diffr(here::here('inputs/data/Book1/b1_5_unclean.txt'), here::here('inputs/data/Book1/b1_5_original.txt'), contextSize = 0, minJumpSize = 500)

comp_c_1_1 <- diffr(here::here('inputs/data/Book1/b1_1_clean.txt'), here::here('inputs/data/Book1/b1_1_original.txt'), contextSize = 0, minJumpSize = 500)
comp_c_1_2 <- diffr(here::here('inputs/data/Book1/b1_2_clean.txt'), here::here('inputs/data/Book1/b1_2_original.txt'), contextSize = 0, minJumpSize = 500)
comp_c_1_3 <- diffr(here::here('inputs/data/Book1/b1_3_clean.txt'), here::here('inputs/data/Book1/b1_3_original.txt'), contextSize = 0, minJumpSize = 500)
comp_c_1_4 <- diffr(here::here('inputs/data/Book1/b1_4_clean.txt'), here::here('inputs/data/Book1/b1_4_original.txt'), contextSize = 0, minJumpSize = 500)
comp_c_1_5 <- diffr(here::here('inputs/data/Book1/b1_5_clean.txt'), here::here('inputs/data/Book1/b1_5_original.txt'), contextSize = 0, minJumpSize = 500)

comp_a_1_1 <- diffr(here::here('inputs/data/Book1/b1_1_adv.txt'), here::here('inputs/data/Book1/b1_1_original.txt'), contextSize = 0, minJumpSize = 500)
comp_a_1_2 <- diffr(here::here('inputs/data/Book1/b1_2_adv.txt'), here::here('inputs/data/Book1/b1_2_original.txt'), contextSize = 0, minJumpSize = 500)
comp_a_1_3 <- diffr(here::here('inputs/data/Book1/b1_3_adv.txt'), here::here('inputs/data/Book1/b1_3_original.txt'), contextSize = 0, minJumpSize = 500)
comp_a_1_4 <- diffr(here::here('inputs/data/Book1/b1_4_adv.txt'), here::here('inputs/data/Book1/b1_4_original.txt'), contextSize = 0, minJumpSize = 500)
comp_a_1_5 <- diffr(here::here('inputs/data/Book1/b1_5_adv.txt'), here::here('inputs/data/Book1/b1_5_original.txt'), contextSize = 0, minJumpSize = 500)

# Everything from here is processing images for the paper. This section will be 
# processing items related to the second book, "Life and Literature Book One 
# Grade 7" by Thomas Nelson & Son

# unprocessed raw photo OCR and export to text
b2_1_uncleaned <- image_read(here::here("inputs/data/Book2/images/book2_65.jpg")) %>%
  image_ocr()

b2_1_uc<-file(here::here('inputs/data/Book2/b2_1_unclean.txt'))
writeLines(b2_1_uncleaned, b2_1_uc, useBytes = TRUE)
close(b2_1_uc)

b2_2_uncleaned <- image_read(here::here("inputs/data/Book2/images/book2_127.jpg")) %>%
  image_ocr()

b2_2_uc<-file(here::here('inputs/data/Book2/b2_2_unclean.txt'))
writeLines(b2_2_uncleaned, b2_2_uc, useBytes = TRUE)
close(b2_2_uc)

b2_3_uncleaned <- image_read(here::here("inputs/data/Book2/images/book2_183.jpg")) %>%
  image_ocr()

b2_3_uc<-file(here::here('inputs/data/Book2/b2_3_unclean.txt'))
writeLines(b2_3_uncleaned, b2_3_uc, useBytes = TRUE)
close(b2_3_uc)

b2_4_uncleaned <- image_read(here::here("inputs/data/Book2/images/book2_235.jpg")) %>%
  image_ocr()

b2_4_uc<-file(here::here('inputs/data/Book2/b2_4_unclean.txt'))
writeLines(b2_4_uncleaned, b2_4_uc, useBytes = TRUE)
close(b2_4_uc)

b2_5_uncleaned <- image_read(here::here("inputs/data/Book2/images/book2_318.jpg")) %>%
  image_ocr()

b2_5_uc<-file(here::here('inputs/data/Book2/b2_5_unclean.txt'))
writeLines(b2_5_uncleaned, b2_5_uc, useBytes = TRUE)
close(b2_5_uc)

# processed photo OCR and export to text
b2_1_cleaned <- image_read(here::here("inputs/data/Book2/images/book2_65.jpg")) %>%
  image_resize("2000") %>%
  image_modulate(brightness = 125) %>%
  image_contrast(sharpen = 2) %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b2_1_c<-file(here::here('inputs/data/Book2/b2_1_clean.txt'))
writeLines(b2_1_cleaned, b2_1_c, useBytes = TRUE)
close(b2_1_c)

b2_2_cleaned <- image_read(here::here("inputs/data/Book2/images/book2_127.jpg")) %>%
  image_resize("2000") %>%
  image_modulate(brightness = 125) %>%
  image_contrast(sharpen = 2) %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b2_2_c<-file(here::here('inputs/data/Book2/b2_2_clean.txt'))
writeLines(b2_2_cleaned, b2_2_c, useBytes = TRUE)
close(b2_2_c)

b2_3_cleaned <- image_read(here::here("inputs/data/Book2/images/book2_183.jpg")) %>%
  image_resize("2000") %>%
  image_modulate(brightness = 125) %>%
  image_contrast(sharpen = 2) %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b2_3_c<-file(here::here('inputs/data/Book2/b2_3_clean.txt'))
writeLines(b2_3_cleaned, b2_3_c, useBytes = TRUE)
close(b2_3_c)

b2_4_cleaned <- image_read(here::here("inputs/data/Book2/images/book2_235.jpg")) %>%
  image_resize("2000") %>%
  image_modulate(brightness = 125) %>%
  image_contrast(sharpen = 2) %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b2_4_c<-file(here::here('inputs/data/Book2/b2_4_clean.txt'))
writeLines(b2_4_cleaned, b2_4_c, useBytes = TRUE)
close(b2_4_c)

b2_5_cleaned <- image_read(here::here("inputs/data/Book2/images/book2_318.jpg")) %>%
  image_resize("2000") %>%
  image_modulate(brightness = 125) %>%
  image_contrast(sharpen = 2) %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()

b2_5_c<-file(here::here('inputs/data/Book2/b2_5_clean.txt'))
writeLines(b2_5_cleaned, b2_5_c, useBytes = TRUE)
close(b2_5_c)

# advanced processed photo OCR and export to text

b2_1_adv <- image_read(here::here("inputs/data/Book2/images/book2_65_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b2_1_a<-file(here::here('inputs/data/Book2/b2_1_adv.txt'))
writeLines(b2_1_adv, b2_1_a, useBytes = TRUE)
close(b2_1_a)

b2_2_adv <- image_read(here::here("inputs/data/Book2/images/book2_127_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b2_2_a<-file(here::here('inputs/data/Book2/b2_2_adv.txt'))
writeLines(b2_2_adv, b2_2_a, useBytes = TRUE)
close(b2_2_a)

b2_3_adv <- image_read(here::here("inputs/data/Book2/images/book2_183_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b2_3_a<-file(here::here('inputs/data/Book2/b2_3_adv.txt'))
writeLines(b2_3_adv, b2_3_a, useBytes = TRUE)
close(b2_3_a)

b2_4_adv <- image_read(here::here("inputs/data/Book2/images/book2_235_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b2_4_a<-file(here::here('inputs/data/Book2/b2_4_adv.txt'))
writeLines(b2_4_adv, b2_4_a, useBytes = TRUE)
close(b2_4_a)

b2_5_adv <- image_read(here::here("inputs/data/Book2/images/book2_318_adv.jpg")) %>%
  image_resize("2000") %>%
  image_trim() %>%
  image_ocr()

b2_5_a<-file(here::here('inputs/data/Book2/b2_5_adv.txt'))
writeLines(b2_5_adv, b2_5_a, useBytes = TRUE)
close(b2_5_a)


# Compare the two generated OCR files to original text visually

comp_uc_2_1 <- diffr(here::here('inputs/data/Book2/b2_1_original.txt'), here::here('inputs/data/Book2/b2_1_unclean.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_2_2 <- diffr(here::here('inputs/data/Book2/b2_2_original.txt'), here::here('inputs/data/Book2/b2_2_unclean.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_2_3 <- diffr(here::here('inputs/data/Book2/b2_3_original.txt'), here::here('inputs/data/Book2/b2_3_unclean.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_2_4 <- diffr(here::here('inputs/data/Book2/b2_4_original.txt'), here::here('inputs/data/Book2/b2_4_unclean.txt'), contextSize = 0, minJumpSize = 500)
comp_uc_2_5 <- diffr(here::here('inputs/data/Book2/b2_5_original.txt'), here::here('inputs/data/Book2/b2_5_unclean.txt'), contextSize = 0, minJumpSize = 500)

comp_c_2_1 <- diffr(here::here('inputs/data/Book2/b2_1_original.txt'), here::here('inputs/data/Book2/b2_1_clean.txt'), contextSize = 0, minJumpSize = 500)
comp_c_2_2 <- diffr(here::here('inputs/data/Book2/b2_2_original.txt'), here::here('inputs/data/Book2/b2_2_clean.txt'), contextSize = 0, minJumpSize = 500)
comp_c_2_3 <- diffr(here::here('inputs/data/Book2/b2_3_original.txt'), here::here('inputs/data/Book2/b2_3_clean.txt'), contextSize = 0, minJumpSize = 500)
comp_c_2_4 <- diffr(here::here('inputs/data/Book2/b2_4_original.txt'), here::here('inputs/data/Book2/b2_4_clean.txt'), contextSize = 0, minJumpSize = 500)
comp_c_2_5 <- diffr(here::here('inputs/data/Book2/b2_5_original.txt'), here::here('inputs/data/Book2/b2_5_clean.txt'), contextSize = 0, minJumpSize = 500)

comp_a_2_1 <- diffr(here::here('inputs/data/Book2/b2_1_original.txt'), here::here('inputs/data/Book2/b2_1_adv.txt'), contextSize = 0, minJumpSize = 500)
comp_a_2_2 <- diffr(here::here('inputs/data/Book2/b2_2_original.txt'), here::here('inputs/data/Book2/b2_2_adv.txt'), contextSize = 0, minJumpSize = 500)
comp_a_2_3 <- diffr(here::here('inputs/data/Book2/b2_3_original.txt'), here::here('inputs/data/Book2/b2_3_adv.txt'), contextSize = 0, minJumpSize = 500)
comp_a_2_4 <- diffr(here::here('inputs/data/Book2/b2_4_original.txt'), here::here('inputs/data/Book2/b2_4_adv.txt'), contextSize = 0, minJumpSize = 500)
comp_a_2_5 <- diffr(here::here('inputs/data/Book2/b2_5_original.txt'), here::here('inputs/data/Book2/b2_5_adv.txt'), contextSize = 0, minJumpSize = 500)
