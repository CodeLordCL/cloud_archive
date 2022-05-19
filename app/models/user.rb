class User < ApplicationRecord
  has_many :user_files
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def fio
    "#{self.try(:last_name)} #{self.try(:first_name)} #{self.try(:middle_name)}"
  end
end
