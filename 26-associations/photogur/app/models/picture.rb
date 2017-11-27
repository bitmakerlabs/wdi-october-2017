class Picture < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments
  # Now we can do these things!
  # Picture.last.comments
  # Picture.first.comments.count
  # Picture.first.comments.where
  # Picture.first.comments <<
  # Picture.first.tags
  # etc...
end
