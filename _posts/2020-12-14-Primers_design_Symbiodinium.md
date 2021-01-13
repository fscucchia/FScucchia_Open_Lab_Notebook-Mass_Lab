---
layout: post
title: Primers design for Symbiodiniaceae 
category: [ qPCR, primers ]
tag: [ Stylophora, Symbiotic algae, shallow, mesophotic ]
---

Design of primers for _Symbiodinium microadriaticum_ and _Cladocopium goreaui_ to test the effect of ocean acidification on the algal endosymbiont. Samples are coming from the pH experiment with adults _S. pistillata_ corals from shallow and mesophotic reefs.

**Target genes:** genes sequences were selected from the literature and blasted against _S. microadriaticum_ and _C. goreaui_. Target sequences with the highest %identity were chosen (>85%). I did the blast search using the terminal (Hive).

| Gene name | Function | Sequence in _S. microadriaticum_ | Sequence in _C. goreaui_  |  Reference  |
| Rubisco | Carbon fixation | rna18051 | SymbC1.scaffold13663.2  |  [Mayfield et al., 2014](https://link.springer.com/article/10.1007/s10126-014-9558-z) | 
|P-type proton ATPase (PMA1)| Cellular pH regulation | rna19905 | SymbC1.scaffold4397.2 |  [Bertucci et al., 2009](https://royalsocietypublishing.org/doi/10.1098/rspb.2009.1266) |
|Glutamine synthetase| Nitrogen assimilation | rna41876 | SymbC1.scaffold11723.1 |  [Leggat et al., 2011](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0026687) |
|SWEET1| Sugar transport | rna33639 | SymbC1.scaffold493.4 |  [Maor-Landaw et al., 2019](https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.5910) |
|SWEET3| Sugar transport | rna18798 | SymbC1.scaffold19990.1 |  [Maor-Landaw et al., 2019](https://onlinelibrary.wiley.com/doi/full/10.1002/ece3.5910) |
|SAM| Normalizing gene | rna28790 | SymbC1.scaffold7218.3  |  [Rosic et al., 2011](https://pubmed.ncbi.nlm.nih.gov/20668900/) |
|Rp-S4| Normalizing gene | rna2010 | SymbC1.scaffold447.4 |  [Rosic et al., 2011](https://pubmed.ncbi.nlm.nih.gov/20668900/) |
|Cyc| Normalizing gene | rna21293 | SymbC1.scaffold9955.1  |  [Rosic et al., 2011](https://pubmed.ncbi.nlm.nih.gov/20668900/) |

### Primers design

I used both [idtdna](https://eu.idtdna.com/pages) and [NCBI Primer-blast](https://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome) for the primers design.
To find the best primers, I followed the indication from [TTB](https://toptipbio.com/real-time-pcr-primer-blast/). Briefly:

- PCR product size: 70 – 200 base pairs.
- Primer length: 18 – 22 nucleotides (optimal: 20).
- GC% content: 50 – 60%. Primers should have similar GC%.
- Tm: 59 – 65 °C (optimal: 62 °C). Primers should have similar Tm that are within 5 °C of each other.
- Avoid nucleotide repeats: Avoid repeats of 4 or more adjacent repeats (e.g. GTTTT) and/or dinucleotide repeats (e.g. GCGCGCGC).
- Select primers that bind near the 3’ end of the gene: This is particularly important if using oligo(dT)s during the first strand cDNA synthesis which bind to the polyA tail at the 3’ end of the gene. Some large genes may not amplify completely when using oligo(dT)s, therefore by having primers that bind to the 3’ end the efficiency should improve.
- Low self-complementarity score: Pick primers which have a low self-complementarity score, as given in the NCBI Primer-BLAST detailed primer report. Self-complementarity is the likelihood that the primer will bind to itself and to the other primer in the pair.
- Low self 3’-complementarity score: Pick primers which have a low self 3’-complementarity score, as given in the NCBI Primer-BLAST detailed primer report. Self 3’-complementarity is the likelihood that the primer will bind to itself and to the other primer in the pair at the 3’ end. High scores are a good predictor of primer dimer formation.
- Primers specific to your target: The advantage of using Primer-BLAST to design real-time PCR primers is that the software also BLASTs the primer sequence against the genome of the organism of interest. This means that the software will tell you if the primers are likely to bind elsewhere in the genome, which you obviously want to avoid. Make sure your primer pairs are specific for your intended target.

**Steps**

1. I used the [PrimerQuest Tool](https://eu.idtdna.com/pages/tools) to design the primers for _S. microadriaticum_ or _C. goreaui_ using the target sequences, retrieved using blast. As input paramters for the primers design, I used the indication written above. 
2. When getting the resulting primer sets (I usually set the search to get 5 primer sets), I double checked all primers on [NCBI Primer-blast](https://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome) to make sure that the primers were specific to the target sequence and that they had a low self-complementarity score. I then chose the best primers set by following the indication above.

**Additional considerations**

Before designing the primers, I aligned the sequences of the same gene from _S. microadriaticum_ and _C. goreaui_ using [Jalview](https://www.jalview.org/) (pairwise alignment), in order to find the shared regions between the genes. The idea was to design the same primer pairs for each gene for both symbiont species, but when I aligned the genes the shared sequences that I found were either too short for being chosen as primers, to close to each other (very short product length), or they did not meet the criteria above (high self-complementarity, low Tm, bad GC% content).
So I ended up designing different primers for the same gene for each species. 

**Next steps**

- All primers will have to be tested, by checking their specificity (PCR, check the amplicon size) and efficiency (qPCR).



