require 'spec_helper'

describe User do
 # pending "add some examples to (or delete) #{__FILE__}"
 before{@user=User.new(name:"moon",email:"moonlee@163.com",password:"foobar",password_confirmation:"foobar")}
 subject{@user}
 it{should respond_to(:name)}
 it{should respond_to(:email)}
 it{should respond_to(:password_digest)}
 it{should respond_to(:password)}
 it{should respond_to(:password_confirmation)}
 it{should respond_to(:authenticate)}
 it{should be_valid}
 describe "when name is not present"do
 	before{@user.name=""}
	it{should_not be_valid}
 end
 describe "when email is not present"do
 	before{@user.email=""}
	it{should_not be_valid}
 end
 describe "when name is too long"do
 	before{@user.name="a"*51}
	it{should_not be_valid}
 end
 describe "when email format is invalid"do
 	it "it should be invalid"do
		address=%w[moon@163,com mail.163.com moon.lee@163. moon@moon+163.com]
		address.each do|invalid_address|
			@user.email=invalid_address
			expect(@user).to be_invalid
		end
	end
 end
 describe "when email format is valid"do
 	it "it should be valid"do
		address=%w[moonlee@163.com moonlee@163.com.cn a+b@163.com]
		address.each do|valid_address|
			@user.email=valid_address
			expect(@user).to be_valid
		end
	end
 end
 describe "when email address is already taken"do
 	before do
		user_with_same_email=@user.dup
		user_with_same_email.email=@user.email.upcase
		user_with_same_email.save
	end
	it{should_not be_valid}
 end
 describe "when password is not present"do
 	before do
		@user=User.new(name:"liwenliang",email:"liwenliang@163.com",password:"",password_confirmation:"")
		it{should_not be_valid}
	end
 end
 describe "when password doesnot match password_confirmation"do
 	before{@user.password_confirmation="mismatch"}
	it{should_not be_valid}
 end
 describe "whit a password that is too short"do
 	before{@user.password=@user.password_confirmation="a"*5}
	it{should_not be_valid}
 end
 describe "return value of authenticate method"do
 	before{@user.save}
	let(:found_user){User.find_by(email:@user.email)}
	describe "with valid password"do
		it{should eq found_user.authenticate(@user.password)}
	end
	describe "with invalid password"do
		let(:user_for_invalid_password){found_user.authenticate("invalid")}
		it{should_not eq user_for_invalid_password}
		specify{expect(user_for_invalid_password).to be_false}
	end
	 end
end
