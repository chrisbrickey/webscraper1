# webscraper1
This program scrapes a URL, parses by an HTML element name, and converts the section into a csv document.


## Technology
Ruby version 2.4.0p0


## Dependencies
* gem install nokogiri
* gem install httparty
* gem install pry


## Setup
* Run from terminal: `ruby primary_file.rb`


## Upcoming Features
* Incorporate regular expressions to make parsing less clunky
* Use mechanize to pass in forms when required (e.g. 5calls.org requires zip and issue) to get URL to scrape
* Facilitate scraping of multiple URLs by creating a class Target to store target instances with unique URLs and target_patterns
* Use spooky.js for sites that use Ajax - Nokogiri won't work alone
