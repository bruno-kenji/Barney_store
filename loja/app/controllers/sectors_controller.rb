class SectorsController < ApplicationController

  def index
  	@sectors = Sector.all
  end

  def show
    set_sector
  end

  def new
    @sector = Sector.new
    @operators = Operator.all
  end

  def edit
    set_sector
    authorize_full_access
  end

  def create
    @sector = Sector.new(sector_params)
    
    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: 'Sector was successfully created.' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_sector
    #Operator.where(id: params[:sector][:operators_id])
    params[:sector][:operator_ids] ||= []
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to @sector, notice: 'Sector was successfully updated.' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if logged_in.sector.id == 7 && logged_in.sector.title == 'Admin'
      set_sector
      @sector.destroy

      respond_to do |format|
        format.html { redirect_to sectors_url, notice: 'Sector was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to admin_index_url, alert: "Only operators who belong in the 'Admin' sector have access to this."
    end
  end

  private
  def set_sector
    @sector = Sector.find(params[:id])
  end

  def sector_params
    params.require(:sector).permit(:id, :title, :operator_ids)
  end

  def sort_column
    Sector.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end