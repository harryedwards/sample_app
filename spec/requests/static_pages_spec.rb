require 'spec_helper'

describe "StaticPages" do
  
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  
 describe "Home page" do
      before(:each) {  visit root_path }
      
      it { page.should have_selector('h1', text: 'Sample App')}
      it { page.should have_selector('title', :text => full_title('')) }
      
  end
  
  describe "Help page" do
    before(:each) { visit help_path }
       it {  page.should have_content('Help') }
       it { page.should have_selector('title', :text => full_title('Help')) }
   end
   
   describe "About page" do
     before(:each) { visit about_path }
        it {  page.should have_content('About')  }
        it { page.should have_selector('title', :text => full_title('About')) }
    end
    
    describe "Contact page" do
      before(:each) { visit contact_path }
         it {  page.should have_content('Contact')  }
         it { page.should have_selector('title', :text => full_title('Contact')) }
     end

end
