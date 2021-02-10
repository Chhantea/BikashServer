class Api::V1::UsersController < ApplicationController
  # get user
  def index
    @user =User.all
    render json: @user
  end
  #get user/:id
  def show
    @user =User.find_by_id(params[:id])
    if @user
      render json: @user
    else
      render json: {error:'Not found'},status:404
    end
  end
  # post users
  def create
    @user = User.new(user_params)
    if @user.save
      render json:@user
    else
      render json:{error: "Unable to create"},status:400
    end
  end

  # Put /users/:id
  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: {message:"User update Success"}, status:200
    else
      render json:{error:"Cannot update"}, status:400
    end
  end

  #delete /users/:id
  def destroy
    @user=User.find(params[:id])
    if@user
      @user.destroy
      render json:{message:"User delete Success"},status: 200
    else
      render json:{error:"Unable to delete"}, status:400
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
