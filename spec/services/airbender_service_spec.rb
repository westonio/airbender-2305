require 'rails_helper'

RSpec.describe AirbenderService, :vcr do
  describe 'instance methods' do
    before(:each) do
      @service = AirbenderService.new
    end

    it 'exists' do
      expect(@service).to be_an(AirbenderService)
    end
    
    it 'can get nation characters' do
      response = @service.get_nation_characters("fire+nation")

      expect(response).to be_an(Array)
      expect(response.count).to eq(97)

      character = response.first

      expect(character).to be_a(Hash)

      expect(character).to have_key(:_id)
      expect(character[:_id]).to be_a(String)

      expect(character).to have_key(:name)
      expect(character[:name]).to be_a(String)

      expect(character).to have_key(:photoUrl)
      expect(character[:photoUrl]).to be_a(String)

      expect(character).to have_key(:allies)
      expect(character[:allies]).to be_an(Array)

      expect(character).to have_key(:enemies)
      expect(character[:enemies]).to be_an(Array)

      expect(character).to have_key(:affiliation)
      expect(character[:affiliation]).to be_a(String)
    end
  end
end