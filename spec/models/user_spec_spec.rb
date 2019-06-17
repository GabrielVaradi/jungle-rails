require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

  context "when all the attributes are provided" do
    it 'is valid' do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"
      user.valid?
      expect(user).to be_valid
    end
  end

  context "when first name is not provided" do
      user = User.new
      user.first_name = nil
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"

    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the first name' do
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
  end

  context "when last name is not provided" do
      user = User.new
      user.first_name = "General"
      user.last_name = nil
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"
    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the last name' do
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  context "when email is not provided" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = nil
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"
    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the email' do
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end

  context "when email is taken" do
      user1 = User.new
      user1.first_name = "General"
      user1.last_name = "Kenobi"
      user1.email = "GeneralKenobi@youreaboldone.com"
      user1.password = "Oh I don't think so"
      user1.password_confirmation = "Oh I don't think so"
      user1.save
      user2 = User.new
      user2.first_name = "General"
      user2.last_name = "Kenobi"
      user2.email = "GeneralKenobi@youreaboldone.com"
      user2.password = "Oh I don't think so"
      user2.password_confirmation = "Oh I don't think so"
      user2.save

    it 'is not valid' do
      expect(user2).to_not be_valid
    end

    it 'reports a validation error on the email' do
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
  end

  context "when password is not provided" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = nil
      user.password_confirmation = "Oh I don't think so"
    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the email' do
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
  end

  context "when password confirmation is not provided" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = nil
    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the email' do
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  context "when password does not match" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Hello there!"
    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the email' do
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end



    context "when password is too short" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh "
      user.password_confirmation = "Oh "
    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'reports a validation error on the email' do
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end



  describe '.authenticate_with_credentials' do

    context "when email does exist" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"


        it "does match" do
          user.save
          user2 = User.authenticate_with_credentials(user.email, user.password)
          expect(user2).to be_truthy
      end
    end

    context "when credentials don't match" do

      it "does not retrieve the user" do
        user = User.authenticate_with_credentials("test", "test123")
        expect(user).to be_nil
      end


    end

    context "when there are trailing white spaces" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GGGeneralKenobi@youreaboldone.com"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"

        it "should authenticate" do
          user.save
          user2 = User.authenticate_with_credentials("   #{user.email}   ", user.password)
          expect(user2).to be_truthy

      end
    end

    context "when the email isnt in the right case" do
      user = User.new
      user.first_name = "General"
      user.last_name = "Kenobi"
      user.email = "GGGeneralKENnobi@YOUReaboldone.cOM"
      user.password = "Oh I don't think so"
      user.password_confirmation = "Oh I don't think so"

        it "should authenticate" do
          user.save
          user2 = User.authenticate_with_credentials(user.email, user.password)
          expect(user2).to be_truthy

      end
    end

end
end


