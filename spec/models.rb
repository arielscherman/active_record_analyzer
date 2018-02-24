class User < ActiveRecord::Base
  belongs_to :company
  has_many   :pictures, as: :imageable
end

class Company < ActiveRecord::Base
  has_many :users
  has_many :pictures, as: :imageable
end

class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
end