require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(URI.open("https://mhst.kiranico.com/mhs2/data/monsties"))
names = doc.xpath('/html/body/div/div/div[2]/div[2]/div[1]/div/table/tbody/tr/td[1]/div')
.map(&:text)
test = doc.xpath('/html/body/div/div/div[2]/div[2]/div[1]/div/table/tbody/tr[1]/td[1]/small').map{|small| small.css('div')
    .map{|attack_type, kinship_skill, riding_action_1, riding_action_2| 
{
    attack_type: attack_type,
    kinship_skill: kinship_skill,
    riding_action_1: riding_action_1,
    riding_action_2: riding_action_2,
}
}

puts test