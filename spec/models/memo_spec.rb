require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end

  describe '新規メモを作成' do
    context '新規メモを作成できる時' do
      it '正しい情報が入力された時は作成できる' do
        expect(@memo).to be_valid
      end
    end
    context '新規メモを作成できない時' do
      it 'titleが空の時は作成できない' do
        @memo.title = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Title can't be blank")
      end
      it 'Descriptionが空のときは作成できない' do
        @memo.description = ''
        @memo.valid?
        expect(@memo.errors.full_messages).to include("Description can't be blank")
      end
    end
  end
end
