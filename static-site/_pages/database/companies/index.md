---
layout: single
title: Companies
---
{% assign country_pages = site.country | sort: 'title' %}
{% assign country_list = site.data.Countries | sort: 'Name' %}
Below, please find per-country pages, and per-country data sheets.

## Profile Pages
{% for country in country_pages %} <a href="{{ country.link | relative_url }}">{{ country.title }}</a> {{ site.data.json.countries  }}{% endfor %}

## Data Sheet
{% for country in country_list %} <a href="{{ country.link | relative_url }}">{{ country.Name }}</a> {{ site.data.json.countries  }}{% endfor %}

## Mapping

| Priority apples | Second priority | Third priority |
|-------|--------|---------|
{% for country in country_list %}| {{ country.Name }} | {{ country.Name }} | {{ country.Name }} |
{% endfor %}
