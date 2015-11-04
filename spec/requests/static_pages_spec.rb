require 'spec_helper'

describe "Static Pages" do
	subject{page}
  describe "Home page" do
		before{visit root_path}
		it{should have_content("Sample App")}
		it{should have_title(full_title(''))}
		it{should_not have_title("|Home")}
	end
   # it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #  visit root_path
     # expect(page).to have_content("Sample App")
   # end
	#	it "should have the base title "do
	#		visit root_path
	#		expect(page).to have_title("Ruby on Rails Tutorial Sample App")
	#	end
	#	it "should not have a costom title"do
	#		visit root_path
	#		expect(page).not_to have_title('|Home') 
#		end
 # end
	describe "Help page"do
#		it "should have the contne 'Help'"do
		before{visit help_path}
		#	expect(page).to have_content("Help")
		#end
	#	it "should have the right title 'Help'"do
	#		visit help_path
	#		expect(page).to have_title("Ruby on Rails Tutorial Sample App|Help")
	#	end
		it{should have_content("Help")}
		it{should have_title(full_title("Help"))}
	end
	describe "About page"do
	#	it "should have the content 'About Us'"do
		before{visit about_path}
	#		expect(page).to have_content("About Us")
	#	end
	#	it "should have the right title 'About Us'"do
	#		visit about_path
	#		expect(page).to have_title("Ruby on Rails Tutorial Sample App|About Us")
	#	end
		it{should have_content("About Us")}
		it{should have_title(full_title("About Us"))}
	end
	describe "Contact page"do
	#	it "should have the content 'Contact'"do
		before{visit contact_path}
	#		expect(page).to have_content("Contact")
	#	end
	#	it "should have the right title 'Contact'"do
	#		visit contact_path
	#		expect(page).to have_title("Ruby on Rails Tutorial Sample App|Contact")
	#	end
		it{should have_content{"Contact"}}
		it{should have_title(full_title("Contact"))}
	end
end













