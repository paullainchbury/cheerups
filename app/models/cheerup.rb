class Cheerup < ActiveRecord::Base
  belongs_to :user
  attr_accessible :characters, :cheerpoints

  default_scope order("created_at DESC")
end
