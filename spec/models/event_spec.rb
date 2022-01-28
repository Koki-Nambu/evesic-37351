require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'イベント投稿機能' do
    context 'イベント投稿が保存できる時' do
      it '全ての情報が正しく入力されている場合は保存できる' do
        expect(@event).to be_valid
      end
    end
    context 'イベント投稿が保存できない時' do
      it 'イベント名が空では保存できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end

      it '日付が空では保存できない' do
        @event.date = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Date can't be blank")
      end

      it '開催場所が空では保存できない' do
        @event.place = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Place can't be blank")
      end

      it '入場料が空では保存できない' do
        @event.charge = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Charge Can't be blank")
      end

      it '入場料が全角数字では保存できない' do
        @event.charge = '１０００'
        @event.valid?
        expect(@event.errors.full_messages).to include("Charge is not a number")
      end

      it '入場料が数字以外では保存できない' do
        @event.charge = '壱万円'
        @event.valid?
        expect(@event.errors.full_messages).to include("Charge is not a number")
      end

      it '入場料が100円以下では保存できない' do
        @event.charge = 50
        @event.valid?
        expect(@event.errors.full_messages).to include("Charge must be greater than or equal to 100")
      end

      it '入場料が30,000円以上では保存できない' do
        @event.charge = 50000
        @event.valid?
        expect(@event.errors.full_messages).to include("Charge must be less than or equal to 30000")
      end

      it 'イベント概要が空では保存できない' do
        @event.content = ''
        @event.valid?
        expect(@event.errors.full_messages).to include("Content can't be blank")
      end

      it 'ユーザーが紐付いていなければ保存できない' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("User must exist")
      end
    end
  end
end
