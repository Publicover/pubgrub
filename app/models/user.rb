# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entrees, inverse_of: :user, dependent: :destroy
  has_many :sides, inverse_of: :user, dependent: :destroy
  has_many :staples, inverse_of: :user, dependent: :destroy
  has_many :recipes, inverse_of: :user, dependent: :destroy
  has_many :food_logs, inverse_of: :user, dependent: :destroy

  enum role: {
    admin: 0,
    member: 1
  }
end
