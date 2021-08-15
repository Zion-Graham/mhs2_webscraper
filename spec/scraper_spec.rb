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
  describe '.data_under_names' do
    before(:context) do
      @anjanath, @zinogre, @zamtrios = Scraper.data_under_names
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
    describe 'First Monstie (Anjanath)' do
      RSpec.shared_examples 'Static Anjanath Stats' do
        it 'has 10 speed' do
          expect(subject[:speed]).to eq(10)
        end
        it 'has 5 crit rate' do
          expect(subject[:crit_rate]).to eq(5)
        end
      end
      context 'level 1' do
        subject { @anjanath_stats[0] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 1,
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
      context 'level 10' do
        subject { @anjanath_stats[1] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 10,
            health_points: 136,
            recovery: 35,
            attack: {
              normal: 90,
              fire: 120,
              water: 60,
              electric: 90,
              ice: 90,
              dragon: 90
            },
            defence: {
              normal: 59,
              fire: 79,
              water: 40,
              electric: 59,
              ice: 59,
              dragon: 59
            }
          )
        end
      end
      context 'level 20' do
        subject { @anjanath_stats[2] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 20,
            health_points: 178,
            recovery: 44,
            attack: {
              normal: 119,
              fire: 159,
              water: 79,
              electric: 119,
              ice: 119,
              dragon: 119
            },
            defence: {
              normal: 79,
              fire: 106,
              water: 54,
              electric: 79,
              ice: 79,
              dragon: 79
            }
          )
        end
      end
      context 'level 30' do
        subject { @anjanath_stats[3] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 30,
            health_points: 221,
            recovery: 54,
            attack: {
              normal: 153,
              fire: 205,
              water: 102,
              electric: 153,
              ice: 153,
              dragon: 153
            },
            defence: {
              normal: 126,
              fire: 168,
              water: 85,
              electric: 126,
              ice: 126,
              dragon: 126
            }
          )
        end
      end
      context 'level 40' do
        subject { @anjanath_stats[4] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 40,
            health_points: 267,
            recovery: 63,
            attack: {
              normal: 190,
              fire: 253,
              water: 126,
              electric: 190,
              ice: 190,
              dragon: 190
            },
            defence: {
              normal: 172,
              fire: 229,
              water: 115,
              electric: 172,
              ice: 172,
              dragon: 172
            }
          )
        end
      end
      context 'level 50' do
        subject { @anjanath_stats[5] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 50,
            health_points: 339,
            recovery: 72,
            attack: {
              normal: 244,
              fire: 325,
              water: 163,
              electric: 244,
              ice: 244,
              dragon: 244
            },
            defence: {
              normal: 213,
              fire: 284,
              water: 142,
              electric: 213,
              ice: 213,
              dragon: 213
            }
          )
        end
      end
      context 'level 75' do
        subject { @anjanath_stats[6] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 75,
            health_points: 461,
            recovery: 96,
            attack: {
              normal: 335,
              fire: 446,
              water: 223,
              electric: 335,
              ice: 335,
              dragon: 335
            },
            defence: {
              normal: 288,
              fire: 384,
              water: 192,
              electric: 288,
              ice: 288,
              dragon: 288
            }
          )
        end
      end
      context 'level 99' do
        subject { @anjanath_stats[7] }

        it 'has the correct stats' do
          expect(subject).to include(
            level: 99,
            health_points: 579,
            recovery: 118,
            attack: {
              normal: 422,
              fire: 563,
              water: 281,
              electric: 422,
              ice: 422,
              dragon: 422
            },
            defence: {
              normal: 360,
              fire: 480,
              water: 240,
              electric: 360,
              ice: 360,
              dragon: 360
            }
          )
        end
      end
    end
  end

  describe '.monsties' do
    before(:context) do
      @monsties = Scraper.monsties
    end
    context 'Anjanath' do
      subject { @monsties.find { |monstie| monstie[:name] == 'Anjanath' } }
      it 'has all its data' do
        expect(subject[:name]).to eq('Anjanath')
        expect(subject[:attack_type]).to eq('Power')
        expect(subject[:kinship_skill]).to eq('Anja Assault')
        expect(subject[:riding_actions]).to eq(['Roar'])
        expect(subject[:stats]).to eq(
          [
            {
              level: 1,
              health_points: 76,
              speed: 10,
              crit_rate: 5,
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
            },
            { level: 10,
              speed: 10,
              crit_rate: 5,
              health_points: 136,
              recovery: 35,
              attack: {
                normal: 90,
                fire: 120,
                water: 60,
                electric: 90,
                ice: 90,
                dragon: 90
              },
              defence: {
                normal: 59,
                fire: 79,
                water: 40,
                electric: 59,
                ice: 59,
                dragon: 59
              } },
            { level: 20,
              speed: 10,
              crit_rate: 5,
              health_points: 178,
              recovery: 44,
              attack: {
                normal: 119,
                fire: 159,
                water: 79,
                electric: 119,
                ice: 119,
                dragon: 119
              },
              defence: {
                normal: 79,
                fire: 106,
                water: 54,
                electric: 79,
                ice: 79,
                dragon: 79
              } },
            { level: 30,
              speed: 10,
              crit_rate: 5,
              health_points: 221,
              recovery: 54,
              attack: {
                normal: 153,
                fire: 205,
                water: 102,
                electric: 153,
                ice: 153,
                dragon: 153
              },
              defence: {
                normal: 126,
                fire: 168,
                water: 85,
                electric: 126,
                ice: 126,
                dragon: 126
              } },
            { level: 40,
              speed: 10,
              crit_rate: 5,
              health_points: 267,
              recovery: 63,
              attack: {
                normal: 190,
                fire: 253,
                water: 126,
                electric: 190,
                ice: 190,
                dragon: 190
              },
              defence: {
                normal: 172,
                fire: 229,
                water: 115,
                electric: 172,
                ice: 172,
                dragon: 172
              } },
            { level: 50,
              speed: 10,
              crit_rate: 5,
              health_points: 339,
              recovery: 72,
              attack: {
                normal: 244,
                fire: 325,
                water: 163,
                electric: 244,
                ice: 244,
                dragon: 244
              },
              defence: {
                normal: 213,
                fire: 284,
                water: 142,
                electric: 213,
                ice: 213,
                dragon: 213
              } },
            { level: 75,
              speed: 10,
              crit_rate: 5,
              health_points: 461,
              recovery: 96,
              attack: {
                normal: 335,
                fire: 446,
                water: 223,
                electric: 335,
                ice: 335,
                dragon: 335
              },
              defence: {
                normal: 288,
                fire: 384,
                water: 192,
                electric: 288,
                ice: 288,
                dragon: 288
              } },
            { level: 99,
              speed: 10,
              crit_rate: 5,
              health_points: 579,
              recovery: 118,
              attack: {
                normal: 422,
                fire: 563,
                water: 281,
                electric: 422,
                ice: 422,
                dragon: 422
              },
              defence: {
                normal: 360,
                fire: 480,
                water: 240,
                electric: 360,
                ice: 360,
                dragon: 360
              } }
          ]
        )
      end
    end
  end
end
