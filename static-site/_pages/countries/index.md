---
layout: single
title: Companies
---
{% assign company_pages = site.company | sort: 'title' %}
{% assign company_list = site.data.Companies | sort: 'Name' %}
Below, please find per-company pages, and per-company data sheets.

## Profile Pages
{% for company in company_pages %} <a href="{{ company.link | relative_url }}">{{ company.title }}</a> {{ site.data.json.Companies  }}{% endfor %}

## Data Sheet
{% for company in company_list %} <a href="{{ company.link | relative_url }}">{{ company.Name }}</a> {{ site.data.json.Companies  }}{% endfor %}

## Mapping

| Priority apples | Second priority | Third priority |
|-------|--------|---------|
{% for company in company_list %}| {{ company.Name }} | {{ company.Name }} | {{ company.Name }} |
{% endfor %}
