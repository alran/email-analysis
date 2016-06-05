class Company < ActiveRecord::Base

  has_many :users
  has_many :analyses, foreign_key: "user_id"
  # belongs to :admin, class name user

end
