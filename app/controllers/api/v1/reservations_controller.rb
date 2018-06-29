class Api::V1::ReservationsController < Api::V1::BaseController
  def index
    @reservations = Reservation.where(confirmed: false)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end
end
