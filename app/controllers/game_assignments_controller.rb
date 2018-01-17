class GameAssignmentsController < ApplicationController

  def new
    @game_assignment = GameAssignment.new
  end

  def create
    game_assignment = GameAssignment.create(game_ass_params)
    # Add Error handling here TODO
    # redirect_to user_collection_path(current_user, params[:collection_id])
    if !game_assignment.save
      flash[:error] = 'Unable to add to List'
      redirect_to :back
    else
      flash[:notice] = 'Added to Collection'
      flash[:game_id] = game_ass_params['game_id'].to_i
      redirect_to :back
    end
  end

  def destroy
    game_assignment = GameAssignment.find_by(collection_id: params[:id], game_id: params[:game_id])
    game_assignment.destroy
    redirect_to user_collection_path(current_user, params[:id])
  end

  private

  def game_ass_params
    params.permit(:collection_id, :game_id)
  end

end
