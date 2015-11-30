class OperatorsController < ApplicationController
  def index
    @operators = Operator.all
    @sectors = Sector.all
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
    authorize_full_access
  end

  def create
    @operator = Operator.new(operator_params)

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
    if logged_in.sector.id == 7 && logged_in.sector.title == 'Admin'
      set_operator
      @operator.destroy

      respond_to do |format|
        format.html { redirect_to operators_url, notice: 'Operator was successfully deleted.' }
        format.json { head :no_content }
      end
    else
      redirect_to admin_index_url, alert: "Only operators who belong in the 'Admin' sector have access to this."
    end
  end

  private
  def set_operator
    @operator = Operator.find(params[:id])
  end

  def operator_params
    params.require(:operator).permit(:id, :name, :email, :password, :password_confirmation, :sector_id)
  end

  def sector_params
    params.require(:sector).permit(:id, :title, :operators_id)
  end
end
