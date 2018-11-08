class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, :title, uniqueness: true

  def to_s
    "#{self.first_name } #{self.last_name} "
  end

  def employee_details
    "People call me #{self.alias}. I'm the #{self.title} at the #{self.office} location. My dog is #{self.dog.name}"
  end

  


end
