class Users::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to books_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def guest_admin_sign_in
    user = User.admin_guest
    sign_in user
    redirect_to books_path, notice: 'ゲスト管理者としてログインしました。'
  end
end
