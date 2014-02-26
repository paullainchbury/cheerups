class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation
  validates_uniqueness_of :name

  has_many :cheerups
  has_many :cheerup_votes

  def total_votes
    CheerupVote.joins(:cheerup).where(cheerups: {user_id: self.id}).sum('value')
  end

  def self.by_rep
    # select('users.*, coalesce(value, 0) as votes').joins('left join cheerup_votes on user_id=users.id') # Want to change this ordering 
    User.all.sort { |x,y| y.votes <=> x.votes }
  end

  # def self.by_votes
  #   select('cheerups.*, coalesce(value, 0) as votes').joins('left join cheerup_votes on cheerup_id=cheerups.id').order('votes desc') # Want to change this ordering 
  # end

  # def ranking
  #   CheerupVote.order("value desc").limit(10).reverse
  # end

  def votes
    read_attribute(:votes) || cheerup_votes.sum(:value)
  end

  def can_vote_for?(cheerup)
    cheerup_votes.build(value: 1, cheerup: cheerup).valid?
  end
end
