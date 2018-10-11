require 'rubygems'
require 'open-uri'
require 'nokogiri'


def crypto
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	price = doc.css('a.price').map { |i| i.text } #converti les valeurs en string
	crypto_name = doc.css('a.currency-name-container').map { |i| i.text }
	hash_crypto = Hash[crypto_name.zip(price)]
	puts hash_crypto
end

puts crypto 
