require "rails_helper"

RSpec.describe Article, type: :model do
  describe "Validations" do
    subject { article.valid? }

    let(:user) { create(:user) }
    let(:status) { :published }
    let(:content) { Faker::Lorem.paragraph }
    let(:title) { Faker::Lorem.sentence }
    let(:article) { build(:article, title:, content:, status:, user:) }

    context "factoryのデフォルト設定に従った時" do
      it "正常にレコードを新規作成できる" do
        expect {
          create(:article)
        }.to change { Article.count }.by(1)
      end
    end

    context "全ての値が正常な時" do
      it "検証が通る" do
        expect(subject).to eq true
      end
    end

    context "ステータスが公開済みかつ、タイトルが空の時" do
      let(:title) { "" }

      it "エラーメッセージが返る" do
        expect(subject).to eq false
        expect(article.errors.full_messages).to eq ["タイトルを入力してください"]
      end
    end

    context "ステータスが公開済みかつ、本文が空の時" do
      let(:content) { "" }

      it "エラーメッセージが返る" do
        expect(subject).to be_falsy
        expect(article.errors.full_messages).to eq ["本文を入力してください"]
      end
    end

    context "ステータスが未保存かつ、すでに同一ユーザーが未保存ステータスの記事を所有していた時" do
      let(:status) { :unsaved }

      before { create(:article, status: :unsaved, user:) }

      it "例外が発生する" do
        expect { subject }.to raise_error(StandardError)
      end
    end
  end
end
