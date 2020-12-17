---
layout: post
title: Library preparation from the enriched methylated DNA fraction (MBDE DNA samples)
category: [ Library Prep, Methylation ]
tags: [ DNA, Methylation, Pico Library Prep, MBD, Stylophora, Shallow, Mesophotic ]
---

Using the [Zymo Pico Methyl Seq Kit](https://www.zymoresearch.com/products/pico-methyl-seq-library-prep-kit) on the [MBD enriched](https://fscucchia.github.io/FScucchia_Lab_Notebook-Mass_Lab/MBDE-Meth-DNA/) _Stylophora_ shallow and mesophotic samples from the pH experiment. 
For this library prep I also used the [_E. coli_ Non-Methylated Genomic DNA](https://www.zymoresearch.com/products/e-coli-non-methylated-genomic-dna) which is not supplied with the Zymo Methyl kit.

For this Library prep I used the protocol of meschedl (https://meschedl.github.io/MESPutnam_Open_Lab_Notebook/meth-comp-PMS/) with some adjustments.

### Dilution of MBDE samples

The goal is to dilute the MBDE DNA samples to get a concentration of 1 ng/µl per each. 
Prepare new 0.5 tubes with: 

|Sample|volume DNA|volume 10mM Tris HCl|
|----|----|---|
|S1|1µl|61.4µl|
|S2|1µl|53.8µl|
|S3|1µl|85.8µl|
|S4|1µl|26.1µl|
|S5|1µl|22.1µl|
|S6|1µl|16µl|

### Dilution of Non-methlated eColi DNA

Need to dilute the 2.5ng/µl _E. coli_ Non-Methylated Genomic DNA (spike-in) to be 0.025ng/µl, so a 1:100 dilution:

1µl _E. coli_ non-methylated DNA  
99µl ultra pure water

### Sample Prep 

Samples need to all include 1ng of sample, .05ng spike-in, and water up to 20µl

|sample|volume DNA|volume diluted spike|volume ultra pure water to 20µl|
|----|----|-----|----|
|S1|1µl|2µl|17µl|
|S2|1µl|2µl|17µl|
|S3|1µl|2µl|17µl|
|S4|1µl|2µl|17µl|
|S5|1µl|2µl|17µl|
|S6|1µl|2µl|17µl|

### Bisulfite Conversion

- Added 130µl lightning conversion reagent (FROM THE KIT) to each sample in a PCR tube
- Put tubes in the thermocycler Pico bisulfite conversion program: for this program I used the small thermocycler that we have in the lab (the SimpliAmp), I created the program inside the folder "methylation". 
These are the run settings: 
![Psc]({{site.baseurl}}/images/Pico bisulfite conversion.png "Psc")

**Cleanup with columns**

- Made 12 spin column, one for each sample
- Added 600µl M-binding buffer each to 12 spin columns
- Added 150µl of the bisulfite conversion reaction (all) to each individual tube
- Invert columns to mix
- Centrifuged columns at 12,000 rcf for 30 seconds and discarded flowthrough
- Added 100µl M-Wash buffer to each column
- Centrifuged columns at 12,000 rcf for 30 seconds and discarded flowthrough
- Added 200µl L-desulfonation buffer to each column
- Let them sit for 15 minutes
- Centrifuged columns at 12,000 rcf for 30 seconds and discarded flowthrough
- Added 200µl M-wash buffer to each column
- Centrifuged columns at 12,000 rcf for 30 seconds and discarded flowthrough
- Added 200µl M-wash buffer to each column
- Centrifuged columns at 12,000 rcf for **1 minute and 30 seconds** and discarded flowthrough
- Added 8µl warmed (56C) DNA elution buffer to each column and let sit for 1 minute in new 1.5mL tubes to collect
- Centrifuged columns at 12,000 rcf for 30 seconds

### Amplification with PrepAmp Primers

- Made Priming master mix on ice:
  - 2µl 5X PrepAmp buffer * 13 = 26µl
  - 1µl PrepAmp Primers (40µM) * 13 = 13µl
- Made new PCR tubes with 3µl of Priming master mix and 7µl of bisulfite treated DNA
- Kept those on ice
- Made PrepAmp Mix on ice:
  - 1µl 5X PrepAmp buffer * 13 = 13µl
  - 3.75µl PrepAmp PreMix * 13 = 48.75µl
  - 0.3µl PrepAmp polymerase * 13 = 3.9µl
- For this amplification I used the big thermocycler that we have in the lab (the Bio Rad, not the SumpliAmp), I created the program inside the folder "methylation", it is the second program inside the folder. 
**Note**: During Step 3 of **Cycle 1**, add 5.05 μl PrepAmp mix. During Step 3 of **Cycle 2**, add 0.3 μl PrepAmp Polymerase.
- Run steps:
  1. 98 for 2 minutes
  2. 8 degrees for 1 minute
  3. 8 degree hold
     **Cycle 1**: during hold vortex, spin tubes down, add 5.05µl PrepAmp Mix to each tube, vortex, spin down, and place back in thermocycler
     **Cycle 2**: during hold, vortex, spin tubes down, add 0.3µl PrepAmp Polymerase to each tube, vortex, spin down, and place back into thermocycler
  4. 8 degrees for 4 minutes
  5. 16 degrees for 1 minute with 3% ramp rate
  6. 22 degrees for 1 minute with 3% ramp rate
  7. 28 degrees for 1 minute with 3% ramp rate
  8. 36 degrees for 1 minute with 3% ramp rate
  9. 36.5 degrees for 1 minute with 3% ramp rate
  10. 37 degrees for 8 minutes
  11. repeat back from the first step one time through again

**Cleanup with Columns**

  - Made a 1.5mL tube for each sample, added 7:1 ratio DNA binding buffer, so 107.45µl of DNA binding buffer
  - Put elution buffer in thermomixer 56 degrees
  - Added DNA sample (15.35µl) to the appropriate 1.5mL tube
  - Vortexed, spun down, and added to the column
  - Centrifuged 12,000 rcf 30 seconds, discarded flowthrough
  - Added 200µl DNA wash buffer to each column
  - Centrifuged 12,000 rcf 30 seconds, discarded flowthrough
  - Added 200µl DNA wash buffer to each column
  - Centrifuged 12,000 rcf for **1 minute and 30 seconds**, discarded flowthrough
  - Transferred columns to 1.5mL tubes
  - Added 12µl warmed elution buffer to each column directly
  - Incubated 1 minute
  - Centrifuged 12,000 rcf 30 seconds

### First Amplification

  - Made 1st Amp master mix:
    - 12.5µl 2X Library Amp Mix * 13 = 162.5µl
    - 1µl Library Amp Primer(10µM) * 13 = 13µl
  - Added 13.5µl of the mix to new PCR tubes
  - Added 11.5µl of cleaned and concentrated DNA sample to the appropriate new PCR tube 
  - Vortexed, spun down, and placed in thermocycler program 1st Pico Methyl Amp program. For this amplification I used the big thermocycler that we have in the lab (the Bio Rad, not the SumpliAmp), I created the program inside the folder "methylation", it is the third program inside the folder. 
  These are the run settings (8 cycles total): 
  ![Pma]({{site.baseurl}}/images/Pico Methyl Amp.png "Pma")

**Cleanup with columns**

  - Made a 1.5mL tube for each sample, added 7:1 ratio DNA binding buffer, so 175µl of DNA binding buffer
  - Put elution buffer in thermomixer 56 degrees
  - Added DNA sample (25µl) to the appropriate 1.5mL tube
  - Vortexed, spun down, and added to the column
  - Centrifuged 12,000 rcf 30 seconds, discarded flowthrough
  - Added 200µl DNA wash buffer to each column
  - Centrifuged 12,000 rcf 30 seconds, discarded flowthrough
  - Added 200µl DNA wash buffer to each column
  - Centrifuged 12,000 rcf **1 minute and 30 seconds**, discarded flowthrough
  - Transferred columns to 1.5mL tubes
  - Added 12.5µl warmed elution buffer to each column directly
  - Incubated 1 minute
  - Centrifuged 12,000 rcf 30 seconds

### Amplification with Index Primers

- In PCR tubes combined the following:   

|sample|volume DNA|volume LibAmp MM|volume i5 primer|volume i7 primer|
|---|---|----|----|----|
|S1|12µl|11µl|1µl 1|1µl 1|
|S2|12µl|11µl|1µl 2|1µl 2|
|S3|12µl|11µl|1µl 3|1µl 3|
|S4|12µl|11µl|1µl 10|1µl 11|
|S5|12µl|11µl|1µl 11|1µl 10|
|S6|12µl|11µl|1µl 12µl|1µl 12µl|

- Vortexed, spun down, and placed in thermocycler program 2nd Pico Methyl Amp program. For this amplification I used the big thermocycler that we have in the lab (the Bio Rad, not the SumpliAmp), I created the program inside the folder "methylation", it is the fourth program inside the folder. 
These are the run settings: 
  ![2Pma]({{site.baseurl}}/images/2nd Pico Methyl Amp.png "2Pma")


**Cleanup with columns**

- Made a 1.5mL tube for each sample, added 7:1 ratio DNA binding buffer, so 175µl of DNA binding buffer
- Put elution buffer in thermomixer 56 degrees
- Added DNA sample (25µl) to the appropriate 1.5mL tube
- Vortexed, spun down, and added to the column
- Centrifuged 12,000 rcf 30 seconds, discarded flowthrough
- Added 200µl DNA wash buffer to each column
- Centrifuged 12,000 rcf 30 seconds, discarded flowthrough
- Added 200µl DNA wash buffer to each column
- Centrifuged 12,000 rcf **1 minute and 30 seconds**, discarded flowthrough
- Transferred columns to 1.5mL tubes
- Added 12µl warmed elution buffer to each column directly
- Incubated 1 minute
- Centrifuged 12,000 rcf 30 seconds
- Check DNA concentration with Nanodrop and quality with TapeStation (D5000)

Example of TapeStation results:

![Library]({{site.baseurl}}/images/library prep ts.png "Lybrary")