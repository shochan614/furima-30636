require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it "必須項目があれば、正しく登録できること" do
      expect(@user).to be_valid
    end
    it "ニックネームが必須であること" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "重複したニックネームが存在する場合、登録できないこと" do
      @user.save
      anther_user = FactoryBot.build(:user)
      anther_user.nickname = @user.nickname
      anther_user.valid?
      expect(anther_user.errors.full_messages).to include("Nickname has already been taken")
    end
    it "メールアドレスが必須であること" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email.delete!("@")
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "12345"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英字がないとでの入力が必須であること" do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、半角数字がないとでの入力が必須であること" do
      @user.password = "abcdef"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは全角数字では登録できないこと" do
      @user.password = "１２３４５a"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = "12345a"
      @user.password_confirmation = "12345b"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名は、苗字が必須であること" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザー本名は、名前が必須であること" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の苗字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.last_name = "name"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = "name"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザー本名の苗字のフリガナが必須であること" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザー本名の名前のフリガナが必須であること" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "ユーザー本名のの苗字のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.last_name_kana = "なまえ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.first_name_kana = "なまえ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "生年月日が必須であること" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
