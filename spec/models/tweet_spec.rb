require 'rails_helper'

RSpec.describe Tweet, type: :model do
 before do
   @tweet = FactoryBot.build(:tweet)
 end

 describe 'ツイートの保存' do
   context "ツイートが保存できる場合" do
     it "画像とテキストがあればツイートは保存される" do
       expect(@tweet).to be_valid
     end
   end

   context "ツイートが保存できない場合" do
     it "テキストがないとツイートは保存できない" do
       @tweet.text = ""
       @tweet.valid?
     end
     it "ユーザーが紐付いていないとツイートは保存できない" do
       @tweet.user = nil
       @tweet.valid?
     end
   end
 end
end