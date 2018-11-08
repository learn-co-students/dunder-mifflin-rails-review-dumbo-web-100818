class Employee < ApplicationRecord
  belongs_to :dog

  validates :first_name, uniqueness: true
  validates :title, uniqueness: true
end
