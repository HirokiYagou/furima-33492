require 'rails_helper'

RSpec.describe '新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ボタンが表示されている
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      select @user.birthday.year, from: 'user_birthday_1i'
      select @user.birthday.month, from: 'user_birthday_2i'
      select @user.birthday.day, from: 'user_birthday_3i'
      # 会員登録情報がデータベースに登録されている
      expect{
        click_on '会員登録'
      }.to change { User.count }.by(1)
      # トップページへ遷移している
      expect(current_path).to eq root_path
      # ヘッダーにユーザーのニックネームとログアウトボタンが表示されている
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログアウト')
      # ログアウトボタンをクリックするとログアウトできる
      click_on 'ログアウト'
      expect(page).to have_content('ログイン')
    end
  end

  context '新規登録できないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ボタンが表示されている
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: nil
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      select @user.birthday.year, from: 'user_birthday_1i'
      select @user.birthday.month, from: 'user_birthday_2i'
      select @user.birthday.day, from: 'user_birthday_3i'
      # 会員登録情報がデータベースに登録されていない
      expect{
        click_on '会員登録'
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻される
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンが表示されている
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押す
      click_on 'ログイン'
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # ヘッダーにユーザーのニックネームとログアウトボタンが表示されている
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログアウト')
      # ログアウトボタンをクリックするとログアウトできる
      click_on 'ログアウト'
      expect(page).to have_content('ログイン')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンが表示されている
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      # ログインボタンを押す
      click_on 'ログイン'
      # ログインページへ戻されることを確認する
      expect(current_path).to eq "/users/sign_in"
    end
  end
end