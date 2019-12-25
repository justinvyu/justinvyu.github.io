---
layout: page
title: Projects ⚙️
---

<div class="card-columns">
<!-- <div class="row row-cols-1 row-cols-md-3"> -->
{% assign pages_list = site.pages | sort:"url" %}
{% for node in pages_list %}
    {% if node.title != null %}
    {% if node.layout == "project" %}
        <!-- <div class="col mb-4"> -->
        <div class="card">
            {% if node.image != null %}
            <img src="{{ node.image }}" class="card-img-top" alt="...">
            {% endif %}
            <div class="card-body bg-light">
            <a href="{{ node.url }}"><h5 style="margin-bottom: 0; color: #6a9fb5;">{{ node.title }}</h5></a>
            <!-- <p class="card-text">Description.</p> -->
            </div>
        </div>
        <!-- </div> -->
    {% endif %}
    {% endif %}
{% endfor %}
</div>