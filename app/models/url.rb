class Url < ActiveRecord::Base
  before_create :shorten_url, :add_protocol
  validates :original, presence: true
  validates :shortened, uniqueness: true

  def increment_view_count
    self.views += 1
    self.save
  end

  private
    def shorten_url
      self.shortened = random_url
    end

    def add_protocol
      self.original = "http://" + self.original
    end

    def random_url
      begin
        url = SecureRandom.urlsafe_base64(4) #=> handles a little bit over 68 billion unqiue urls
      end while Url.where(:shortened => url).exists?
      url
    end
end
