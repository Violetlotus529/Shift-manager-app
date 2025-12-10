class ShiftsController < ApplicationController
  def index
    @base_date =
      if params[:base_date].present?
        Date.parse(params[:month]) rescue Date.current
      else
        Date.current
      end

    @shifts = Shift.all
  end

  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
    if params[:date].present?
      @shift.work_date = Date.parse(params[:date]) rescue nil
    end
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to shifts_path, notice: 'シフトを登録しました。'
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
      redirect_to @shift, notice: 'シフトを更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to shifts_path, notice: 'シフトを削除しました。', status: :see_other
  end

  private

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:work_date, :start_time, :end_time, :memo)
  end
end
