class Api::V1::HoursController < Api::V1::BaseController
  before_action :set_field
  require 'time'

  def create
    start_time = hour_params[:start_time].to_datetime
    seconds = hour_params[:end_time].to_datetime - start_time
    while seconds >= 1.fdiv(24)
      end_time = start_time + 1.fdiv(24)
      Hour.create(field_id: @field.id, start_time: start_time, end_time: end_time.in_time_zone)
      start_time += 1.fdiv(24)
      seconds -= 1.fdiv(24)
    end
    render json: {
      hours: @field.hours
    }
  end

  def destroy
    start_time = params[:start_time].to_datetime - 1.fdiv(3)
    end_time = params[:end_time].to_datetime - 1.fdiv(3)
    hours = Hour.where("start_time >= ? AND end_time <= ?", start_time, end_time)
    hours.each { |h| h.destroy }
  end

  private

  def set_field
    @field = Field.find(params[:field_id])
  end

  def hour_params
    params.require(:hour).permit(:start_time, :end_time)
  end
end
