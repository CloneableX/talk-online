class User < ApplicationRecord
  after_initialize :generate_name

  private

  def generate_name
    self.name = Time.now.to_i
  end
end
