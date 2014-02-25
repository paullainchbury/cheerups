class Cheerup < ActiveRecord::Base
  belongs_to :user
  make_flaggable :inappropriate
  attr_accessible :title, :sub_title, :cheerpoints, :image

  default_scope order("created_at DESC")

  validates :title, :sub_title, length: { maximum: 141 }




end
