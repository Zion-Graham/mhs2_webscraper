require 'open-uri'
require 'nokogiri'

# This module scrapes Monster Hunter Stories 2 data from Kiranico
module Scraper
  @doc = Nokogiri::HTML(URI.open('Monsties MHS2 Kiranico Monster Hunter Stories 2 Wings of Ruin Database.html'))
  class << self
    def names
      @doc.xpath('/html/body/div/div/div[2]/div[2]/div[1]/div/table/tbody/tr/td[1]/div')
          .map(&:text)
          .map(&:strip)
    end

    # Gets the attack type, kinship skill, and riding actions for all monsties
    def data_under_name
      @doc.xpath('/html/body/div/div/div[2]/div[2]/div[1]/div/table/tbody/tr/td[1]/small').map do |small|
        attack_type, kinship_skill, *riding_actions = small.css('div')
        {
          attack_type: attack_type.text,
          kinship_skill: kinship_skill.text,
          riding_actions: riding_actions.map(&:text)
        }
      end
    end

    def stats
      tables = @doc.xpath('/html/body/div/div/div[2]/div[2]/div[1]/div/table/tbody/tr/td[3]/small/table')
      tables.map do |table|
        speed, crit_rate = table.css('th')
                                .map(&:text)
                                .first(2)
                                .map { |text| text.split.last.to_i }

        levels = table.css('tr')
                      .map { |tr| tr.css('td').map(&:content) }
                      .filter(&:any?)

        levels.map do |stats_array|
          {
            level: stats_array[0].to_i,
            speed: speed,
            crit_rate: crit_rate,
            health_points: stats_array[1].to_i,
            recovery: stats_array[2].to_i,
            attack: {

              normal: stats_array[3].to_i,
              fire: stats_array[4].to_i,
              water: stats_array[5].to_i,
              electric: stats_array[6].to_i,
              ice: stats_array[7].to_i,
              dragon: stats_array[8].to_i
            },
            defence: {
              normal: stats_array[9].to_i,
              fire: stats_array[10].to_i,
              water: stats_array[11].to_i,
              electric: stats_array[12].to_i,
              ice: stats_array[13].to_i,
              dragon: stats_array[14].to_i
            }
          }
        end
      end
    end
  end
  _example_monstie = {
    name: 'Anjanath',
    attack_type: 'Power',
    kinship_skill: 'Anja Assault',
    riding_actions: ['Roar'],
    stats: [
      {
        level: 1,
        speed: 10,
        crit_rate: 5,
        health_points: 76,
        recovery: 5,
        attack: {
          normal: 19,
          fire: 25,
          water: 12,
          electric: 19,
          ice: 19,
          dragon: 19
        },
        defence: {
          normal: 19,
          fire: 25,
          water: 12,
          electric: 19,
          ice: 19,
          dragon: 19
        }
      }
    ]
  }
end
