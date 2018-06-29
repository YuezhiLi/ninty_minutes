class Api::V1::BookingsController < Api::V1::BaseController
  def create
    if booking_params[:reservation_id].present?
      @reservation = Reservation.find(booking_params[:reservation_id])
      Booking.create(user_id: @current_user.id, reservation_id: @reservation.id)
      @reservation.update(confirmed: true) if @reservation.users.count == 10
    else
      start_time = booking_params[:start_time].to_datetime
      end_time = booking_params[:end_time].to_datetime
      @reservation = Reservation.new(start_time: start_time, end_time: end_time)
      @reservation.save
      Booking.create(user_id: @current_user.id, reservation_id: @reservation.id)
      @hours = Hour.where("start_time >= ? AND end_time <= ?", start_time, end_time)
      @hours.each { |h| Period.create(hour_id: h.id, reservation_id: @reservation.id) }
    end
    render json: {
      start_time: @reservation.start_time,
      end_time: @reservation.end_time,
      reservation_id: @reservation.id,
      people: @reservation.users
    }
  end

  private

  def set_field
    @field = Field.find(params[:field_id])
  end

  def booking_params
    params.require(:booking).permit(:reservation_id, :start_time, :end_time)
  end
end
