
class Pizza
  def initialize(given_toppings)
    @toppings = given_toppings
    @baked = false
    @slices = 0
  end

  def baked
    return @baked
  end

  def bake
    @baked = true
  end

  def cut
    if @baked
      @slices += 2
    end
  end

  def eat
    if @slices > 0 && @baked
      @slices -= 1
    end
  end
end


# pizza = Pizza.new(['cheese', 'green peppers'])
# pizza2 = Pizza.new(['cheese', 'pepperoni'])
# puts pizza.inspect
# puts pizza2.inspect
#
# pizza2.bake
# puts pizza.inspect
# puts pizza2.inspect

# pizza.eat
# puts pizza.inspect
#
# pizza.bake
# puts pizza.inspect
#
# pizza.cut
# puts pizza.inspect
