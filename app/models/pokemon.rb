class Pokemon < ApplicationRecord
  has_many :types
  self.per_page = 20
end
