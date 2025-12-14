class Shift < ApplicationRecord
  WEEKLY_HOLIDAYS = [1].freeze
  validates :start_time, presence: true
  validate :no_overlap
  validate :not_holiday

  private

  def no_overlap
    return if start_time.blank? || end_time.blank?
    overlaps = Shift.where(work_date: work_date)
                    .where.not(id: id)
                    .where("start_time < ? AND end_time > ?", end_time, start_time)
    errors.add(:base, "既存のシフトと時間が重複しています") if overlaps.exists?
  end

  def not_holiday
    return if work_date.blank?

    if WEEKLY_HOLIDAYS.include?(work_date.wday)
      errors.add(:base, "定休日にはシフトを登録できません")
    end
  end
end
