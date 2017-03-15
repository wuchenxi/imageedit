class Image < ActiveRecord::Base
  belongs_to :user
  validates :src, presence: true
  validates :name, presence: true
end
