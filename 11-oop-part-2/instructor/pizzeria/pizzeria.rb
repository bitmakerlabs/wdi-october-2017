
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
    if @supplies >= 1 && @open
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
    return "#{@owner_name}'s #{@@company_name}"
  end

  def self.get_company_name
    @@company_name
  end

  def change_company_name(new_name)
    @@company_name = new_name
  end

  def self.inspect_pizzas
    @@all_pizzas.map do |current_pizza|
      current_pizza.baked
      current_pizza.eat
    end
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
my_pizza2 = pizzeria.order(['cheese', 'pepperoni'])

pizza_shack = Pizzeria.new('Gerry')
pizza_shack.restock
pizza_shack.open_store
pizza_shack.order(['sauce'])

puts pizzeria.get_company_name
puts pizza_shack.get_company_name

pizza_shack.change_company_name('Pizza Mania')

puts pizzeria.get_company_name
puts pizza_shack.get_company_name

puts Pizzeria.get_company_name

puts Pizzeria.inspect_pizzas.inspect
