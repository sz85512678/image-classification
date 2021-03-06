***************
* Description *
***************

This project targets to test the performance of 2 supervised machine learning algorihms:
(1) K-th nearest neighbours search, with PCA being applied to select features; AND
(2) Linear discriminantal classifier
The sample data is the Yale human face picture pixels data.

*********************
* Technical Details *
*********************

1. HOW TO LAUNCH THE PROJECT?

The package includes 2 folders: Data and Code. To launch the project, run the script "Main.m", or type "Main" in the command line. Make sure both folders and their subfolders (if any) to be included in the Matlab path.

2. HOW TO CHANGE CONFIGURATIONS?

The learning process is configured by various parameters, which can impose impacts to the performance of the model. To check the definitions of parameters or modify them, go to "Config.m" in the "Code" folder.

3. WHERE ARE THE INPUT DATA?

The input data are pixels number for all sample images stored as .mat file. The file is located in the "Data" folder.

4. WHAT ARE THE OUTPUTS?

The outputs of "Main.m" is the performance matrices, which include:
- Success Rate: the ratio of the number of successfully recognised faces against the number of all sample faces, in the test data set
- Type I error for each face: the incorrect rejection of a matched face
- Type II error for each face: the failure to reject a unmatched face
- Elapsed time of running the project.

Another possible output is the image of specified pixel number vector. The user can specify which picture to show in the "Config.m" file.
