class Track < ApplicationRecord

  SHORT = 180000
  LONG  = 360000

  scope :short, -> { shorter_than(SHORT) }
  scope :medium, -> {longer_than_or_equal_to(SHORT).shorter_than(LONG) }
  scope :long, -> { longer_than_or_equal_to(LONG) }
  scope :starts_with, -> (char) { where('name ILIKE ?', "#{ char }%") }

  scope :shorter_than, -> (milliseconds) {
    where('milliseconds < ?', milliseconds) if milliseconds && milliseconds > 0
  }

  scope :longer_than_or_equal_to, -> (milliseconds) {
    where('milliseconds >= ?', milliseconds) if milliseconds && milliseconds > 0
  }

end
