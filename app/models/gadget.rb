class Gadget < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  validates :name, presence: true
  validates :owner, presence: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader

  scope :match_name, -> (name) { where(["lower(name) LIKE ?", "%#{name.downcase}%"]) }
end
