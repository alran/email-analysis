class Analysis < ActiveRecord::Base

  # belongs_to :user
  validates :content_source, presence: true

end
