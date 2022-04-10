class User < ApplicationRecord
  has_secure_password
  validates :name,
            presence: true
  validates :password,
            presence: true,
            length: { minimum: 8 }
  validates :sex, inclusion: { in: %w[男性 女性] }

  def sex=(value)
    self.class.sexes.key?(value) ? super : nil
  end

  enum sex: { 男性: 0, 女性: 1 }
end
