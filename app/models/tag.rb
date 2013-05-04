class Tag < ActiveRecord::Base
  attr_accessible :description, :hashtag, :name
  validates :user_id, presence: true
  validates :name, presence: true

  belongs_to :user
end
