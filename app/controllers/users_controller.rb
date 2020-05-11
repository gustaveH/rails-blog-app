class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    def new
        @user = User.new
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
            flash[:notice]= "your account information was successfully updated"
            redirect_to articles_path
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to Big Blogger #{@user.username}, you have successfully signed up."
            redirect_to articles_path
        else
            render "new"
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end