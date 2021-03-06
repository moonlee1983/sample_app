require 'spec_helper'
describe "UserPages" do
	subject{page}
  describe "sighup page" do
		before{visit signup_path}
   # it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #  get user_pages_index_path
    #  response.status.should be(200)
   # end
		it{should have_content("Sign up")}
		it{should have_title(full_title("Sign up"))}
  end
	describe "profile page"do
		let(:user){FactoryGirl.create(:user)}
		before{visit user_path(user)}
		it{should have_content(user.name)}
		it{should have_title(user.name)}
	end
	describe "signup"do
		before{visit signup_path}
		let(:submit){ "Create my account" }
		describe "with invalid information"do
			it "should not create a user"do
				expect{ click_button submit }.not_to change(User,:count)
			end
		end
		describe "with valid information"do
			before do
				fill_in "Name",					with: "moonlee"
				fill_in "Email",				with: "moonlee1983@163.com"
				fill_in "Password",			with: "foobar"
				fill_in "Confirmation",	with: "foobar"
			end
			it "should create a user"do
				expect { click_button submit }.to change(User,:count).by(1)
			end
			describe "after saving the user"do
				before{click_button submit}
				let(:user){User.find_by(email:"moonlee1983@163.com")}
				it{should have_link("Sign out")}
				it{should have_title(user.name)}
				it{should have_selector("div.alert.alert-success", text: "Welcome")}
			end
		end
	end
end
	













