require_relative '../scraper'
require 'pry'

RSpec.describe Scraper do
  describe '.get_names' do
    it 'should return all monstie names' do
      expected_names = ['Anjanath', 'Apceros', 'Aptonoth', 'Arzuros', 'Ash Kecha Wacha', 'Astalos', 'Azure Rathalos',
                        'Barioth', 'Barroth', 'Basarios', 'Bazelgeuse', 'Black Diablos', 'Black Gravios', 'Bloodbath Diablos', 'Blue Yian Kut-Ku', 'Boltreaver Astalos', 'Brachydios', 'Brute Tigrex', 'Bulldrome', 'Cephadrome', 'Congalala', 'Crimson Qurupeco', 'Deviljho', 'Diablos', 'Dreadqueen Rathian', 'Elderfrost Gammoth', 'Emerald Congalala', 'Fulgur Anjanath', 'Gammoth', 'Gendrome', 'Glavenus', 'Gravios', 'Great Baggi', 'Great Jaggi', 'Green Nargacuga', 'Grimclaw Tigrex', 'Gypceros', 'Hellblade Glavenus', 'Iodrome', 'Ivory Lagiacrus', 'Jade Barroth', 'Kecha Wacha', 'Khezu', 'Kirin', 'Kulu-Ya-Ku', 'Kushala Daora', 'Lagiacrus', 'Lagombi', 'Legiana', 'Mizutsune', 'Monoblos', 'Nargacuga', 'Nergigante', 'Nerscylla', 'Palamute', 'Palamute', 'Palamute', 'Palamute', 'Palamute', 'Palamute', 'Paolumu', 'Pink Rathian', 'Popo', 'Pukei-Pukei', 'Purple Gypceros', 'Purple Ludroth', 'Qurupeco', 'Rajang', 'Rathalos', 'Rathian', 'Red Khezu', 'Royal Ludroth', 'Ruby Basarios', 'Sand Barioth', 'Seregios', 'Shrouded Nerscylla', 'Silverwind Nargacuga', 'Stygian Zinogre', 'Teostra', 'Thunderlord Zinogre', 'Tigrex', 'Tobi-Kadachi', 'Uragaan', 'Velkhana', 'Velocidrome', 'White Monoblos', 'Yian Garuga', 'Yian Kut-Ku', 'Zamtrios', 'Zinogre']

      expect(Scraper.names).to match_array(expected_names)
    end
  end
  describe '.data_under_name' do
    before(:context) do
      @anjanath, @zinogre, @zamtrios = Scraper.data_under_name
                                              .values_at(0, -1, -2)
    end

    describe 'First Monstie (Anjanath)' do
      it 'has a power attack type' do
        expect(@anjanath[:attack_type]).to eq 'Power'
      end

      it 'has a kinship skill' do
        expect(@anjanath[:kinship_skill]).to eq 'Anja Assault'
      end

      it 'has one riding action' do
        expect(@anjanath[:riding_actions].count).to be 1
        expect(@anjanath[:riding_actions].first).to eq 'Roar'
      end
    end

    describe 'Last Monstie (Zinogre)' do
      it 'has a speed attack type' do
        expect(@zinogre[:attack_type]).to eq 'Speed'
      end

      it 'has a kinship skill' do
        expect(@zinogre[:kinship_skill]).to eq 'Voltage Crash'
      end

      it 'has one riding action' do
        expect(@zinogre[:riding_actions].count).to be 1
        expect(@zinogre[:riding_actions].first).to eq 'Jump'
      end
    end

    describe 'Second-to-last Monstie (Zamtrios)' do
      it 'has a speed attack type' do
        expect(@zamtrios[:attack_type]).to eq 'Technical'
      end

      it 'has a kinship skill' do
        expect(@zamtrios[:kinship_skill]).to eq 'Freezing Spouts'
      end

      it 'has two riding actions' do
        expect(@zamtrios[:riding_actions].count).to be 2
        expect(@zamtrios[:riding_actions]).to include('Swim', 'Monster Search')
      end
    end
  end

  describe '.stats' do
    before(:context) do
      @anjanath_stats, @zinogre_stats = Scraper.stats
                                               .values_at(0, -1)
    end
    context 'First Monstie (Anjanath)' do
      it 'has stats for levels 1, 10, 20, 30, 40, 50, 75, and 99' do
        expect(@anjanath_stats.first).to include(
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
            normal: 14,
            fire: 19,
            water: 10,
            electric: 14,
            ice: 14,
            dragon: 14
          }
        )
      end
    end
  end
end
