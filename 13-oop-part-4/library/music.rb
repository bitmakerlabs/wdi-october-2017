require_relative 'item'

class Music < Item

  def play
    if @borrowed
      # "#{ title }: Thriller, thriller night"

      # Sorry, this only works on Mac
      `afplay thriller_sample.mov`

      # ` is not the same as '
      # ` is not the same as "
    else
      "ERROR: #{ title } not borrowed"
    end
  end

end
