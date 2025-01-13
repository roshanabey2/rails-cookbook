class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ destroy ]

  # GET /bookmarks/new
  def new
    @category = Category.find(params[:category_id])
    @bookmark =  Bookmark.new()
  end


  # POST /bookmarks or /bookmarks.json
  def create
    @category = Category.find(params[:category_id])
    @bookmark = @category.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to category_path(@category), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def destroy
    if @bookmark.destroy!
      redirect_to category_path(@bookmark.category), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :recipe_id, :category_id)
  end
end
