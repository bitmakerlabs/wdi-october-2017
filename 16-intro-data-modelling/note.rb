gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Note < ActiveRecord::Base

  field :contact_id, as: :integer
  field :body, as: :string
  field :written_at, as: :datetime
  
end

Note.auto_upgrade!