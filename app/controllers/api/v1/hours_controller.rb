class Api::V1::HoursController < Api::V1::BaseController
  before_action :set_field

  def create
    seconds = hour_params[:start_time] - hour_params[:end_time]
    start_time = hour_params[:start_time]
    end_time = hour_params[:end_time]
    for seconds > 0
      Hour.create(start_time: start_time, end_time: start_time + 3600)
      start_time += 3600
      seconds -= 3600
    end
    render
  end

  private

  def set_field
    @field = Field.find(params[:field_id])
  end

  def hours_params
    params.require(:hour).permit(:start_time, :end_time)
  end
end
