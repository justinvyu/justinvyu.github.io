---
layout: page
title: Projects
---

<div>
<ul>
{% assign pages_list = site.pages | sort:"url" %}
{% for node in pages_list %}
    {% if node.title != null %}
    {% if node.layout == "project" %}
        <li><a href="{{ node.url }}">{{ node.title }}</a></li>
    {% endif %}
    {% endif %}
{% endfor %}
</ul>
</div>