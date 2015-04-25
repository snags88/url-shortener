class Url < ActiveRecord::Base
  before_create :shorten_url
  validates :original, presence: true
  validates :shortened, uniqueness: true


  private
    def shorten_url
      begin
        url = SecureRandom.urlsafe_base64(5) #=> handles a little bit over 1 billion unqiue urls
      end while Url.where(:shortened => url).exists?
      self.shortened = url
    end
end
