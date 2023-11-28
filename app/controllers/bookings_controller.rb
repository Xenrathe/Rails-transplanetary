class BookingsController < ApplicationController

  def index
    if params[:booking_id].present? && params[:passenger_email].present?
      @booking = Booking.find_by(id: params[:booking_id])
      
      if @booking&.passengers&.pluck(:email)&.include?(params[:passenger_email])
        redirect_to @booking
      else
        puts "Booking not found"
        flash[:alert] = "Booking not found."
      end
    end
  end

  def new
    if params[:flight_id].present?
      @booking = Booking.new(flight_id: params[:flight_id])
      @num_passengers = params[:num_passengers].present? ? params[:num_passengers].to_i : 1
      @num_passengers.times { @booking.passengers.build }
    else
      flash.now[:alert] = "No flight selected."
      head :ok
      return
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      puts("Booking created successfully")
      flash[:notice] = "Booking created successfully."
      redirect_to @booking
    else
      puts("Error creating booking.")
      flash.now[:alert] = "Error creating booking."
      render :new, status: :unprocessable_entity
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
  end

  def add_passenger
    num_passengers = params[:num_passengers].present? ? params[:num_passengers].to_i : 1
    params[:num_passengers] = (num_passengers + 1).to_s
    render :new
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
