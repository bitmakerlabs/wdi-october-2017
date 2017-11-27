class Tag < ApplicationRecord
  has_and_belongs_to_many :pictures
  # Tag.first.pictures
  # etc

  # we can do this, but why would we want to?
  # has_many :comments, through: :pictures
end
