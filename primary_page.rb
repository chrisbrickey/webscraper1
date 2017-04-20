require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

#requesting the page to be scraped
page = HTTParty.get('http://www.emilyslist.org/pages/entry/events')

#converts HTML string into a ruby object
parse_page = Nokogiri::HTML(page) #Nokogiri’s method for converting an HTML string into a Nokogiri object

#below allows me to see content in terminal with following procedure (even before using nokogiri):
  #ruby primary_page.rb
  #page (either variable name given above)
  #exit
Pry.start(binding)
