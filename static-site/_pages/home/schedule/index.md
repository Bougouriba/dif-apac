---
layout: single
title: Meeting Schedule
sidebar:
  title: Home
  nav: home
---
<a href="https://www.notion.so/1b088f2c46f54050be7f1a4f7edbc226?v=3a13601010de49dd9d4376ca01013748">Ofrficial Schedule and Notion Page</a>

{% assign schedule = site.data.Schedule | sort: 'When' %}
| When | Link | Responsibility | Business | Legal | Social | Focus |
|-------|--------|---------|-|-|-|-|
{% for event in schedule %}| {{ event.When }} | <a href="">Agenda & Notes Page</a> | {{ event.Responsibility }} | {{ event.Business }} | {{ event.Legal }} | {{ event.Social }} | {{ event.Focus }} |
{% endfor %}
