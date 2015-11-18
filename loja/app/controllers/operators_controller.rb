class OperatorsController < ApplicationController
  def index
    @operators = Operator.all
  end

  def show
    set_operator
  end

  def new
    @operator = Operator.new
  end

  def edit
    set_operator
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
    set_operator
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

  def operator_params
    params.require(:operator).permit(:name, :email, :password, :password_confirmation)
  end

end
