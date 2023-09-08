require 'rails_helper'

RSpec.describe AirbenderFacade, :vcr do
  describe 'Instance Methods' do
    before(:each) do
      @facade = AirbenderFacade.new('fire+nation')
    end

    it 'exists' do
      expect(@facade).to be_an(AirbenderFacade)
    end

    it 'has a nation' do
      expect(@facade.nation).to eq('fire+nation')
    end

    it 'can get the character count' do
      expect(@facade.character_count).to eq(97)
    end

    it 'can get a list of first 25 characters' do
      expect(@facade.first_25_characters).to be_an(Array)
      expect(@facade.first_25_characters.count).to eq(25)

      character = @facade.first_25_characters.first

      expect(character).to be_a(Character)
    end
  end
end