---
layout: post
title: Measure 3D thickness of coral skeleton with Fiji (ImageJ)
category: [ Skeleton, micro-CT, image analysis ]
tags: [ Biomineralization, Stylophora, primary polyps, skeletal thickness ]
---

Measuring 3D thickness of the skeletal septa of _Stylophora pistillata_ primary polyps. A laboratory micro-CT (Skyscan1172, Bruker micro-CT, Belgium) was used to image the primary polyps. Scan data were viewed in 3D using CTvox (v 3.0, Brucker-microCT, Belgium) and analyzed as a stack.



### Thresholding on the z-stack

- Open the stack using [Fiji](https://imagej.net/Fiji) (I worked with a stack in .avi format).
- Go to Image>Type and select `8-bit` (threshold can only performed on greyscale images).
- Go to Analyze>Set Scale and spatially calibrate you stack with the desired units. 
- Go to Image>Adjust>Threshold and select `Otsu` as thresholding approach. You can select any color for your thresholded image (Red, B&W, Over/Under). Scroll among the thresholded images in the stack to find the best threshold percentage, that can be adjusted using the arrows in the threshold menu. 

![Threshold]({{site.baseurl}}/images/Threshold.gif "Threshold")

Then click on `Apply`, choose the background color in the new menu window that pops up and mark `Calculate threshold for each image`. 

### Measure septa volume (thickness)

- Go to Analyze>Tool>ROI manager (a new menu window will pop up). Select the `Polygon selection` in the main Fiji menu and select the area of interest (skeletal septa) along the z-stack (I drew the interest area making sure that the chosen septa was always contained in this area all along the z-stack, by moving back and forth along the stack). After the areas is selected, click `Add` on the ROI manager menu.
- Go to Plugins from the main menu and select `Voxel Counter`. If you don't have this plugin you can download it from [here](https://imagej.nih.gov/ij/plugins/voxel-counter.html). This plugin counts the thresholded voxels in a stack and displays the count, the average count per slice and the volume fraction (ratio of thresholded voxels to all voxels). If there is a ROI as in this case, the voxel counts and volume fraction are based on the substack defined by that ROI.
When you click on `Voxel Counter` a new pop up menu will display the resulting `Thresholded volume` (thickness) of the selected septa.

![Threshold result]({{site.baseurl}}/images/Threshold result.jpg "Threshold result")





