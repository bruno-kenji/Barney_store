class Operator < ActiveRecord::Base
  belongs_to :sector

  #before_create :create_activation_digest
  #before_save :downcase_email
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence:true, length: { minimum: 6 }

  #def Operator.digest(string)
  #  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                BCrypt::Engine.cost
  #  BCrypt::Password.create(string, cost: cost)
  #end

  # Returns a random token.
  #def Operator.new_token
  #  SecureRandom.urlsafe_base64
  #end

  #def remember
  #  self.remember_token = Operator.new_token
  #  update_attribute(:remember_digest, Operator.digest(remember_token))
  #end

  #def authenticated?(remember_token)
  #  BCrypt::Password.new(remember_digest).is_password?(remember_token)
  #end

  #def create_activation_digest
  #  self.activation_token = Operator.new_token
  #  self.create_activation_digest = Operator.digest(activation_token)
  #end

  private
    def downcase_email
      self.email = email.downcase
    end
end
