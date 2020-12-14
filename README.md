# dif-apac
Support DIF APAC/ASEAN Data Collection

Please feel free to make 

## Branches

  * main
    Commits to this branch trigger the publication of a jekyll
    driven github pages static site.

  * gh-pages?

## Repository Layout

### top level
  * companies.csv
  * regulations.csv
  * contacts.csv

### static-site

  * this is a jekyll site using the minimal mistakes theme
  * data-processing is responsible for combining data from various data
    sources and putting it in static-site/_data.
  * .github/workflows/github-pages.yml defines the workflow that
    publishes data

### data-processing


