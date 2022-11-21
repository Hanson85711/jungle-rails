require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do 
    context "all fields valid" do
      it "valid inputs" do 
        user = User.new(
          firstname: 'TestFirst',
          lastname: 'TestLast',
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user.valid?).to be true
      end
      
      it "password does not match" do 
        user = User.new(
          firstname: 'TestFirst',
          lastname: 'TestLast',
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password1'
        )
        expect(user.valid?).to be false
      end

      it "email must be unique" do 
        user = User.new(
          firstname: 'TestFirst',
          lastname: 'TestLast',
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        user1 = User.new(
          firstname: 'TestFirst',
          lastname: 'TestLast',
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        user.save
        expect(user1.valid?).to be false
      end

      it "email must be unique and not case sensitive" do 
        user = User.new(
          firstname: 'TestFirst',
          lastname: 'TestLast',
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        user1 = User.new(
          firstname: 'TestFirst',
          lastname: 'TestLast',
          email: 'TEST123@EXAMPLE.com',
          password: 'password',
          password_confirmation: 'password'
        )
        user.save
        expect(user1.valid?).to be false
      end

      it "Password not long enough" do 
        user = User.new(
          firstname: "TestFirst", 
          lastname: "TestLast",
          email: "example@example.com",
          password: "pass",
          password_confirmation: "pass"
        )
        expect(user.valid?).to be false
      end
    end

    context "Missing input" do 
      it "Missing first name" do 
        user = User.new(
          firstname: nil, 
          lastname: 'TestLast',
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user.valid?).to be false
      end

      it "Missing last name" do 
        user = User.new(
          firstname: "TestFirst", 
          lastname: nil,
          email: 'test123@example.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user.valid?).to be false
      end

      it "Missing email" do 
        user = User.new(
          firstname: "TestFirst", 
          lastname: "TestLast",
          email: nil,
          password: 'password',
          password_confirmation: 'password'
        )
        expect(user.valid?).to be false
      end

      it "Missing password" do 
        user = User.new(
          firstname: "TestFirst", 
          lastname: "TestLast",
          email: "example@example.com",
          password: nil,
          password_confirmation: "password"
        )
        expect(user.valid?).to be false
      end
      
      it "Missing password confirm" do 
        user = User.new(
          firstname: "TestFirst", 
          lastname: "TestLast",
          email: "example@example.com",
          password: "password",
          password_confirmation: nil
        )
        expect(user.valid?).to be false
      end
    end 
  end
  
  describe '.authenticate_with_credentials' do 
    it 'should pass authentication' do 
      user = User.new(
        firstname: "TestFirst", 
        lastname: "TestLast",
        email: "example@example.com",
        password: "password",
        password_confirmation: "password"
      )
      user.save 

      user = User.authenticate_with_credentials('example@example.com', 'password')
      expect(user).not_to be(nil)
    end 

    it 'should not pass authentication' do 
      user = User.new(
        firstname: "TestFirst", 
        lastname: "TestLast",
        email: "example@example.com",
        password: "password",
        password_confirmation: "password"
      )
      user.save 

      user = User.authenticate_with_credentials('example@example.com', 'wrongpassword')
      expect(user).to be(nil)
    end
    
    it 'should pass authentication even with spaces' do 
      user = User.new(
        firstname: "TestFirst", 
        lastname: "TestLast",
        email: "example@example.com",
        password: "password",
        password_confirmation: "password"
      )
      user.save 

      user = User.authenticate_with_credentials('     example@example.com   ', 'password')
      expect(user).not_to be(nil)
    end
    
    it 'should pass authentication even with caps' do 
      user = User.new(
        firstname: "TestFirst", 
        lastname: "TestLast",
        email: "example@example.com",
        password: "password",
        password_confirmation: "password"
      )
      user.save 

      user = User.authenticate_with_credentials('ExaMplE@example.com', 'password')
      expect(user).not_to be(nil)
    end 
  end 
end
