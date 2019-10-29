---
layout: project
title: Deep-Learning Based Immunohistochemistry Scoring Predicts Progression 
       and Prognosis of Human Esophageal Cancer
---

<div class="message">
This project was a Siemens Science Competition Regional Semifinalist submission in 2017, and it
was an independent project under the guidance of Dr. Biao He of UCSF.
<br/>
Read the full paper <a href="{{ site.baseurl }}/public/documents/siemens2017.pdf">here</a>.
I also presented this project at the Synopsys Science Fair. Here was my 
<a href="{{ site.baseurl }}/public/documents/synopsys2018.pdf">poster</a>.
</div>

**Project Link:** [https://github.com/justinvyu/siemens-2017](https://github.com/justinvyu/siemens-2017)

#### Technologies Used
PyTorch, NumPy, Matplotlib

#### Abstract

Esophageal cancer (EC) is a highly lethal malignancy worldwide with a 5-
year survival rate below 20%. Accurate diagnostic tools predicting clinical outcomes
and disease progression are desperately needed. We developed PathoNet, a novel
deep-learning-based diagnostic software that automates immunohistochemistry
scoring. PathoNet was uniquely designed with four steps: (1) formatting images into
trainable tiles, (2) passing tiles through FilterNet, a convolutional neural network,
and (3) ExpressNet, another convolutional neural network; and (4) aggregating tile
scores to a final score. Instead of using packaged pre-trained models, we created our
FilterNet and ExpressNet using the open-source PyTorch library, modeling after
AlexNet architecture. PathoNet is currently optimized to score E-Cadherin
(PathoNet-E-Cad), a biomarker that may predict EC progression and overall
survival. Trained with 3072 tiles, PathoNet scores showed 85.62% tile-level
concordance and 91.67% image-level concordance with pathologists, outperforming
published automated immunohistochemistry scoring systems. We demonstrated the
clinical potential of PathoNet-E-Cad by testing on 473 patient samples. The
PathoNet-E-Cad score is associated with esophageal disease progression. Low
PathoNet-E-Cad score is significantly correlated with better overall survival
(p=0.043) and predicts optimal treatment outcomes of EC (p=0.027). More
biomarkers are being integrated into PathoNet to further facilitate EC prognosis.

#### Figures

<div class="container" style="margin: 2rem 0;">
  <div class="row">
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/siemens2016-lookalike.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">
        Oil Spill (left) vs. Lookalike Ocean Film (right)
        </h5>
        <p class="card-text">
        It's hard for the human eye to distinguish oil spills and lookalikes films in
        the water from satellite radar imagery. Ideally, an autonomous system would be
        able to accurately flag oil spills and send coastal cleanup crews.
        </p>
        </div>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/siemens2016-ga.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">
        Genetic Algorithm Diagram
        </h5>
        <p class="card-text">
        Algorithm composes of four main steps:
        <ol>
        <li>Elitism (the best "genes" of each generation is passed on)</li>
        <li>Selection (remaining gene pool competes to survive)</li>
        <li>Mutation (random chance)</li>
        <li>Crossover (current generation "reproduces" to create a generation with mixed genes)</li>
        </ol>
        </p>
        </div>
    </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/siemens2016-features.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">
            Emergence of optimal features
        </h5>
        <p class="card-text">
            The evolution of feature usage over the course of a single run (50 generations)
            of the genetic algorithm. For every feature K, the frequency that it is used
            is calculated by taking the number of appearances in the population divided by the
            population size, and the corresponding cell is colored according to the legend on the right.
        </p>
        </div>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/siemens2016-accuracy.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">
            Learning curve over 50 generations
        </h5>
        <p class="card-text">
            The mean classification accuracy of the population of solutions throughout the
            course of one trial (50 generations): ranges from around 69% to 81% in overall accuracy
            for an improvement of 12% accuracy from the original population.
        </p>
        </div>
    </div>
    </div>
  </div>
</div>

#### Method
