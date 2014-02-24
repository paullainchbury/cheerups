class Cheerup < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :sub_title, :cheerpoints

  default_scope order("created_at DESC")

  validates :title, :sub_title, length: { maximum: 141 }


end
