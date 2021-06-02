require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should save new product successfully' do
      @category = Category.new(name: 'other') 
      @product = Product.new(
        name: 'football',  
        price: 70,
        quantity: 10, 
        category: @category) 
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should expect error when name is set to nil and not valid' do
      @category = Category.new(name: 'other') 
      @product = Product.new(
        name: nil, 
        price: 70
        quantity: 10,
        category: @category)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'should expect error when price is set to nil and not valid' do
      @category = Category.new(name: 'other') 
      @product = Product.new(
        name: 'football',
        price: nil,
        quantity: 10,
        category: @category)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Price can't be blank")
    end

    it 'should expect error when quantity is set to nil and not valid' do
      @category = Category.new(name: 'other') 
      @product = Product.new(
        name: 'football', 
        price: 70,
        quantity: nil,
        category: @category)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'should expect error when category is set to nil and not valid' do
      @category = Category.new(name: 'other') 
      @product = Product.new(
        name: 'football', 
        price: 70, 
        quantity: 10, 
        category: nil)
      @product.save
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end

  end
end