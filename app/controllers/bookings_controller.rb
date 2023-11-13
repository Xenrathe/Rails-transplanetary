class BookingsController < ApplicationController

  def new
    if params[:flight_id].present?
      @passenger_num = params[:passenger_num].present? ? params[:passenger_num] : 1
      @booking = Booking.new(flight_id: params[:flight_id])
    else
      flash[:alert] = "No flight selected."
      redirect_to flights_path
    end
  end

  def create
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, 
      passenger_attributes: [:name, :email])
  end
end
