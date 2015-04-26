require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "GET #new" do
    let!(:url){create(:url)}
    before {get :new}
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "assigns a Url object to @url" do
      expect(assigns(:url)).to be_a(Url)
    end
    it "assigns a new Url instance to @url" do
      expect(assigns(:url)).to be_new_record
    end
    it "assigns the top 100 urls to @urls" do
      expect(assigns(:urls)).to include(url)
    end
    it "renders the #new view" do
      expect(response).to render_template("new")
    end
  end

  describe "GET #show" do
    let!(:url){create(:url)}
    before { get :show, id: url.shortened }

    it "assigns the correct url object to @url" do
      expect(assigns(:url)).to eq(url)
    end
    it "increments the view count" do
      original_count = url.views
      url.reload
      new_count = url.views
      expect(original_count + 1).to eq(new_count)
    end
    it "redirects to correct page" do
      expect(response).to redirect_to(url.original)
    end
  end

  describe "POST #create" do
    let!(:url){create(:url)}
    context "new urls" do
      it "creates a new url" do
        expect{
          xhr :post, :create, url: attributes_for(:url)
        }.to change{Url.count}.by(1)
      end
      it "sets the new url to @url" do
        xhr :post, :create, url: {:original => url.original}
        expect(assigns(:url)).to eq(url)
      end
    end
    context "existing urls" do
      before{xhr :post, :create, url: {:original => url.original}}
      it "does not presist the same url to the database" do
        expect{
          xhr :post, :create, url: {:original => url.original}
        }.not_to change{Url.count}
      end
      it "sets the existing url to @url" do
        expect(assigns(:url)).to eq(url)
      end
    end
  end
end
