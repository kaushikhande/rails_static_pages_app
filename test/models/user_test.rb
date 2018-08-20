require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	def setup
		@user = User.new(name: "Example User1", email: "user1@example.com",
                     password: "foobar1", password_confirmation: "foobar1")

	end

	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "   "
		assert_not @user.valid?
	end

	test "email should be present" do
	  	@user.email = "   "
	  	assert_not @user.valid?
  	end

  	test "name should not be too long" do
  		@user.name = "a"* 51
  		assert_not @user.valid?
  	end

  	test "email should not be too long" do
  		@user.email = "a"* 244 + "@example.com"
  		assert_not @user.valid?
  	end

		test "email format should be valid" do
			addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.com alice+bob@baz.cn]

			addresses.each do |address|
				@user.email = address
				assert @user.valid?, "#{address} should be valid"
			end
		end

		test "email address uniqueness" do
				duplicate_user = @user.dup
				duplicate_user.email = @user.email.upcase
				@user.save
				assert_not duplicate_user.valid?
		end

		test "email should be saved as lowercase" do
			mixed_case_email = "fooD@bas.com"
			@user.email = mixed_case_email
			@user.save
			assert_equal mixed_case_email.downcase, @user.reload.email
		end

end
