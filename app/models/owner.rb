class Owner < ApplicationRecord
  has_many :pets, :dependent => :destroy
  validates :first_name, uniqueness: true
  validate :validate_age
  

  def validate_age
      if self.age < 18
        errors.add(:age, "Got to be over 18")
      end
    end


  def full_name
    "#{first_name} #{last_name}"
  end
end
