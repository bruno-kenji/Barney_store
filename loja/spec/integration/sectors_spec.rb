require 'spec_helper'

describe 'I can create a sector' do
    let(:url) { '/sectors' }
    context 'parameters are correctly passed' do
        it 'creates the new sector and redirects to /sectors' do
            visit '/sectors/new'
            save_and_open_page
            fill_in "sector_title",     :with => 'newsector'
            find("input[type='checkbox']").set(true)

            find('input[name="commit"]').click

            expect(page.current_path).to eq '/sectors'
        end
    end
end