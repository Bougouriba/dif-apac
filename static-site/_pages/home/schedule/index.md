---
layout: single
title: Print out a Schedule
sidebar:
  title: Home
  nav: home
---
{% assign schedule = site.data.Schedule | sort: 'Name' %}
{% for event in schedule %}
  * {{ event.Name }}
{% endfor %}
