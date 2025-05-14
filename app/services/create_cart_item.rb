class CreateCartItem
  def initialize(product_id, selected_options)
    @product_id = product_id
    @selected_options = Option.where(id: selected_options).pluck(:id, :name, :price).to_json
  end

  def call
    cart_item = CartItem.new(product_id: @product_id, selected_options: @selected_options)
    cart_item.cart = Current.user.cart
    cart_item
  end
  
end
