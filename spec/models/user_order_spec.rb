require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品の購入' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end
    it "全ての項目が正しく入力されていれば保存できること" do 
    end
    it "任意項目（建物名）が入力されていなくても保存できること" do 
    end
    it "postal_codeが空だと保存できないこと" do 
    end
    it "postal_codeにハイフンがないと保存できないこと" do 
    end
    it "postal_codeが全角数字では保存できないこと" do 
    end
    it "postal_codeが3桁-4桁以外は保存できないこと" do 
    end
    it "prefecture_idが1（未選択）では保存ができないこと" do 
    end
    it "cityが空だと保存できないこと" do 
    end
    it "house_numberが空だと保存ができないこと" do 
    end
    it "phone_numberが空だと保存ができないこと" do 
    end
    it "phone_numberが11桁以上だと保存ができないこと" do 
    end
    it "phone_numberが10桁未満だと保存ができないこと" do 
    end
  end
end
