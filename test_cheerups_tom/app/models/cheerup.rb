class Cheerup < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  has_many :cheerup_votes

  def self.by_votes
    #select('cheerups.*, coalesce(value, 0) as votes').joins('left join cheerup_votes on cheerup_id=cheerups.id').order('votes desc') # Want to change this ordering 
    Cheerup.all.sort { |x,y| y.votes <=> x.votes }
  end

  def votes
    read_attribute(:votes) || cheerup_votes.sum(:value)
  end

end
