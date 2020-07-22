require 'rails_helper'

describe TweetsController, type: :request do
  before do
    user = FactoryBot.create(:user)
    @tweet = FactoryBot.create(:tweet, user_id: user.id)
  end

  after do
    User.all.destroy_all
    Tweet.all.destroy_all
  end

  describe 'GET #new' do
    it "リクエストが成功すること" do
      get new_tweet_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    it 'リクエストが成功すること' do
      get edit_tweet_path @tweet
      expect(response.status).to eq 200
    end
    it 'テキストが表示されていること' do
      get edit_tweet_path @tweet
      expect(response.body).to include 'hello!'
    end

    it '画像のURLが表示されていること' do
      get edit_tweet_path @tweet
      expect(response.body).to include 'hoge.png'
    end
  end

  describe 'GET #index' do

    it 'リクエストが成功すること' do
      get root_path
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get root_path
      expect(response.body).to include @tweet.user.nickname
    end
  end
end