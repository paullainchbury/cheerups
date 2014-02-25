class Cheerup < ActiveRecord::Base
  belongs_to :user
  has_many :cheerup_votes

  make_flaggable :inappropriate
  attr_accessible :title, :sub_title, :cheerpoints

  default_scope order("created_at DESC")

  validates :title, :sub_title, length: { maximum: 141 }

  def self.by_votes
    Cheerup.all.sort { |x,y| y.votes <=> x.votes }
  end

  def votes
    read_attribute(:votes) || cheerup_votes.sum(:value)
  end



end
