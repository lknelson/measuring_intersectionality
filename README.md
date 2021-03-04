# Measuring Intersectionality
Code to reproduce the models and analysis in the paper "Leveraging the Alignment between Machine Learning and Intersectionality:  Using Word Embeddings to Measure Intersectional Experiences of the Nineteenth Century U.S. South", authored by Laura K. Nelson and forthcoming in *Poetics*.

## Data

The data folder contains a copy of the collection ["First Person Narratives of the American South"](https://docsouth.unc.edu/fpn/) and ["North American Slave Narratives"](https://docsouth.unc.edu/neh/), from the library [*Documenting the American South*](https://docsouth.unc.edu/index.html), housed at Duke University. 

It also contains word embedding model produced on this collection (`word2vec_all_clean.txt`) and 40 constructed word embedding models (`word2vec_robust`) created via a radom sample (with replacement) of the sentences in the corpus, for use in producing confidence intervals.

## Scripts

`00_measuringintersectionality_constructmodels.ipynb` contains the code to reconstruct the main word embedding model, plus the 40 random models.

`01_measuringintersectionality_reproduceanalysis.ipynb` contains the code to reproduce the analysis, table, and five figures presented in the paper.


