class FlightsController < ApplicationController

  def index
    @flights = Flight.upcoming.order(takeoff: :asc)
    @spaceport_choices = Spaceport.all.map{ |sp| [ sp.full_name, sp.id ]}

    # Filter: based on departure spaceport
    if params[:departure_spaceport].present? && !params[:departure_spaceport].nil?
      @flights = @flights.where(departure_spaceport_id: params[:departure_spaceport])
    end

    # Filter: based on arrival spaceport
    if params[:arrival_spaceport].present? && !params[:arrival_spaceport].nil?
      @flights = @flights.where(arrival_spaceport_id: params[:arrival_spaceport])
    end

    # Filter: based on month/day and year
    if params[:takeoff_monthday].present? && params[:takeoff_year].present?
      year = params[:takeoff_year]
      if params[:takeoff_monthday] == "Any"
        @flights = @flights.where("EXTRACT(YEAR FROM takeoff) = ?", year)
      else
        month, day = params[:takeoff_monthday].split('/')
        @flights = @flights.where("EXTRACT(MONTH FROM takeoff) = ? AND EXTRACT(DAY FROM takeoff) = ? AND EXTRACT(YEAR FROM takeoff) = ?", month, day, year)
      end
    end

    @monthday_choices = @flights.map { |flt| [ flt.takeoff.strftime("%m/%d")] }.uniq
    @year_choices = @flights.map { |flt| [ flt.takeoff.strftime("%Y"), flt.takeoff.year ] }.uniq
    
    # Link to new booking form
    @booking = Booking.new
    @num_passengers = params[:passenger_num].present? ? params[:passenger_num] : 1
  end
end
