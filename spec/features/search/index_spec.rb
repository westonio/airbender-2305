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

    end

    context 'has a list of detailed member information' do
      it 'for the first 25 members of the nation' do

      end

      it 'shows the members names and photo (if they have one)' do

      end

      it 'shows a list of their allies or "none" ' do

      end

      it 'shows a list of their enemies or "none" ' do

      end

      it 'shows any affiliations that member has' do

      end
    end
  end
end