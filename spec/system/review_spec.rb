require 'rails_helper'
RSpec.describe 'レビューの作成機能', type: :system do
  describe 'レビューの作成が成功した時' do
    before do
      FactoryBot.create(:user)
      visit new_user_session_path

      fill_in 'user_email', with: 'kimu@kimu.com'
      fill_in 'user_password', with: 'gaia0683'

      click_button 'ログイン'
    end
    context 'レビューを新規作成する場合', js: true do
      it 'レビューが作成できること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '本の題名を検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        fill_in 'review_title', with: 'aa'
        fill_in 'review_content', with: 'aa'


      end
    end
  end
end
