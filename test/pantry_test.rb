require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/pantry"
require "./lib/cook_book"
require "./lib/recipe"

class PantryTest < Minitest::Test

  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @cookbook = CookBook.new
    @pantry = Pantry.new
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_has_attributes
    assert_equal ({}), @pantry.stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_restock_pantry
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal 15, @pantry.stock_check(@ingredient1)

    @pantry.restock(@ingredient2, 7)

    assert_equal 7, @pantry.stock_check(@ingredient2)
  end

  def test_it_know_if_has_enough_ingredients_for_recipe
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)

    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient2, 7)

    assert_equal false, @pantry.enough_ingredients_for?(@recipe1)

    @pantry.restock(@ingredient2, 1)

    assert_equal true, @pantry.enough_ingredients_for?(@recipe1)
  end
end
