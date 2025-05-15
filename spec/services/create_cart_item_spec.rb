require 'rails_helper'

RSpec.describe CreateCartItem do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:component) { create(:component, product: product) }
  let(:option1) { create(:option, component: component, name: 'Option 1', price: 50) }
  let(:option2) { create(:option, component: component, name: 'Option 2', price: 30) }

  before do
    allow(Current).to receive(:user).and_return(user)
  end

  describe '#call' do
    context 'when creating a cart item with options' do
      it 'creates a cart item with selected options' do
        service = described_class.new(product.id, [option1.id, option2.id])
        cart_item = service.call
        expect(cart_item).to be_a(CartItem)
        expect(cart_item.product).to eq(product)
        expect(cart_item.cart).to eq(user.cart)
        selected_options = JSON.parse(cart_item.selected_options)
        expect(selected_options.length).to eq(2)
        expect(selected_options.map { |opt| opt[0] }).to match_array([option1.id, option2.id])
        expect(selected_options.map { |opt| opt[1] }).to match_array(['Option 1', 'Option 2'])
        expect(selected_options.map { |opt| opt[2] }).to match_array(["50.0", "30.0"])
      end
    end

    context 'when creating a cart item without options' do
      it 'creates a cart item with empty selected options' do
        service = described_class.new(product.id, [])
        cart_item = service.call
        expect(cart_item).to be_a(CartItem)
        expect(cart_item.product).to eq(product)
        expect(cart_item.cart).to eq(user.cart)
        expect(cart_item.selected_options).to eq('[]')
      end
    end
  end
end 