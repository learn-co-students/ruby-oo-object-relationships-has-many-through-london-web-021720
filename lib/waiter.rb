class Waiter

    @@all = []

    attr_reader :name, :years_of_experiance

    def initialize(name, years_of_experiance)
        @name = name
        @years_of_experiance = years_of_experiance

        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self}
    end

    def best_tipper
        highest_tip_meal = nil
        meals.each do |meal|
            if !highest_tip_meal
                highest_tip_meal = meal
            else
                if meal.tip > highest_tip_meal.tip
                    highest_tip_meal = meal
                end
            end
        end
        highest_tip_meal.customer
    end

end