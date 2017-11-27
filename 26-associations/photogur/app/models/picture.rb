class Picture < ActiveRecord::Base
  has_many :comments
  # Now we can do these things!
  # Picture.last.comments
  # Picture.first.comments.count
  # Picture.first.comments.where
  # Picture.first.comments <<
  # etc...
end
