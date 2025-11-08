class ArticlesController < ApplicationController
  # 一覧・詳細以外はログインしてないと入れない
  # マイページもログイン必須にしたいから :mypage も除外しない
  before_action :authenticate_user!, except: [:index, :show]
  # 記事取得
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # 所有者チェック（編集・更新・削除のときだけ）
  before_action :authorize_article!, only: [:edit, :update, :destroy]

  def index
  @articles = Article.order(created_at: :desc)

  if params[:title].present?
    @articles = @articles.where('title LIKE ?', "%#{params[:title]}%")
  end

  @articles = @articles.page(params[:page]).per(10)
end
  end

  # GET /articles/mypage
  def mypage
    # ログインしてる人の記事だけ
    @articles = current_user.articles.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "記事を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "記事を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "記事を削除しました。"
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def authorize_article!
      unless @article.user_id == current_user.id
        redirect_to @article, alert: "この操作を行う権限がありません。"
      end
    end

    def article_params
  params.require(:article).permit(:title, :content, tag_ids: [])
end
end
