class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end
  
  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      flash[:notice] = "Booking updated succesfully!"
      redirect_to booking_path(@booking)
    else
      flash.now[:alert] = "Booking cannot be updated."
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save!
      flash[:notice] = "Booking created succesfully!"
      redirect_to booking_path(@booking)
    else
      flash.now[:alert] = "Booking cannot be created."
      render :new, status: :unprocessable_entity
    end
  end

  private
  def booking_params
    params.require(:booking).permit(
      :flight_id, passengers_attributes: [
        :id, :_destroy, # Destory associated records using accepts_nested_attributes_for
        :first_name, 
        :last_name, 
        :email
      ]
    )
  end
end
