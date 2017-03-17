class Beer < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :abw, :style
  # new -before_initialize
  # after new - after_initialize
  # before_save
  # after_save
  before_validation :random_beer

  private
    def random_beer
      if self.new_record?
      self.name = Faker::Beer.name
      self.style = Faker::Beer.style
      self.abw = Faker::Beer.alcohol
    end
    end
end
