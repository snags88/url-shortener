require 'rails_helper'

RSpec.describe Url, type: :model do
  context 'valid url' do
    let!(:url){create(:url)}

    it 'has a valid factory' do
      expect(url).to be_valid
    end
    it 'defaults view count to 0' do
      expect(url.views).to eq(0)
    end
    it 'has a shortened url' do
      expect(url.shortened).not_to be_nil
    end

  end

  context 'invalid url' do
    it 'is invalid without a url' do
      url = build(:url, original: nil)
      expect(url).not_to be_valid
    end

    it 'is invalid without a unqiue shortened url' do
      url  = create(:url)
      url2 = build(:url, shortened: url.shortened)
      expect(url2).not_to be_valid
    end
  end

  describe '#shorten_url' do
    it 'creates the shortest url'
    it 'creates a unique url'
  end

end
