class Url < ActiveRecord::Base
  before_validation :add_protocol
  before_create :shorten_url
  validates :original, presence: true
  validates :original, :shortened, uniqueness: true

  def increment_view_count
    self.views += 1
    self.save
  end

  def self.my_find_or_build_by(params)
    url = self.new(params).send(:add_protocol)
    self.find_by(:original => url) || self.new(params)
  end

  private
    def shorten_url
      self.shortened = random_url
    end

    def add_protocol
      self.original = "http://" + self.original if !self.original[/http/]
    end

    def random_url
      begin
        url = SecureRandom.urlsafe_base64(4) #=> handles a little bit over 68 billion unique urls
      end while Url.where(:shortened => url).exists?
      url
    end
end
