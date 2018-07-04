class Api::V1::ProfilesController < Api::V1::BaseController
  def show
    @user = @current_user
    reservations = @user.reservations.map { |r| {field: r.field, people: r.users.count, start_time: r.start_time.in_time_zone('Beijing'), end_time: r.end_time.in_time_zone('Beijing'), confirmed: r.confirmed} }
    @confirmed_reservations = reservations.select { |r| r[:confirmed] }
    @unconfirmed_reservations = reservations.select { |r| r[:confirmed] == false }
  end
end
