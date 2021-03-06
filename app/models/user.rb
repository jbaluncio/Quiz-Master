class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :for_sale_items
  has_many :questions

  validates :first_name, presence: true;
  validates :last_name, presence: true;
  validates :birthday, presence: true;
  validates :gender, presence: true;
end
