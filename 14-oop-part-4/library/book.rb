#require './item'
# ---same as---
require_relative 'item'

class Book < Item

  def read
    if @borrowed
      "#{ title }: It was a dark and stormy night..."
    else
      "ERROR: #{ title } not borrowed"
    end
  end

end
