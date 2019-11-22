class Account < ApplicationRecord
  belongs_to :user
  has_many :autoposts, :dependent => :destroy
  has_one :autolike, :dependent => :destroy
  has_one :autofollow, :dependent => :destroy
  has_one :autounfollow, :dependent => :destroy

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    user_name = auth[:info][:user_name]
    image_url = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
        user.user_name = user_name
        user.image_url = image_url
    end
  end
end
