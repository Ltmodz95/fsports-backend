require 'rails_helper'

RSpec.describe PriceCalculator do
  let(:product) { create(:product, base_price: 100) }
  let(:component1) { create(:component, product: product) }
  let(:component2) { create(:component, product: product) }
  let(:option1) { create(:option, component: component1, price: 50) }
  let(:option2) { create(:option, component: component2, price: 30) }
  let(:price_adjustment) { create(:price_adjustment, first_option: option1, second_option: option2, price: 10) }

  describe '#calculate_price' do
    context 'when no options are selected' do
      it 'returns base price with no adjustments' do
        calculator = described_class.new([], product.id)
        total_price, adjustments = calculator.calculate_price
        expect(total_price).to eq(100)
        expect(adjustments).to eq(0)
      end
    end

    context 'when options are selected without price adjustments' do
      it 'returns sum of base price and option prices' do
        calculator = described_class.new([option1.id], product.id)
        total_price, adjustments = calculator.calculate_price
        expect(total_price).to eq(150)
        expect(adjustments).to eq(0)
      end
    end

    context 'when options are selected with price adjustments' do
      before do
        price_adjustment
      end

      it 'includes price adjustments in total' do
        calculator = described_class.new([option1.id, option2.id], product.id)
        total_price, adjustments = calculator.calculate_price
        expect(total_price).to eq(190)
        expect(adjustments).to eq(10)
      end
    end
  end
end 