---
layout: single
title: Countries
sidebar:
  nav: countries
---
{% assign countries = site.data.Countries | sort: "Name" %}
{% for country in countries %}
  * {{ country.Name }} ({{ country.Continent }})
    {% assign companies = country['Related to Companies'] | split:"," %}
    {% for company in companies %}
    * {{ company }}
    {% endfor %}
{% endfor %}

