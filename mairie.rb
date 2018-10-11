require 'rubygems'
require 'open-uri'
require 'nokogiri'


def get_the_email_of_a_townhal_from_its_webpage (url)
	doc = Nokogiri::HTML(open(url))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text #trouve l'email et converti sa valeur en texte
end

get_the_email_of_a_townhal_from_its_webpage ("http://annuaire-des-mairies.com/95/vaureal.html")


def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	a = doc.xpath('//a[@class="lientxt"]') # on va chercher le xpath où se trouve les liens d'url, aussi possible avec doc.css('.lientxt')
	a = a.map do |i| url = "http://annuaire-des-mairies.com/" + i["href"][1..-1]  # on définit les éléments du array  et on renome le href # affiche entre la position 1 et -1 sur href. 1 (.) -1 (>ville)
	email = get_the_email_of_a_townhal_from_its_webpage(url) # on trouve les emails en fonction des urls
	ville = i.text # on affiche le nom de la ville en texte
	hash_ville = {:name => ville, :email => email} # on ajoute l'email et la ville dans un hash
	puts hash_ville 
	end
end

puts get_all_the_urls_of_val_doise_townhalls














#def get_all_the_emails_of_val_doise
#array_name = [get_all_the_urls_of_val_doise_townhalls]
#email = []
#array_name.to_s.map { |i| i.gsub!( /.\/95/, 'http://annuaire-des-mairies.com/95') }

#array_name.to_s.map { |i| email << get_the_email_of_a_townhal_from_its_webpage(i) }
#email.map { |i| puts i }
#end 

#get_all_the_emails_of_val_doise


