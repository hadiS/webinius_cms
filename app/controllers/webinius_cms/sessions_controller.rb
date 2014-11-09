require_dependency "webinius_cms/application_controller"

module WebiniusCms

	class SessionsController < ApplicationController

		def new
		end

		def create
		  user = User.where(username: params[:username]).first
		  if user && user.authenticate(params[:password])
		    session[:user_id] = user.id
		    redirect_to pages_url, notice: "You are now logged in!"
		  else
		    flash[:error] = "Wrong email or password."
		    render "new"
		  end
		end

		def destroy
		  session[:user_id] = nil
		  redirect_to root_url, notice: "Logout successfull!"
		end

	end


end