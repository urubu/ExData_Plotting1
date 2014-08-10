## R Scripts and resulting PNG files for Assignment 1

# How to use the scripts
The five scripts (plot1.R, plot2.R, plot3.R, plot4.R and GetData.R) should be
placed in the current working directory. 
If the data file (the text file 'household_power_consumption.txt' or the archive 
'household_power_consumption.zip') is already available, it should be placed in
a subdirectory called 'data'.

# How the scripts work
In keeping with discussions on the forums common code for downloading and reading 
the data file as well as for subsetting the dataframe has been moved to a separate script 
(GetData.R).

Running any plot script invokes the GetData.R script using source(). 

GetData.R does this:

* Checks if the data file 'household_power_consumption.txt' is present in the subdirectory 'data'
* If not, the script checks whether the zipped archive 'household_power_consumption.zip' is present 
in the subdirectory 'data'. 
* If yes, the archive is unzipped. If not, the archive is downloaded first and then unzipped.
* Following this, the data file 'household_power_consumption.txt' is read and subsetted.

The plot script then saves its plot in PNG format in the current working directory. 
The dataframe will be used by subsequent runs of any of the other plot scripts. 