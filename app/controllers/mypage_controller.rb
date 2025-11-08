class MypageController < ApplicationController
  before_action :authenticate_user!

  def index
    # ▼ 自分の記事だけをベースにする
    @articles = current_user.articles

    # ▼（追加）タイトルで部分一致検索
    if params[:title].present?
      @articles = @articles.where('title LIKE ?', "%#{params[:title]}%")
    end

    # ▼（既存のやつを後ろに回す）並び替え＋ページネーション
    @articles = @articles.order(created_at: :desc).page(params[:page]).per(10)
  end
end


