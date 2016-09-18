class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :check_login, except: [:show]
  # GET /houses
  # GET /houses.json
  def index
    @houses = House.all
    @active_houses = House.active
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
    @house.pictures.build
  end

  # GET /houses/1/edit
  def edit
    @house.pictures.build
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        @house.pictures.build
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      set_user_id
      params.require(:house).permit(:user_id, :neighborhood, :price, :street_1, :street_2, :city, :state, :zip, :active, :season, :gender, :smoking, :drinking, :pets_allowed, :furnished, :bath, :type, :laundry, :utilities_included, :description, :parking, :num_of_bedrooms, :num_of_bathrooms, :private_room, :private_bath, pictures_attributes: [:id, :house_id, :picture])
    end

    def set_user_id
      params[:house][:user_id] = current_user.id
    end
end
