require 'rubygems'
require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_depute (url)
    doc = Nokogiri::HTML(open(url))
    a = doc.xpath('//div[@class="interieur-contenu-principal clearfix"]') #affiche le html avec les li et a
    a = Array.new(doc.xpath('//a[starts-with(@href,"mailto:")]').map { |link| link['href'][7..-1] })# va cherché le href avec mailto et suprrime mailto
    return a[0] #affiche le premier element
end


def email 
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    a = doc.xpath('//div[@class="clearfix col-container"]') #affiche le html avec les li et a
    a = a.css('a').map { |link| link['href'] } # donne /deputes/fiche/OMC_######
    a = a.map do |i| url = "http://www2.assemblee-nationale.fr" + i.to_s  # url bon format
    email = get_the_email_of_a_depute(url) # on affiche les emails pour chaques députés
    puts email
    end
end

def names
    doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    names = doc.xpath('//div[@class="clearfix col-container"]') #affiche le html avec les li et a
    names = names.css('a').map { |i| i.text }  #affiche la liste des noms des députés
    puts names
end


hash_deputes = Hash[names.zip(email)]
puts hash_deputes






