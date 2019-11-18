require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be valid' do 
      @product = Product.new(name: 'name', price: 2, quantity: 2, :category => @category)
      @category = Category.new(name: 'name')
      @product.valid?
      expect(@product.errors).not_to include('can\'t be blank')
    end
    it 'should not be valid if name is missing' do 
      @product = Product.new(price: 2, quantity: 2, :category => @category)
      @category = Category.new(name: 'name')
      @product.valid?
      expect(@product.errors[:name]).to include('can\'t be blank')
    end
    it 'should not be valid if price is missing' do 
      @product = Product.new(name: 'name', quantity: 2, :category => @category)
      @category = Category.new(name: 'name')
      @product.valid?
      expect(@product.errors[:price]).to include('can\'t be blank')
    end
    it 'should not be valid if quantity is missing' do 
      @product = Product.new(name: 'name', price: 2, :category => @category)
      @category = Category.new(name: 'name')
      @product.valid?
      expect(@product.errors[:quantity]).to include('can\'t be blank')
    end
    it 'should not be valid if category is missing' do 
      @product = Product.new(name: 'name', price: 2, quantity: 2)
      @category = Category.new(name: 'name')
      @product.valid?
      expect(@product.errors[:category]).to include('can\'t be blank')
    end
  end
end
