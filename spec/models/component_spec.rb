require 'rails_helper'

RSpec.describe Component, type: :model do
  describe 'validations' do
    let(:category) { create(:category) }
    let(:product) { create(:product, category: category) }
    let(:valid_component) { build(:component, product: product) }

    it 'is valid with valid attributes' do
      expect(valid_component).to be_valid
    end

    it 'is not valid without a product' do
      component = build(:component, product: nil)
      expect(component).not_to be_valid
    end

    it 'is not valid without a name' do
      component = build(:component, name: nil, product: product)
      expect(component).not_to be_valid
    end
  end

  describe 'attributes' do
    let(:category) { create(:category) }
    let(:product) { create(:product, category: category) }
    let(:component) { create(:component, product: product) }

    it 'has a name' do
      expect(component.name).to be_present
    end

    it 'belongs to a product' do
      expect(component.product).to eq(product)
    end
  end
end

