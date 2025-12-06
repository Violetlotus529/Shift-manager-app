class ShiftsController < ApplicationController
  def index
    @shifts = Shift.order(work_date: :asc)
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to @shift, notice: 'Shift was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to @shift, notice: 'Shift was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to shifts_path, notice: 'Shift was successfully deleted.'
  end

  private

  def shift_params
    params.require(:shift).permit(:work_date, :start_time, :end_time, :memo)
  end
end
