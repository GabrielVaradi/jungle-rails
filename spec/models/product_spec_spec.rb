require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

  context "when all the attributes are provided" do
    it 'is name valid' do
      product = Product.new
      category = Category.new
      product.category = category
      product.name = "potato"
      product.price = 10
      product.quantity = 5
      product.valid?
      expect(product).to be_valid
    end
  end

  context "when name is not provided" do
      product = Product.new
      product.name = nil
    it 'is not valid' do

      expect(product).to_not be_valid
    end

    it 'reports a validation error on the name' do
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
  end

  context "when price is not provided" do
      product = Product.new
      product.price = nil

    it 'is not valid' do
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the price' do
      product.valid?
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
  end

  context "when quantity is not provided" do
    product = Product.new
    product.quantity = nil

    it 'is not valid' do
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the quantity' do
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
  end

  context "when category is not provided" do
      product = Product.new
      category = Category.new
      product.category = category
      product.category = nil
    it 'is not valid' do
      expect(product).to_not be_valid
    end

    it 'reports a validation error on the category' do
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
end
