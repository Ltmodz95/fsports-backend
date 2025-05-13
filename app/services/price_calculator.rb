
class PriceCalculator
    def initialize(selected_options, product)
        @selected_options = Option.where(id: selected_options)
        @product = Product.find(product)
    end

    def calculate_price
        total_price = 0
        @selected_options.each do |option|
            price_adjustments = PriceAdjustment.where(:second_option => option)
            adjustments = 0
            price_adjustments.each do |price_adjustment|
                adjustments += price_adjustment.price
            end
            total_price += option.price + adjustments
        end
        total_price + @product.base_price
    end
end