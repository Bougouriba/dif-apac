---
title: Afghanistan
link: /country/afghanistan
cont: Asia
---

<iframe src="https://embed.kumu.io/b5cf97bbeabcf674a3b943ac2484000f" width="940" height="600" frameborder="0"></iframe>

{% include country-detail.html datasheet=site.data.Countries %}
{% assign country = site.members | where:"Name",page.title %}
{% assign peers = site.members | where:"Continent","Asia" %}

# Country
{{ country }}

# Peers
{{ peers }}
