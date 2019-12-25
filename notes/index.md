---
layout: page
title: Notes 📒
---

<div class="card-group">
{% assign pages_list = site.pages | sort:"url" %}
{% for node in pages_list %}
    {% if node.title != null %}
    {% if node.layout == "note" %}
        <div class="card">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
            <h5 class="card-title">{{ node.title }}</h5>
            <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p> -->
            <p class="card-text"><small class="text-muted">{{ node.date }}</small></p>
            </div>
        </div>
    {% endif %}
    {% endif %}
{% endfor %}
</div>