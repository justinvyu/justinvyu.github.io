---
layout: project
title: Consensus Simulation
date_string: February—April 2019
date: 2019-02
image: "images/consensus-twonodes.png"
---

**Project Link:** [https://github.com/rustielin/Consensus-Simulation](https://github.com/rustielin/Consensus-Simulation)

#### Technologies Used
Flask, Javascript, Socketio

#### Screenshots

<div class="container" style="margin: 2rem 0;">
  <div class="row">
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/consensus-twonodes.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">
        2 Node (2 Browser Tabs) Simulation 2️⃣
        </h5>
        <p class="card-text">
        Here, we see 2 nodes with equal "hashpower," with network events (block proposals) with packaged
        transactions on the left.
        </p>
        </div>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/consensus-fournodes.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">
        4 Node (4 Browser Tabs) Simulation 4️⃣
        </h5>
        <p class="card-text">
        This example as four browser tabs open, each with different unique IDs as well as an uneven split in 
        hashpower. The node on the bottom-right has 51% voting power, which allows it to perform a 51%
        attack. The network is dominated by that node!
        </p>
        </div>
    </div>
    </div>
  </div>
</div>

#### Summary

This was an internal project I worked on in my second semester at Blockchain at Berkeley.

Consensus mechanisms are at the core of many distributed systems. Consensus can be approximated (as with standard internet architecture), or can be explicitly defined and executed in conjunction with Sybil control systems, as with many of the blockchain systems we study within Blockchain at Berkeley. It is often difficult to compare consensus mechanisms. Efforts have been made to compare them in academic manner via papers, blogs, etc., but nothing truly accessible in terms of educational and pedagogical standpoint. 

The vision is to create a consensus mechanism simulation that can model network behavior given initial parameters such as network topology, block size, choice of algorithm, etc. One clarification is that the simulation is less of a real scientific simulation requiring HPC, but rather a clean way for users to interact and play with consensus mechanisms – a visual and primarily educational tool rather than a number-crunching scientific simulation. 