
class CreateOrderItem
    def initialize(product_id, selected_options)
        @product_id = product_id
        @selected_options = selected_options
    end

    def call
        order_item = OrderItem.new(product_id: @product_id)
        options = Option.where(id: @selected_options)
        options.each do |option|
            order_item.options << option
        end
        order_item.save
    end
end