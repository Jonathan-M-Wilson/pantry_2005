class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingred = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        ingred << ingredient.name if ingred.include?(ingredient.name) == false
      end
    end
    ingred
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
