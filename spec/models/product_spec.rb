require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    let(:category) { create(:category) }
    let(:valid_product) { build(:product, category: category) }

    it 'is valid with valid attributes' do
      expect(valid_product).to be_valid
    end

    it 'is not valid without a name' do
      product = build(:product, name: nil, category: category)
      expect(product).not_to be_valid
    end

    it 'is not valid without a base_price' do
      product = build(:product, base_price: nil, category: category)
      expect(product).not_to be_valid
    end

    it 'is not valid without a description' do
      product = build(:product, description: nil, category: category)
      expect(product).not_to be_valid
    end

    it 'is not valid without a category' do
      product = build(:product, category: nil)
      expect(product).not_to be_valid
    end
  end

  describe 'attributes' do
    let(:category) { create(:category) }
    let(:product) { create(:product, category: category) }

    it 'has a name' do
      expect(product.name).to be_present
    end

    it 'has a base_price' do
      expect(product.base_price).to be_present
    end

    it 'has an in_stock status' do
      expect(product.in_stock).to be_in([true, false])
    end

    it 'has a description' do
      expect(product.description).to be_present
    end
  end
end
