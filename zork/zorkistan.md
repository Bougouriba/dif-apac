---
title: Zorkistan
link: /country/zorkistan
cont: Z
---
{% include country-detail.html datasheet=site.data.Countries %}
{% assign country = site.members | where:"Name",page.title %}
{% assign peers = site.members | where:"Continent","Asia" %}

# Country
{{ country }}

# Peers
{{ peers }}
