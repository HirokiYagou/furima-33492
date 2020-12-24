require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "新規登録／ユーザー情報" do
    it "ニックネーム、パスワード、名前、フリガナ、生年月日が存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "ニックネームが空ではと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性である" do
      @user.save
      user2 = FactoryBot.build(:user)
      user2.email = @user.email
      user2.valid?
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it "メールアドレスは＠がないと登録できない" do
      @user.email = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email には@を含めてください")
    end
    it "パスワードが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードが5文字以下では登録できない" do
      @user.password = "aaaa1"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードが半角英数字の混合でないと登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "パスワードとパスワード（確認用）の値が一致しないと登録できない" do
      @user.password_confirmation = "a1a1a1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe "新規登録／本人情報確認" do
    it "ユーザー本名の苗字が空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名の名前が空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の苗字が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.last_name = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end
    it "ユーザー本名の名前が全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      @user.first_name = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end
    it "ユーザー本名の苗字（フリガナ）が空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名の名前（フリガナ）が空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の苗字が全角（カタカナ）でないと登録できない" do
      @user.last_name_kana = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力してください")
    end
    it "ユーザー本名の名前が全角（カタカナ）でないと登録できない" do
      @user.first_name_kana = "hoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください")
    end
    it "生年月日が空では登録できない" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
