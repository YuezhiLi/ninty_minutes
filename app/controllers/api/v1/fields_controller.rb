class Api::V1::FieldsController < Api::V1::BaseController
  def create
    @field = Field.new(user_id: @current_user.id, title: field_params[:title], location: field_params[:location], cover_image: field_params[:cover_image])
    @field.save
    render :show
  end

  def index
    @fields = Field.all
  end

  def show
    @field = Field.find(params[:id])
    @available_hours = @field.hours.select{ |h| h.reservation == nil }
    @available_hours = @available_hours.map { |h| "#{h.start_time.in_time_zone('Beijing')} - #{h.end_time.in_time_zone('Beijing')}" }
    @reservations = @field.reservations.select { |r| r.confirmed == false }
    @reservations = @reservations.map { |r| [r.hours.first.start_time, r.hours.last.end_time, r.users.count]}
  end

  def destroy
    @field = Field.find(params[:id])
    @field.destroy
  end

  def update
    @field = Field.find(params[:id])
    @field.update(field_params)
    render :show
  end

  private

  def field_params
    params.require(:field).permit(:title, :location, :cover_image)
  end
end
