require 'rails_helper'

RSpec.describe Advice, type: :model do
  before do
    @advice = FactoryBot.build(:advice)
  end

  describe '新規注意点を作成' do
    context '新規注意点を作成できる時' do
      it '正しい情報が入力された時は作成できる' do
        expect(@advice).to be_valid
      end
    end
    context '新規注意点を作成できない時' do
      it 'titleが空の時は作成できない' do
        @advice.title = ''
        @advice.valid?
        expect(@advice.errors.full_messages).to include("Title can't be blank")
      end
      it 'Descriptionが空のときは作成できない' do
        @advice.description = ''
        @advice.valid?
        expect(@advice.errors.full_messages).to include("Description can't be blank")
      end
    end
  end
end
