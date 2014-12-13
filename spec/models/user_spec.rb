require 'rails_helper'

RSpec.describe User, :type => :model do
	it "is valid with a name and email" do
		user = Fabricate(:user)
		expect(user).to be_valid
	end

	describe "name" do
		it "validates the presence" do
			user = Fabricate(:user)
			user.name = ""
			expect(user).to_not be_valid
		end

		it "validates the length " do
			user = Fabricate(:user)
			user.name = "a"*51
			expect(user).to be_invalid
		end
	end

	describe "email" do
		it "validates the presence of email" do
			user = Fabricate(:user)
			user.email = ""
			expect(user).to_not be_valid
		end		

		it "validates uniqueness" do
			user_1 = Fabricate(:user)
			user_2 = Fabricate(:user)
			user_2.email = user_1.email
			expect(user_2).to be_invalid
		end

		it "validates the length " do
			user = Fabricate(:user)
			user.email = "a"*256
			expect(user).to be_invalid
		end

		it "rejects invalid emails" do
			user = Fabricate(:user)
			invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    	invalid_addresses.each do |invalid_address|
      	user.email = invalid_address
				expect(user).to be_invalid
			end
    end

    it "is case insensitive" do
    	user_1 = Fabricate(:user)
    	user_2 = Fabricate(:user)
    	user_2.email = user_1.email.upcase
    	expect(user_2).to be_invalid
    end
	end

	describe "password" do
		it "has a minimum length of 6 characters" do
			user = Fabricate(:user)
			user.password = "a" * 5
			expect(user).to be_invalid
		end
	end
end
