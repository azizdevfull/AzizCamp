class User < ApplicationRecord
  has_many :projects
  has_many :posters, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :pcomments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
    enum role: [:user, :moderator, :admin]
    after_initialize :set_default_role, :if => :new_record?
    def set_default_role
      self.role ||= :user
    end
    

         def self.find_for_database_authentication(warden_conditions)
          conditions = warden_conditions.dup
          if (email = conditions.delete(:email))
            where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => email.downcase }]).first
          elsif conditions.has_key?(:username) || conditions.has_key?(:email)
            where(conditions.to_h).first
          end
        end
        validates :email, presence: true
        validate :validate_username

def validate_username
  if User.where(email: username).exists?
    errors.add(:username, :invalid)
  end
end
end
