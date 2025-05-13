
class PriceCalculator
    def initialize(selected_options, product)
        @selected_options_ids = selected_options
        @selected_options = Option.where(id: selected_options)
        @product = Product.find(product)
    end

    def calculate_price
        total_price = 0
        total_price_adjustments = 0
        @selected_options.each do |option|
            price_adjustments = PriceAdjustment.where(:second_option => option, :first_option => @selected_options_ids - [option.id])
            adjustments = 0
            price_adjustments.each do |price_adjustment|
                adjustments += price_adjustment.price
            end
            total_price += option.price + adjustments
            total_price_adjustments += adjustments
        end
        [total_price + @product.base_price, total_price_adjustments]
    end
end