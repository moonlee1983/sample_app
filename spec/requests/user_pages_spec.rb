require 'spec_helper'
describe "UserPages" do
	subject{page}
  describe "Sighup page" do
		before{visit signup_path}
   # it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #  get user_pages_index_path
    #  response.status.should be(200)
   # end
		it{should have_content("Sign up")}
		it{should have_title(full_title("Sign up"))}
  end
end
