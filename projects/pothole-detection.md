---
layout: project
title: Pothole Detection
date: February 2019
image: images/pothole-web.png
---

**Project Link:** [https://devpost.com/software/deephole](https://devpost.com/software/deephole)

#### Technologies Used
Swift, Node.js, Firebase, GCP

#### Screenshots

<div class="container" style="margin: 2rem 0;">
  <div class="row">
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/pothole-web.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">Web Heatmap Interface 🔥</h5>
        <p class="card-text">
            As a city official using the app, you can check the critical areas that need
            infrastructure repair with the online dashboard.
        </p>
        </div>
    </div>
    </div>
    <div class="col-sm-6">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/pothole-ios.png" class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">iOS App 📱</h5>
        <p class="card-text">
            The iOS app allows anyone to continuously record with their phone and submit potential
            pothole images to our GCP backend. Our pretrained pothole classifier model will then
            determine whether or not it is a pothole, before adding the image with a geolocation tag
            to the database.
        </p>
        </div>
    </div>
    </div>
  </div>
</div>

#### Summary

This was a project for LA Hacks 2019. From the Devpost description:

> ##### Why did we make it?
> Bad infrastructure causes trillions of dollars in lost productivity. We thought about why it was so common to see deteriorating infrastructure, like potholes in roads and how none of us have ever really done anything to help fix the problem. We did some research and found out that the only way to report damaged infrastructure was to call a special number and it was clear that we could find a better way to help infrastructure planners make better, more data-driven decisions.

> ##### What does it do?
> Our project is a crowdsourced data platform for damaged infrastructure. A simple to use iOS app allows anyone to automatically report damaged infrastructure one encounters on the road. Using a deep convolutional neural network, our app automatically detects damaged roads and uploads a report to a database that includes the image of the damaged infrastructure and the geolocation of the damage. The app also allows the user to use a voice prompt to manually submit a report. We have also built a web application that allows infrastructure planners to visualize and gain insights from the data platform. The app includes a heat map of where damaged infrastructure has been reported and a simple table that includes data from reported damage.

> ##### How did we make it?
> The iOS app takes images during a user's drive and queries a deep neural network served on Google Cloud Machine Learning Engine in order to determine if damaged infrastructure is present in the image. If so, the app uploads a report containing the image and the location of the damage to a Firebase database. The web app interfaces with the database in order to present a heat map of infrastructure damage through the Google Maps API and a table of all the relevant data of the reports.