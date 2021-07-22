---
layout: post
title: Reconstruction of x-ray tomography data, coral primary polyps' skeletons
category: [ Tomography, Synchrotron ]
tags: [ x-ray, Beamline, Imaging, Stylophora, Skeleton, Primary polyps ]
---

Processing and reconstruction of x-ray tomography data acquired with synchrotron radiation ([BAMline](https://www.helmholtz-berlin.de/pubbin/igama_output?modus=einzel&sprache=en&gid=1658&typoid=)) of coral primary polyps' skeletons, during my visit to the Charité-Universitätsmedizin (Berlin) in the lab of Dr. Paul Zaslansky.

Tools used for data reconstruction and visualization: [TomoTools](https://github.com/RSBradley/TomoTools), [NRecon](https://umanitoba.ca/faculties/health_sciences/medicine/units/cacs/sam/media/NReconUserManual.pdf), [CTVox](https://www.blue-scientific.com/ctvox-micro-ct-volume-rendering-software/), [Fiji](https://imagej.net/software/fiji/).

### Preparing the scans, flat fields and background images

1. Open the raw data file with Fiji. Each dataset contains the flat field sets + the scan sets.
2. Go to 'Image > Stack > Tools > Make Substack', select the range of images containing the flat fields.
3. Go to 'Process > Filter > Mean' and select '2.o' as mean value (this value can be increased or decreased depending on the dataset).
4. Save the filtered flat field sets in separate folders (one set each folder) as FITS image sequences.
5. Go back to the initial dataset, go to 'Image > Stack > Tools > Make Substack', select the range of images containing the scans.
6. Save the scan sets in separate folders (one set each folder) as FITS image sequences.
7. Open the dark background files with Fiji. The background images size needs to match the scans size.
8. Go to 'Image > Stack > Z Project' and select "Average Intensity" as projection type. 
9. Then go to 'Process > Filters > Gaussian Blur'
10. Finally, save the dark background image as FITS file.

### Normalization of radiograms

Radiograms have to be background-corrected by normalization with empty beam (flat-field) images, obtained intermittently, after subtraction of dark-current images. 

1. Launch TomoTools. Select the directory with the scans (FITS files). Each scan needs to be processed independently.
2. Select the directory with the filtered flat fields. 
3. Select the dark background image.
4. Chose a directory for the result data
5. In the "Option" screen, select "Adaptive" as norm method, "Minimum Variance Fast" as flatfield method and select "None" as intensity norm methode.
![octave]({{site.baseurl}}/images/octave_2.png "octave")
6. Select a ROI in the upper area of the scan (without the sample), then select a ROI in the lower area of the scan (without the sample), finally select a continuous ROI from upper to lower area (can include the sample).
7. Convert the resulting edf fles to 16 bit TIFF files.

### Reconstruction of cross-section images

NRecon is used to reconstruct cross-section images from X-ray projections.

1. Load 16 bit TIFF files of the first scan. Select region of interest (where the sample is, the area needs to be of the same size for all scans) in the "Start" menu on the right of the screen and click on "Preview".
![area]({{site.baseurl}}/images/fine_tuning.jpg "area")
2. Go to the "Output" menu and select a range of 0-30 (this range can change depending on the sample). Select the exact same range for all samples to allow for comparisons. 
![range]({{site.baseurl}}/images/0_30_2.png "range")
3. Go to the "Start" menu and click on "Fine tuning". In the new window, select "post-alignment" to find the best misalignment compensation value. Set the number of trials to 9.
4. Then click again on "Fine tuning" and select "Ring-artifacts reduction" to find the best value for ring artifacts removal. Set the numbers of trials to 5 and the parameter steps to 3.
![rings]({{site.baseurl}}/images/rings_2.png "rings")
5. Go to the "Settings" menu and select a "Smoothing" value of 2.
6. In the "Settings" menu, select the proper rotation degree for the scans (the first scan has zero degree).
7. Go to the "Output" menu and select TIFF(16) as file format. Finally, go to the "Start" menu and select "Start". It is also possible to select "Add to batch" to process multiple scans at the same time.   

### Merging of scans

1. Open the reconstructed TIFF files with Fiji. 
2. Go to 'Process > Image calculator' and merge the scans using 'Average' as method.
3. Go to 'Image > Stack > Reslice' and select start at 'Top'.
4. Go to 'Image > Transform > Rotate' and align the scans using the grid lines.
5. Go to 'Image > Stack > Reslice' and select start at 'Left'.
6. Repeat steps 4 and 5.
7. Save stack as 'Image sequence > PNG files'.

### Data 3D visualization

1. Open the PNG files of the merged scans with CTVox.
2. Adjust the 'Opacity', 'Luminosity' and RGB colors from the drop-down menu. CTVox can be used to produce images of the 3D sample (as a whole), sections of the 3D sample, movies. 

To measure the thickness of the skeleton, follow [this](https://fscucchia.github.io/FScucchia_Lab_Notebook-Mass_Lab/Measure-3D-thickness-of-coral-skeleton-with-Fiji/) protocol.





