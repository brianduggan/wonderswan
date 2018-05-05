class GamesController < ApplicationController

  def index
    if params[:term]
      @games = Game.where('lower(title) LIKE (?)', "%#{params[:term].downcase}%")
                   .order(:title)
                   .paginate(:page => params[:page], per_page: 10)
    else
      @games = Game.order(:title).paginate(:page => params[:page], per_page: 10)
    end
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    if !game.save
      flash[:error] = user.errors.full_messages
    end
    redirect_to game_path(game.id)
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end

  def search
  end

  def edit

  end

  def update
    game = Game.find(params[:id])
    game.update_attributes(game_params)
    redirect_to game_path(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_year, :genres, :genre_list, :img_url, :back_url, :collections_id, :japanese_title, :romaji, :video_url, :term)
  end

end
