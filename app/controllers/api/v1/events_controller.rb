class Api::V1::EventsController < ApplicationController


  def index
    @serch = Event.where(user_id: params[:user_id])
    puts @serch
    render json: @serch
  end

  def show
    @event =Event.find_by_id(params[:id])
    if @event
      render json: @event
    else
      render json: {error:'Not found'},status:404
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json:@event
    else
      render json:{error: "Unable to create"},status:400
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event
      @event.update(event_params)
      render json: {message:"Event update Success"}, status:200
    else
      render json:{error:"Cannot update"}, status:400
    end
  end

  def destroy
    @event=Event.find(params[:id])
    if@event
      @event.destroy
      render json:{message:"User delete Success"},status: 200
    else
      render json:{error:"Unable to delete"}, status:400
    end
  end


  private
  def event_params
    params.require(:event).permit(:eventName, :stime,:etime,:user_id)
  end


end
