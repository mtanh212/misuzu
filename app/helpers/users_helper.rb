module UsersHelper
  def check_shozai
    temp = Temp.find_by(date: Date.today.to_s(:db), checked: true)
    if temp.nil?
      Temp.find(1).update(date: Date.today.to_s(:db), checked: true)
      Shainmaster.update_all 所在コード: 0
    end
  end

  def check_kintai
    kintai = Kintai.find_by 日付: Date.today, 社員番号: session[:user]
    return if kintai
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    MonthRange.new(start_date..end_date).each {|day| create_kintai(day)}
  end

  def create_kintai(day)
    Kintai.create!(日付: day, 曜日: day.wday, 社員番号: session[:user])
  end

  class MonthRange
    include Enumerable

    def initialize(range)
      @start_date = range.first
      @end_date = range.last
      # @start_date = Date.parse(@start_date)
      # @end_date = Date.parse(@end_date)
    end

    def each
      current_day = @start_date
      while current_day <= @end_date do
        yield current_day
        current_day += 1
      end
    end
  end
end
