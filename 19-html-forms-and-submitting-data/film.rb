gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'films.sqlite3')

class Film < ActiveRecord::Base
  field :title, as: :string
  field :description, as: :text
  field :country, as: :string
  field :rating, as: :integer
  field :available, as: :boolean

end

Film.auto_upgrade!
