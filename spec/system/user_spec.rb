require 'rails_helper'
RSpec.describe 'ユーザーのCRUD機能' type: :system do
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

        click_button 'sign up'

        expect(current_path).to eq books_path
      end
    end
  end
end
