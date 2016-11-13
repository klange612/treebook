class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :profile_name, presence: true
  validates :profile_name, :email, uniqueness: { case_sensitive: false }, length: { minimum: 3 }

  has_many :statuses

  def full_name
    first_name + ' ' + last_name
  end
end
