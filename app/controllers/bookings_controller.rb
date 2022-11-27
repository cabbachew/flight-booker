class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(flight_id: params[:flight_id], passenger_id: params[:passenger_id])
    flash.now[:notice] = "hi"
    render :new, status: :unprocessable_entity
  end
end
