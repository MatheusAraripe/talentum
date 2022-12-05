class UsersController < ApplicationController
  before_action :set_user, only: %i[follow unfollow show]

  def index
    @users = policy_scope(User)
    @users = User.where.not(id: current_user.id)
    @users = User.where(id: current_user.following)
  end

  def show
    @posts = Post.where(user_id: @user)
    authorize @user
  end

  def follow
    if current_user.follow(@user.id)
      authorize @user
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js
      end
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      authorize @user
      respond_to do |format|
        format.html { redirect_to user_path(@user) }
        format.js { render action: :follow }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
