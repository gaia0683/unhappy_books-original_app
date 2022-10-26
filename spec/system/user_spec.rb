require 'rails_helper'
RSpec.describe 'ユーザーのCRUD機能', type: :system do
  describe '新規作成機能' do
    before do
      visit new_user_session_path
    end
    context 'ユーザーを新規作成した場合' do
      it '本の一覧ページに移動していること' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'kimu'
        fill_in 'user_nickname', with: 'kk'
        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'
        fill_in 'user_password_confirmation', with: 'gaia0683'

        click_button 'アカウント登録'

        expect(current_path).to eq books_path
      end
      it 'ログインせずに他のページに移動しようとした時ログインページにリダイレクトさせること' do
        visit books_path

        expect(current_path).to eq new_user_session_path
      end
      it 'ゲストログインした時本の一覧ページに移動していること' do
        visit root_path

        click_link 'ゲストログイン'

        expect(current_path).to eq books_path
      end
    end
  end
  describe 'セッション機能のテスト' do
    before do
      visit new_user_session_path
    end
    context 'ログインに関するテスト' do
      it 'ログインができること' do
        FactoryBot.create(:user)

        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'

        click_button 'ログイン'

        expect(current_path).to eq books_path
      end
      it 'ユーザー情報のページに飛べること' do
        user = FactoryBot.create(:user)

        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'

        click_button 'ログイン'

        click_link 'ユーザー情報'

        expect(current_path).to eq users_show_path
      end
      it 'ログアウトができること' do
        FactoryBot.create(:user)

        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'

        click_button 'ログイン'

        click_link 'ログアウト'

        expect(current_path).to eq root_path
      end
      it 'ユーザーの編集ができること' do
        FactoryBot.create(:user)

        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'

        click_button 'ログイン'

        click_link 'ユーザー情報'

        click_link 'ユーザーの編集'

        fill_in 'user_name', with: '金楓泰'
        fill_in 'user_nickname', with: 'kkk'
        fill_in 'user_email', with: 'bomu@bomu.com'

        click_button '更新'

        click_link 'ユーザー情報'

        expect(page).to have_selector 'p', text: 'kkk'
      end
    end
  end
end
