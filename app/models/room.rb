class Room < ApplicationRecord
  after_initialize :generate_number

  validates :number, uniqueness: true

  private

  def generate_number
    self.number = 4.times.map { ('A'..'Z').to_a[rand(26)] }.join
  end
end
