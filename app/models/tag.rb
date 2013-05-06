class Tag < ActiveRecord::Base
  attr_accessible :description, :hashtag, :name, :image
  validates :user_id, presence: true
  validates :name, presence: true

  belongs_to :user
  has_attached_file :image #, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  before_create :create_and_assign_hashtag

  private

  def create_and_assign_hashtag
    hashtag = SecureRandom.urlsafe_base64(6)
    self.hashtag = hashtag
    code = "http://qtag.herokuapp.com/" + hashtag
    qr = RQRCode::QRCode.new(code, :size => 5)
    image = qr.to_image(5)
    temp_file = Tempfile.new([hashtag, '.png'])
    temp_file.write image
    temp_file.flush
    self.image = temp_file
    temp_file.close
  end
end
