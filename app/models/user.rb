class User < ActiveRecord::Base
  before_validation :set_default_role
  has_many :cheerups
  has_many :cheerup_votes
  has_many :activities
  make_flagger
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      #user.name = auth.info.name
      user.image = auth.info.image #line is here to say update image when you next login
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        # user.name = auth.info.name
        user.image = auth.info.image
      end
    end
  end

  # overloading the `MakeFlaggable` gem's `flag!` method to update by id rather than association (which doesn't work for Rails 3.2)
  def flag!(flaggable, flag)
    check_flaggable(flaggable, flag)
    if flagged?(flaggable, flag)
      raise MakeFlaggable::Exceptions::AlreadyFlaggedError.new
    end

    new_flag =    flaggings.build(:flaggable_id => flaggable.id, :flaggable_type => flaggable.class.name)
    new_flag.send :write_attribute, :flag, flag # Michael wrote this... it stinks, DON'T DO IT (next time, find a working Gem ;-)
    new_flag.save
    new_flag
  end



  def total_votes_received
    CheerupVote.joins(:cheerup).where(cheerups: {user_id: self.id}).sum('value')
  end

  def self.by_rep
    User.all.sort { |x,y| y.total_votes_received <=> x.total_votes_received }
  end

  def can_vote_for?(cheerup)
    # cheerup_votes.build(value: 1, cheerup: cheerup).valid?
    true
  end

  def role?(role)
    self.role.to_s == role.to_s
  end

  private
  def set_default_role
    self.role ||= :user
  end

end
