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

  describe '#random_url' do
    let(:url){build(:url)}
    it 'generates a random 6 character url' do
      short_url = url.send(:random_url)
      expect(short_url.length).to eq(6)
    end
    it 'will generate a unqiue url' do
      short_url = url.send(:random_url)
      short_url2 = url.send(:random_url)
      expect(short_url).not_to eq(short_url2)
    end
  end

end
