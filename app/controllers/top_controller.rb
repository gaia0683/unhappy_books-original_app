class TopController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if current_user.present?
      redirect_to books_path, notice: 'トップページにアクセスするにはログアウトが必要です'
    end
  end
end
