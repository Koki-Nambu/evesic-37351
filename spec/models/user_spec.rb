require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての情報が正常な状態で存在すれば保存できる' do
        expect(@user).to be_valid
      end

      it 'urlが空でも保存できる' do
        @user.url = ''
        expect(@user).to be_valid
      end

      it 'genre_idが空でも保存できる' do
        @user.genre_id = "1"
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'artist_nameが空では保存できない' do
        @user.artist_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Artist name can't be blank")
      end

      it '画像が空では保存できない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Image can't be blank")
      end

      it 'emailが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれていなければ保存できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したemailでは保存できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '全角を含むパスワードでは保存できない' do
        @user.password = 'パスワードです'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'password_confirmationが空では保存できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが一致しなければ保存できない' do
        @user.password = '12345k'
        @user.password_confirmation = '12345l'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが6文字以下では保存できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが数字のみでは保存できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英字のみでは保存できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'プロフィールが空では保存できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end
    end
  end
end
