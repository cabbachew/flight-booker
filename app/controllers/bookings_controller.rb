class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end
  
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = "Booking created succesfully!"
      redirect_to root_path
    else
      flash.now[:alert] = "Booking cannot be created."
      render :new, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:first_name, :last_name, :email])
  end
end
