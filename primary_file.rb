#returns the HTTP as a string
require 'HTTParty'

#lets us turn the string into a nokogiri object
require 'Nokogiri'

require 'JSON'
require 'Pry'
require 'csv'

#requesting the page to be scraped
# page = HTTParty.get('http://www.emilyslist.org/pages/entry/events')
# page = HTTParty.get('for test URLs')
page = ("<html><body><article id='content' class='base main-content' role='main'><h1>Sample Event</h1></article></body></html>") #hard-coded HTML

#converts HTML string into a nokogiri object
parse_page = Nokogiri::HTML(page) #Nokogiri’s method for converting an HTML string into a Nokogiri object

#blank array that will eventually hold the scraped content
text_array = []

#calling the nokogiri method called 'css' on the parse_page object using the target class as the paramater
#class="base main-content" is the element (in source code) that contains all the event info
#can't chain methods for emily's list website because there are no other classes inside this element
#tag I'm looking for...<article id="content" class="base main-content" role="main"></article>
section = parse_page.css('.base main-content')

#pulling each text item out of the 'section' and appending it to text_array
section.map do |item|
  post_name = a.text
  text_array.push(post_name)
end

puts "text_array: #{text_array}"

#push the array into the csv file
CSV.open('results.csv', 'w') do |csv|
  csv << text_array
end

#below allows me to see content in terminal with following procedure (even before using nokogiri):
  #ruby primary_page.rb
  #page (either variable name given above)
  #exit
# Pry.start(binding)
