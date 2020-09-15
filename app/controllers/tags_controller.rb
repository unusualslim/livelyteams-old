class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
 
  def show
    @tag = Tag.find(params[:id])
  end
 
  def new
    @tag = Tag.new
  end
 
  def edit
    @tag = Tag.find(params[:id])
  end
 
  def create
    @tag = Tag.new(tag_params)
 
    respond_to do |format|
      if @tag.save
        format.html { redirect_to action: "index" }
      else
        render 'new'
      end
    end
  end
 
  def update
    @tag = Tag.find(params[:id])
 
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to action: "index" }
      else
        render 'edit'
      end
    end
  end
 
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
 
    redirect_to tags_path
  end
 
  private
    def tag_params
      params.require(:tag).permit(:name, :team_id)
    end
end
