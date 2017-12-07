class Restaurant < ActiveRecord::Base

  validates :name, :opening_hour, :closing_hour, presence: true

  belongs_to :category
  has_many :reservations


  def available?(datetime, party_size)
    space_left = self.capacity - self.reservations.where(begin_time: datetime).sum(:party_size)
    space_left >= party_size
  end
end
