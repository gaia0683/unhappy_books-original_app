require 'rails_helper'
RSpec.describe '楽天APIでの本の検索機能', type: :system do
  describe '本の検索機能' do
    before do
      visit new_user_session_path
    end
    context '本を検索した場合' do
      it '本の検索結果が表示されること' do
        FactoryBot.create(:user)

        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'

        click_button 'ログイン'

        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        expect(page).to have_selector 'p', text: '火車'
      end
      it '本の詳細ページに入れること' do
        FactoryBot.create(:user)

        fill_in 'user_email', with: 'kimu@kimu.com'
        fill_in 'user_password', with: 'gaia0683'

        click_button 'ログイン'

        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        expect(page).to have_selector 'p', text: '火車'
      end
    end
  end
end
