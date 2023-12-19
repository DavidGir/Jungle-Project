require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    # Validation test for name 
    it 'does not save without a name' do
      @category = Category.new
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)

      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    #Validation for price
    
    #Validation for quantity

    #Validation for category

    # Validation that a product with all valid fields saves successfully


  end
end
