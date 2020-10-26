require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品の購入' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end
    it "全ての項目が正しく入力されていれば保存できること" do 
      expect(@user_order).to be_valid
    end
    it "任意項目（building_name）が入力されていなくても保存できること" do 
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
    it "クレジットカード情報を入力しないと保存できないこと" do 
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空だと保存できないこと" do 
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeにハイフンがないと保存できないこと" do 
      @user_order.postal_code.delete!('-')
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid")
    end
    it "postal_codeが全角数字では保存できないこと" do 
      @user_order.postal_code = "１２３-４５６７"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid")
    end
    it "postal_codeが3桁-4桁以外は保存できないこと" do 
      @user_order.postal_code = "1234-5678"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid")
    end
    it "prefecture_idが1（未選択）では保存ができないこと" do 
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it "cityが空だと保存できないこと" do 
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it "house_numberが空だと保存ができないこと" do 
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが空だと保存ができないこと" do 
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが12桁以上だと保存ができないこと" do 
      @user_order.phone_number = "123456789012"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end
    it "phone_numberが10桁未満だと保存ができないこと" do 
      @user_order.phone_number = "123456789"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
