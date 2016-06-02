# NuclearTransloation
Quantifying Nuclear translocation using fluorescent- labeled proteins, Image analysis in ImageJ and R
This project was created in order to standardise the quantification of Nuclear Translocation using images taken from the Licor Confocal. 

##General workflow: 

->Image using confocal, save .lif file 

	-> use FIJI software (ImageJ) to separate different images into RGB stacks 

	-> Identify and mark diameter of cells to measure with line ROI in ImageJ 

	-> Add to ROI manager 

	-> run macro to extract profile plot values for each image

	-> run R analysis on profile plot values (iterate through colour channels)

		-> identify pixel no. of cells vs nucleus

		-> integrate area under curve to compute expression levels in nucleus/total (%)

		
