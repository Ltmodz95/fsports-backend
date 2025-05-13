
class OptionsCompatiblity   
    def initialize(options)
        @options = options
        @incompatible_combinations = [];
    end

    def compatible?
        incompatible_options = Set.new
        @options.combination(2) do |option, other_option|
            next if incompatible_options.include?(option)
            if IncompatablityRule.exists?(first_option_id: option, second_option_id: other_option) || IncompatablityRule.exists?(first_option_id: other_option, second_option_id: option)
                @incompatible_combinations << "#{Option.find(option).name} and #{Option.find(other_option).name} are incompatible"
                incompatible_options.add(option)
                incompatible_options.add(other_option)
            end
        end
        @incompatible_combinations.empty?
    end

    def incompatible_combinations
        @incompatible_combinations
    end
end