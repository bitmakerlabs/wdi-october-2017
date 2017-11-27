class Comment < ApplicationRecord
  belongs_to :picture
  # Now we have these methods:
  # Comment.first.picture
  # etc...
end
