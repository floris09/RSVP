class GuestsController < ApplicationController
def index
  @wedding = Wedding.find(params[:wedding_id])
  @guests = @wedding.guests
end

def show
  @guest = Guest.find(params[:wedding_id, :id])
end

def new
  @wedding = Wedding.find(params[:wedding_id])
  @guest = @wedding.guests.new
end

def create
  guest_params
  @wedding = Wedding.find(params[:wedding_id])
  @guest = @wedding.guests.new(guest_params)


  if @guest.save
     redirect_to @guest
  else
     render 'new'
  end
end

def edit
  @guest = Guest.find(params[:id])
end

def update
  @guest = Guest.find(params[:id])

  guest_params

  if @guest.update_attributes(guest_params)
    redirect_to @guest
  else
    render 'edit'
  end
end

def destroy
  @guest = Guest.find(params[:id])

  @guest.destroy

  redirect_to guests_path
end

private

def guest_params
  params.require(:guest).permit(:name, :adults, :children, :food_preference, :attending, :wedding_id)
end

end
