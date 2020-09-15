class User < ApplicationRecord
has_person_name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # validation
  validates :name, presence: true, length: {maximum: 20}
  validates_format_of :email,:with => Devise::email_regexp
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }


                    
end
