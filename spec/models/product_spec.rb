require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    # Validation test for name 
    it 'does not save without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price_cents: 100, quantity: 10, category: @category)

      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    #Validation for price
    it 'does not save without a price' do
      @category = Category.new
      @product = Product.new(name: "Test Product", price_cents: nil, quantity: 10, category: @category)

      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    #Validation for quantity
    it 'does not save without a quantity' do
      @category = Category.new
      @product = Product.new(name: "Test Product", price: 100, quantity: nil, category: @category)
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    #Validation for category
    it 'does not save without a category' do
      @product = Product.new(name: "Test Product", price: 100, quantity: 10, category: nil)
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    # Validation that a product with all valid fields saves successfully
    

  end
end
