require 'spec_helper'

describe "UserPages" do
  
  subject {  page  }
  

  describe "signup page" do
    
    before {  visit signup_path  }
    
    it {  should have_selector('h1', text: 'Sign up')  }
    it {  should have_selector('title', text: full_title('Sign up'))  }
    
    
    
    describe "with invalid information" do
      it "should not create a user" do
        old_count = User.count
        click_button "Create my account" 
        new_count = User.count
        new_count.should == old_count
      end
      
      describe "after submission" do
        before {  click_button "Create my account"}
        it { should have_selector('title', text: 'Sign up') }
        it { should have_content('error')  }
        it { should_not have_content('Password digest') }
      end
    end
    
    describe "with valid information" do
      
      # let(:submit) {  "Create my account"  }
      before do
        fill_in "Name",             with: "Example User"
        fill_in "Email",            with: "example@email.com"
        fill_in "Password",         with: "foobar"
        fill_in "Confirmation",     with: "foobar"
      end
      it "should create a user account" do
          old_count = User.count
          click_button "Create my account"
          new_count = User.count
          new_count.should == old_count + 1
      end
      
      describe "after saving a user" do
        before { click_button "Create my account" }
        let(:user) { User.find_by_email("example@email.com" )  }
        
        it {  should have_selector('title', text: user.name)  }
      end
    end
    
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before {  visit user_path(user)  }
    
    it {  should have_selector('h1', text: user.name)  }
    it {  should have_selector('title', text: user.name)  }
    
  end

 
  
end
