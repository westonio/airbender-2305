require 'rails_helper'

RSpec.describe 'Search Index', type: :feature do
  describe 'When I visit "/" ' do
    context 'and I select "Fire Nation" from the select field' do
      it 'Clicking [Search For Members] takes me to "/search" ' do
        visit root_path

        select 'Fire Nation', from: :nation
        click_button 'Search For Members'

        expect(current_path).to eq(search_path)
      end
    end
  end
end