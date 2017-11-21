
class Pizza
  def initialize(given_toppings)
    @toppings = given_toppings
    @baked = false
    @slices = 0
  end

  def bake
    @baked = true # do something here
  end

  def cut
    if @baked
      @slices += 2
    end
  end

  def eat
    if @slices > 0 && @baked
      @slices -= 1
    elsif @baked == false
      p "Pizza is not baked!"
    else @slices == 0
      p "Cut your pizza mate!"
    end
  end
end


pizza = Pizza.new(['cheese', 'green peppers'])
pizza2 = Pizza.new(['cheese'])
