#returns the HTTP as a string
require 'httparty'

#lets us turn the string into a nokogiri object
require 'nokogiri'

require 'json'
require 'pry'
require 'csv'

#requesting the page to be scraped
page = HTTParty.get('http://www.emilyslist.org/pages/entry/events')
# page = HTTParty.get('for test URLs')
# page = "<html><body><article id='content' class='base main-content' role='main'><h1>Sample Event</h1></article></body></html>" #hard-coded HTML

#converts HTML string into a nokogiri object
parse_page = Nokogiri::HTML(page)
# puts "parse_page: #{parse_page}"

#blank array that will eventually hold the scraped content
text_array = []

#below calls the nokogiri method .css on the parse_page object using the target class as the paramater
#tried using method .at_css, but that only pulled the text within the article tag, not the content between two article tags
#class I'm looking for is class="base main-content" within an article tag, but using the class doesn't work so I'm using 'article' instead
#if there were multiple classes inside the main container, I could chain methods for emily's list website because there are no other classes inside this element
section = parse_page.css('article')

#pulling each text item out of the 'section' and appending it to text_array
section.map do |item|
  # post_name = a.text
  text_array.push(item)
end

puts "text_array: #{text_array}"

#push the array into the csv file
CSV.open('results.csv', 'w') do |csv|
  csv << text_array
end


# Pry.start(binding)
#above line allows me to see content in terminal with below procedure (even before using nokogiri):
  #ruby primary_file.rb
  #page (or whatever variable name given above)
  #exit
