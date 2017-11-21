require_relative 'pizza.rb'

class Pizzeria
  @@company_name = 'Super Pizza'
  @@all_pizzas = []
  def initialize(owner)
    @open = false
    @supplies = 0
    @owner_name = owner
  end

def order(toppings)
  puts "Hi! Welcome to #{@owner_name}'s #{@@company_name}! Can I take your order?"
  if @supplies > 0 && @open
    @supplies -= 1
    new_pizza = Pizza.new(toppings)
    new_pizza.bake
    4.times do
      new_pizza.cut
    end
    @@all_pizzas << new_pizza
    return new_pizza
  end
end

  def get_company_name
    @@company_name
  end

  def open_store
    @open = true
  end

  def close_store
    @open = false
  end

  def restock
    if @open == false
      @supplies = 5
    end
  end
end

pizzeria = Pizzeria.new('Sally')
pizzeria.restock
pizzeria.open_store
my_pizza = pizzeria.order(['cheese', 'mushrooms'])

pizza_shack = Pizzeria.new('Gerry')
pizza_shack.restock
pizza_shack.open_store
pizza_shack.order(['sauce'])
