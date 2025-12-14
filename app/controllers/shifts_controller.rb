class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[show edit update destroy]

  def index
    @base_date = if params[:month].present?
                    Date.strptime(params[:month], "%Y-%m")
                 else
                    Date.current
                 end
    month_start = @base_date.beginning_of_month
    month_end   = @base_date.end_of_month
    
    @calendar_start = month_start.beginning_of_week(:sunday)
    @calendar_end = @calendar_start + 6.weeks - 1.day

    @shifts_by_date = Shift.where(work_date: @calendar_start..@calendar_end)
                            .group_by(&:work_date)
  end

  def show; end

  def new
    if params[:work_date].present?
      work_date = Date.parse(params[:work_date])

      if Shift::WEEKLY_HOLIDAYS.include?(work_date.wday)
        redirect_to shifts_path(month: work_date.strftime("%Y-%m")),
                    alert: "定休日にはシフト登録できません"
        return
      end

      @shift = Shift.new(work_date: work_date)
    else
      @shift = Shift.new
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

  def edit; end

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
