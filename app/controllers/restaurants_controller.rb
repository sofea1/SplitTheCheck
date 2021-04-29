class RestaurantsController < ApplicationController
#  before_action :set_restaurant, only: %i[ show edit update destroy split nosplit comment]
#  before_action :authenticate_user!, only: %i[ edit new update destroy split nosplit comment]
#before_action :set_restaurant, except: [ :index, :search, :new, :create]
before_action :set_restaurant, except: [ :index, :search, :new]

before_action :authenticate_user!, except: [ :index, :search, :show]


  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all

    if params[:search_by_name] && params[:search_by_name] != ""
      @restaurants = Restaurant.where("name LIKE ?",
        "%#{params[:search_by_name]}%")
      end

      if params[:search_by_city] && params[:search_by_city] != ""
        @restaurants = Restaurant.where("city like ?",
          "%#{params[:search_by_city]}%")
        end

        if params[:search_by_state] && params[:search_by_state] != ""
          @restaurants= Restaurant.where("state like ?",
            "%#{params[:search_by_state]}%")
          end

          if params[:search_by_zip] && params[:search_by_zip] != ""
            @restaurants= Restaurant.where("zip like ?",
              "%#{params[:search_by_zip]}%")
            end

          end

          # GET /restaurants/1 or /restaurants/1.json
          def show
          end

          # GET /restaurants/new
          def new
            @restaurant = Restaurant.new
          end

          # GET /restaurants/1/edit
          def edit
          end

          # POST /restaurants or /restaurants.json
          def create
            @restaurant = Restaurant.new(restaurant_params)

            respond_to do |format|
              if @restaurant.save
                format.html { redirect_to @restaurant, notice: "Restaurant was successfully created." }
                format.json { render :show, status: :created, location: @restaurant }
              else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @restaurant.errors, status: :unprocessable_entity }
              end
            end
          end

          # PATCH/PUT /restaurants/1 or /restaurants/1.json
          def update
            respond_to do |format|
              if @restaurant.update(restaurant_params)
                format.html { redirect_to @restaurant, notice: "Restaurant was successfully updated." }
                format.json { render :show, status: :ok, location: @restaurant }
              else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @restaurant.errors, status: :unprocessable_entity }
              end
            end
          end

          # DELETE /restaurants/1 or /restaurants/1.json
          def destroy
            @restaurant.destroy
            respond_to do |format|
              format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
              format.json { head :no_content }
            end
          end

          def split
            @user = current_user
            @vote = VoteHistory.new(:user => @user, :restaurant => @restaurant, :votetype => 1)
            @vote.save
            @restaurant.save
            render :show

          end


          def nosplit
            @user = current_user
            @vote = VoteHistory.new(:user => @user, :restaurant => @restaurant, :votetype => -1)
            @vote.save
            @restaurant.save
            render :show

          end

          def new_comment
              @comment = Comment.new

           end

          def add_comment
              @restaurant.add_comment(current_user.id, comment_params[:comment])
              respond_to do |format|
                format.html { redirect_to restaurants_url, notice: "Comment was successfully created." }
                format.json { head :no_content }
              end
          end

       	 def add_favorite
      	     @restaurant.add_favorite(current_user.id)
             respond_to do |format|
               format.html { redirect_to @restaurant, notice: "Restaurant was successfully added to My Favorites." }
               format.json { head :no_content }
              end
          end

          private
          # Use callbacks to share common setup or constraints between actions.
          def set_restaurant
            @restaurant = Restaurant.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def restaurant_params
            params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :search_by_name, :search_by_city, :search_by_state, :search_by_zip, :split, :nosplit)
            #params.permit(:name, :address, :city, :state, :zip, :search_by_name, :search_by_city, :search_by_state, :search_by_zip, :split, :nosplit)

          end

          # Only allow a list of trusted parameters through.
          def comment_params
            params.require(:comment).permit(:comment)
          end

        end
