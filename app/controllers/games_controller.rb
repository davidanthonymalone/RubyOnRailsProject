class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
    
  # GET /games
  # GET /games.json
  def index
       if logged_in? 
    @games = Game.all
           else
           redirect_to new_user_path,  notice: "Please register or login to use the features of this site"
       end
           
  end

  # GET /games/1
  # GET /games/1.json
  def show
      @reviews = Review.where(game_id: @game.id).order("created_at DESC")
      
      if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  # GET /games/new
  def new
   if logged_in? 
    @game = current_user.games.build
       else
     redirect_to root_url, notice: "Please Login before you can add a game"
       
       
  end
  end
  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = current_user.games.build(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :about, :price, :rating, :age_group, :image)
    end
end
