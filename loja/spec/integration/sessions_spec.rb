require 'spec_helper'

describe "operator login" do
  context 'operator login is successful' do
    before :each do
      @operator = FactoryGirl.create(:operator)
    end

    it "allows operators to login with an email address and password" do
      visit "/login"

      fill_in "session_email",       :with => @operator.email
      fill_in "session_password",    :with => @operator.password

      find('input[name="commit"]').click

      expect(page.current_path).to eq '/admin'
    end
  end

  context 'operator login fails' do
    it "redirects to the login page again" do
      visit "/login"
      
      fill_in "session_email",       :with => 'thisemaildoesntexists'
      fill_in "session_password",    :with => 'not'

      find('input[name="commit"]').click

      expect(page.current_path).to eq '/login'
    end
  end
end