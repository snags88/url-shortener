class Url < ActiveRecord::Base
  before_create :shorten_url
  validates :original, presence: true
  validates :shortened, uniqueness: true

  private
    def shorten_url
      self.shortened = random_url
    end

    def random_url
      begin
        url = SecureRandom.urlsafe_base64(4) #=> handles a little bit over 68 billion unqiue urls
      end while Url.where(:shortened => url).exists?
      url
    end
end
