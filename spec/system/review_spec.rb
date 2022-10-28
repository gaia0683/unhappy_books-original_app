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
    context 'レビューを新規作成する場合' do
      it 'レビューが作成できること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        fill_in 'review_title', with: 'aa'
        fill_in 'review_content', with: 'ab'

        click_button '登録する'

        expect(page).to have_selector 'p', text: 'kk'
        expect(page).to have_selector 'h3', text: 'aa'
        expect(page).to have_selector 'p', text: 'ab'
      end
      it '本の詳細ページにレビューが表示されていること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        fill_in 'review_title', with: 'aa'
        fill_in 'review_content', with: 'ab'

        click_button '登録する'

        visit books_path

        book_shows = all('.book_show')

        book_shows[0].click

        expect(page).to have_selector 'p', text: 'kk'
        expect(page).to have_selector 'h3', text: 'aa'
        expect(page).to have_selector 'p', text: 'ab'
      end

      it 'レビューの編集ができること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        fill_in 'review_title', with: 'aa'
        fill_in 'review_content', with: 'ab'

        click_button '登録する'

        click_link 'レビューを編集'

        fill_in 'review_title', with: 'ac'
        fill_in 'review_content', with: 'ad'

        click_button '登録する'

        expect(page).to have_selector 'p', text: 'kk'
        expect(page).to have_selector 'h3', text: 'ac'
        expect(page).to have_selector 'p', text: 'ad'
      end
      it 'ユーザーの書いたレビューが表示されていること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        fill_in 'review_title', with: 'aa'
        fill_in 'review_content', with: 'ab'

        click_button '登録する'

        click_link 'ユーザー情報'

        expect(page).to have_selector 'p', text: '火車'
        expect(page).to have_selector 'p', text: 'kk'
        expect(page).to have_selector 'h3', text: 'aa'
        expect(page).to have_selector 'p', text: 'ab'
      end
      it 'レビュー作成後本一覧ページに本が表示されていること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        fill_in 'review_title', with: 'aa'
        fill_in 'review_content', with: 'ab'

        click_button '登録する'

        visit books_path

        expect(page).to have_selector 'p', text: '火車'
      end
    end
  end
  describe 'レビューの作成が失敗した時' do
    before do
      FactoryBot.create(:user)
      visit new_user_session_path

      fill_in 'user_email', with: 'kimu@kimu.com'
      fill_in 'user_password', with: 'gaia0683'

      click_button 'ログイン'
    end
    context 'レビューを新規作成する場合' do
      it 'レビュー作成ページにリダイレクトしていること' do
        click_link '本を検索'

        fill_in 'keyword', with: '火車'

        click_button '検索'

        book_shows = all('.book_show')

        book_shows[0].click

        click_link 'レビューを作成'

        click_button '登録する'

        expect(page).to have_content 'タイトルを入力してください'
        expect(page).to have_content '内容を入力してください'
      end
    end
  end
end
