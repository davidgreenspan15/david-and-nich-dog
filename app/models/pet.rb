class Pet < ApplicationRecord
  belongs_to :owner
  validate :validate_category
  def validate_category
      if self.category != "dog" && self.category != "cat" && self.category != "bird"
        errors.add(:category, "has to be a dog, cat or bird")
      end
    end
end
