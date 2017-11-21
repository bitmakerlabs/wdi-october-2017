gem "activerecord", "=4.2.10"
require "mini_record"
require "active_record"

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'dbfile.sqlite3')

class Film < ActiveRecord::Base
  field :title, as: :text
  field :country, as: :text
  field :genre, as: :text
  field :rating, as: :integer
  field :description, as: :text
end
Film.auto_upgrade!
