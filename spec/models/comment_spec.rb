require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "コメント機能のテスト" do
    before do
      @comment = FactoryBot.build(:comment)
    end
    context "コメントの投稿がうまくいく時" do
      it "コメントのtextが空ではない" do
        expect(@comment).to be_valid
      end
    end
    context "コメントの投稿がうまくいかない時" do
      it "コメントのtextが空" do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end  
    end      
  end  
end
