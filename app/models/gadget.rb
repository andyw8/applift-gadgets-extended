class Gadget < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  validates :name, presence: true
  validates :owner, presence: true
end
