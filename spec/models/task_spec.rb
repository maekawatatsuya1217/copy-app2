require 'rails_helper'

RSpec.describe Task, type: :model do

  before do
    @task = FactoryBot.build(:task)
  end

  describe '新規タスクを作成' do
    context '新規タスクを作成できる時' do
      it '正しい情報が入力された時は作成できる' do
        expect(@task).to be_valid
      end
    end
    context '新規タスクを作成できない時' do
      it 'titleが空の時は作成できない' do
        @task.title = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Title can't be blank")
      end
      it 'Descriptionが空のときは作成できない' do
        @task.description = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Description can't be blank")
      end
    end
  end
end
