class Gadget < ActiveRecord::Base
  validates :name, presence: true
end
