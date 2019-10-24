class UsersController < ApplicationController
  def index
  	@users = User.all.order("created_at DESC")
  end

  def new
    # debugger
  	@user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
     # debugger
  	@user = User.new(user_params)
  	@user.save
  	redirect_to root_path
  end

  def create_user
    if params[:id].present?
      u = User.find(params[:id])
      u.update_attributes(name: params[:name],surname: params[:surname],state: params[:state])
    else
      u = User.create(name: params[:name],surname: params[:surname],state: params[:state])
    end
    flash[:notice] = "user created"
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
 	end

 	def update
 		@user = User.find(params[:id])
 		@user.update(user_params)
 		redirect_to root_path
 	end

 	def destroy
 		User.find_by(id: params[:id]).delete
    flash[:alert] = "user deleted"
 		redirect_to root_path
 		
 	end

  private

  def user_params
  	params.require(:user).permit(:name,:surname,:state, {avatar: []})
  end

end
