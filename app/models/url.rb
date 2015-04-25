class Url < ActiveRecord::Base
  before_create :shorten_url
  validates :original, presence: true
  validates :shortened, uniqueness: true

  def shorten_url
    self.shortened = self.original
  end

end
