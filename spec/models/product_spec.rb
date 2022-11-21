require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "all four fields" do 
      it "all valid inputs" do
        @product = Product.new
        @category = Category.new
        @category.name = "Test Name"
        @product.name = "Test Product"
        @product.price_cents = 12345
        @product.quantity = 5 
        @product.category = @category
        expect(@product.valid?).to be true
      end 
    end
    
    context "missing one field" do 
      it "no name input" do
        @product = Product.new
        @category = Category.new
        @category.name = "Test Name"
        @product.price_cents = 12345
        @product.quantity = 5 
        @product.category = @category
        @product.name = nil
        expect(@product.valid?).to be false  
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      
      it "no price input" do
        @product = Product.new
        @category = Category.new
        @category.name = "Test Name"
        @product.price_cents = nil
        @product.quantity = 5 
        @product.category = @category
        @product.name = "Test product"
        expect(@product.valid?).to be false  
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      
      it "no quantity input" do
        @product = Product.new
        @category = Category.new
        @category.name = "Test Name"
        @product.price_cents = 12345
        @product.quantity = nil 
        @product.category = @category
        @product.name = "Test product"
        expect(@product.valid?).to be false  
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it "no category input" do
        @product = Product.new
        @product.price_cents = 12345
        @product.quantity = 3 
        @product.category = nil 
        @product.name = "Test product"
        expect(@product.valid?).to be false  
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end        
    end 
  end 
end 

