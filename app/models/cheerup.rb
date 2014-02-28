class Cheerup < ActiveRecord::Base
  mount_uploader :imageupload, ImageUploadUploader
  mount_uploader :compositeupload, CompositeUploadUploader
  belongs_to :user
  has_many :cheerup_votes
  attr_reader :compositeupload_data

  make_flaggable :inappropriate
  attr_accessible :title, :sub_title, :cheerpoints, :image, :imageupload, :imageupload_cache, :compositeupload, :compositeupload_cache, :compositeupload_data

  default_scope order("created_at DESC")

  validates :title, :sub_title, length: { maximum: 141 }, presence: true 

  def self.by_votes
    Cheerup.all.sort { |x,y| y.votes <=> x.votes }
  end

  def votes
    read_attribute(:votes) || cheerup_votes.sum(:value)
  end

  def compositeupload_data=(data)
    # decode data and create stream on them
    if data.match(%r{^data:(.*?);(.*?),(.*)$})
      split_data = {
        type:      $1, # "image/png"
        encoder:   $2, # "base64"
        data:      $3, # data string
        extension: $1.split('/')[1] # "png"
        }


      io = CarrierStringIO.new(Base64.decode64(split_data[:data]))
      # this will do the thing (photo is mounted carrierwave uploader)
      self.compositeupload = io
    end
  end

end

class CarrierStringIO < StringIO
  def original_filename
    # the real name does not matter
    "photo.jpeg"
  end

  def content_type
    # this should reflect real content type, but for this example it's ok
    "image/jpeg"
  end
end