require 'rails_helper'

RSpec.describe Option, type: :model do
  describe 'validations' do
    let(:category) { create(:category) }
    let(:product) { create(:product, category: category) }
    let(:component) { create(:component, product: product) }
    let(:valid_option) { build(:option, component: component) }

    it 'is valid with valid attributes' do
      expect(valid_option).to be_valid
    end

    it 'is not valid without a name' do
      option = build(:option, name: nil, component: component)
      expect(option).not_to be_valid
    end

    it 'is not valid without a price' do
      option = build(:option, price: nil, component: component)
      expect(option).not_to be_valid
    end

    it 'is not valid without a component' do
      option = build(:option, component: nil)
      expect(option).not_to be_valid
    end
  end
end
