class OperatorsController < ApplicationController
  def index
    @operators = Operator.all
    @sectors = Sector.all
    set_sector
  end

  def show
    set_operator
  end

  def new
    @operator = Operator.new
    @sectors = Sector.all
  end

  def edit
    set_operator
    set_sector
  end

  def create
    @operator = Operator.new(operator_params)
    set_sector
    @sectors = Sector.all
    respond_to do |format|
      if @operator.save
        format.html { redirect_to @operator, notice: 'Operator was successfully created.' }
        format.json { render :index, status: :created, location: @operator }
      else
        format.html { render :new }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_operator
    set_sector
    @sectors = Sector.all
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to @operator, notice: 'Operator was successfully updated.' }
        format.json { render :index, status: :ok, location: @operator }
      else
        format.html { render :edit }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_operator
    set_sector
    @operator.destroy
    respond_to do |format|
      format.html { redirect_to operators_url, notice: 'Operator was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_operator
    @operator = Operator.find(params[:id])
  end

  def set_sector
  end

  def operator_params
    params.require(:operator).permit(:id, :name, :email, :password, :password_confirmation, :sector_id)
  end

  def sector_params
    params.require(:sector).permit(:id, :title, :operator_id)
  end

end
