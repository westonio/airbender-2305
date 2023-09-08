require 'rails_helper'

RSpec.describe Character do
  before(:each) do
    data = {:_id=>"5cf5679a915ecad153ab68da",
            :allies=>["Ozai", "Zuko"],
            :enemies=>["Iroh", "Zuko", "Kuei", "Long Feng", "Mai", "Ty Lee", "Ursa"],
            :photoUrl=>"https://vignette.wikia.nocookie.net/avatar/images/1/12/Azula.png/revision/latest?cb=20140905084941",
            :name=>"Azula",
            :affiliation=>" Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)"}
      
    @character = Character.new(data)
  end

  describe 'Instance Methods' do
    it 'exists' do
      expect(@character).to be_a(Character)
    end

    it 'has the expected attributes' do
      expect(@character.name).to eq('Azula')
      expect(@character.photo_url).to be_present
      expect(@character.allies).to eq(["Ozai", "Zuko"])
      expect(@character.enemies).to eq(["Iroh", "Zuko", "Kuei", "Long Feng", "Mai", "Ty Lee", "Ursa"])
    end
  end
end