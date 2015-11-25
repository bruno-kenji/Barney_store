class SectorsController < ApplicationController

  def index
  	@sectors = Sector.all
  end

  def show
    set_sector
  end

  def new
    @sector = Sector.new
    @operators = Operator.all.map { |o| o.name }
  end

  def edit
    set_sector
    @operators = Operator.all.map { |o| o.name }
  end

  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to sectors_url, notice: 'Sector was successfully created.' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_sector
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to sectors_url, notice: 'Sector was successfully updated.' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_sector
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: 'Sector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_sector
    @sector = Sector.find(params[:id])
  end

  def sector_params
    params.require(:sector).permit(:title)
  end

  def sort_column
    Sector.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end