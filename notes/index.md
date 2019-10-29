---
layout: page
title: Notes
---

<div>
<ul>
{% assign pages_list = site.pages | sort:"url" %}
{% for node in pages_list %}
    {% if node.title != null %}
    {% if node.layout == "note" %}
        <li><a href="{{ node.url }}">{{ node.title }}</a></li>
    {% endif %}
    {% endif %}
{% endfor %}
</ul>
</div>