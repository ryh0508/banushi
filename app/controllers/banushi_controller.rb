class BanushiController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(10)
    keyword = "サラブレッド"
    if keyword.present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        keyword,
        search_index:  'Books',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
        power: "Not kindle"
      )

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @books = []
      books.items.each do |item|
        book = Book.new( item.get('ItemAttributes/Title2'), item.get('LargeImage/URL'), item.get('DetailPageURL') )
        @books << book
      end
    sleep(1)
    end
  end

  def new
    @post = Post.new
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
