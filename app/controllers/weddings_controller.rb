class WeddingsController < ApplicationController
def index
  @weddings = Wedding.all
end

def show
  @wedding = Wedding.find(params[:id])
end

def new
  @wedding = Wedding.new
end

def create
  wedding_params

  @wedding = Wedding.new(wedding_params)

  if @wedding.save
     redirect_to @wedding
  else
     render 'new'
  end
end

def edit
  @wedding = Wedding.find(params[:id])
end

def update
  @wedding = Wedding.find(params[:id])

  wedding_params

  if @wedding.update_attributes(wedding_params)
    redirect_to @wedding
  else
    render 'edit'
  end
end

def destroy
  @wedding = Wedding.find(params[:id])

  @wedding.destroy

  redirect_to weddings_path
end

private

def wedding_params
  params.require(:wedding).permit(:name, :date, :location)
end

end
