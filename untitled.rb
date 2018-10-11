require 'open-uri'
require 'nokogiri'
require 'rubygems'

def get_the_email_of_a_townhal_from_its_webpage (url)
	doc = Nokogiri::HTML(open(url))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
end

puts get_the_email_of_a_townhal_from_its_webpage ("http://annuaire-des-mairies.com/95/vaureal.html")


def get_all_the_urls_of_val_doise_townhalls (url)
	doc = Nokogiri::HTML(open(url))
	doc.css('.lientxt')

end

puts get_all_the_urls_of_val_doise_townhalls ("http://annuaire-des-mairies.com/val-d-oise.html")



def get_all_the_emails_of_val_doise
arr = [get_all_the_urls_of_val_doise_townhalls]
arr.map.to_s {|s| s.gsub!('/.95/', 'http://annuaire-des-mairies.com/95')}
#array_name.map { |i| email << get_the_email_of_a_townhal_from_its_webpage(i) }
#email.map { |i| puts i }
end 

puts get_all_the_emails_of_val_doise
#get_all_the_emails_of_val_doise






def get_all_the_emails_of_val_doise
array_name = [get_all_the_urls_of_val_doise_townhalls]
email = []
array_name.to_s.map { |i| i.gsub!( /.\/95/, 'http://annuaire-des-mairies.com/95') }
array_name.to_s.map { |i| email << get_the_email_of_a_townhal_from_its_webpage(i) }
email.map { |i| puts i }
end 

get_all_the_emails_of_val_doise




require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_the_email_of_a_townhal_from_its_webpage (url)
	doc = Nokogiri::HTML(open(url))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
end

puts get_the_email_of_a_townhal_from_its_webpage ("http://annuaire-des-mairies.com/95/vaureal.html")


def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css('.lientxt').each do |nod|
   	puts nod.text
end

get_all_the_urls_of_val_doise_townhalls

def get_the_email_of_a_townhal_from_its_webpage 
doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
	doc.xpath('//h3/a').each do |node|
	  puts node.text
	end
end