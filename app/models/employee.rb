class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :alias, uniqueness: true
  validates :title, uniqueness: true
  validates :dog_id, presence: true


  def name
    self.first_name + " " +  self.last_name
  end
end
