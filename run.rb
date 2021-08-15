require_relative 'scraper'

puts 'Scraping monstie data from "https://mhst.kiranico.com/mhs2/data/monsties"'
Scraper.export_json
