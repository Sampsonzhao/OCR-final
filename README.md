# How far has Optical Character Recognition have come (An evualtion of the Accuracy of OCR)
# Overview of the report
Though the earlier versions of OCR required the text to have a set font for recognition, modern iterations of this has developed enough to recognize multiple fonts as well as different writing systems. This project focuses on the accuracy of the modern OCR system and will compare the accuracy of the produced text to the originals. It was found that without any level of image processing, the OCR would typically catch a lot of blemishes on the paper, resulting in illegiable text. While using Magick and a third party image processing software, there was a huge increase in accuracy, with texts very near the 100% accuracy rate. While OCR is still immature, as it is unable to recognize the differences between some letters and blemishes, it is still a work in progress, as developement of A.I. and other text recognition improvements will allow the software to evolve once again.  \\par \\textbf{Keywords:} OCR, Tesseract, Magick, Accuracy, Historical Texts, Improvements in OCR, AI related to OCR.

# Notes on file structure
'Inputs' contain other papers referenced, raw data files etc. 'Outputs' contain the final knitted file, and files used to create this file. 'Scripts' contain the data for processing the raw data. 

# To get Started
Make sure you run the files in /scirpts/ before running the overall RMD file found in Outputs, as there are possible errors that may occur due to an error in a certain package. 
Ensure that reticulate::py_config() is run before the workspace setup, as FuzzyWuzzyR relies on the generation of a python-based environment for the package to run properly. In the case that this is forgotten, try closing the file, while removing everything in your environment, and restarting the R project file, running reticulate::py_config(), then running the rest of the workspace setup packages. 
