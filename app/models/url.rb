class Url < ActiveRecord::Base
  before_validation :add_protocol
  before_create :shorten_url
  validates :original, presence: true
  validates :original, :shortened, uniqueness: true

  def increment_view_count
    self.views += 1
    self.save
  end

  private
    def shorten_url
      self.shortened = random_url
    end

    def add_protocol
      self.original = "http://" + self.original if self.original && !self.original[/http/]
    end

    def random_url
      begin
        url = SecureRandom.urlsafe_base64(4) #=> handles a little bit over 68 billion unqiue urls
      end while Url.where(:shortened => url).exists?
      url
    end
end
