require 'rails_helper'

RSpec.describe 'Search Index', type: :feature do
  describe 'When I visit "/" ', :vcr do
    context 'and I select "Fire Nation" from the select field' do
      it 'Clicking [Search For Members] takes me to "/search" ' do
        visit root_path

        select 'Fire Nation', from: :nation
        click_button 'Search For Members'

        expect(current_path).to eq(search_path)
      end
    end
  end

  describe 'When I have searched for a nation', :vcr do
    before(:each) do
      visit root_path

      select 'Fire Nation', from: :nation
      click_button 'Search For Members'
    end

    it 'shows the total number of people living in the nation' do
      expect(page).to have_content("97 people live in the Fire Nation")
    end

    context 'has a list of detailed member information' do
      it 'for the first 25 members of the nation' do
        expect(page).to have_css('div.character-info', count: 25)
      end
      
      it 'shows the members names and photo (if they have one)' do
        expect(page).to have_css('h4.character-name', count: 25)
        expect(page).to have_css('img.character-photo', count: 24)
        
        within('div#character-Azula') do
          expect(page).to have_content('Azula')
        end
      end

      it 'shows a list of their allies or "none" ' do
        expect(page).to have_css('p.character-allies', count: 25)
        
        within('div#character-Azula') do
          expect(page).to have_content('Allies: Ozai, Zuko')
        end

        within('div#character-EmberIslandPlayers') do
          expect(page).to have_content('Allies: None')
        end
      end

      it 'shows a list of their enemies or "none" ' do
        expect(page).to have_css('p.character-enemies', count: 25)
        
        within('div#character-Azula') do
          expect(page).to have_content('Enemies: Iroh, Zuko, Kuei, Long Feng, Mai, Ty Lee, Ursa')
        end

        within('div#character-EmberIslandPlayers') do
          expect(page).to have_content('Enemies: None')
        end
      end

      it 'shows any affiliations that member has' do
        expect(page).to have_css('p.character-affilitation', count: 25)
        
        within('div#character-Azula') do
          expect(page).to have_content("Affiliation: Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")
        end
      end
    end
  end
end