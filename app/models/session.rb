class Session < ApplicationRecord
  belongs_to :user
  before_create :generate_token


  def generate_token
    self.token = Digest::SHA1.hexdigest([ Time.now, rand ].join)
  end
end
