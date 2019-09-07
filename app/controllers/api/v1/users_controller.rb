module Api
  module V1
    class UsersController < Api::V1::ApiController
      after_action :users_number, only: [:index]

      def index
        if params[:page].present?
          @users = User.order(updated_at: :desc).pagination(params[:page].to_i)
          render json: @users, status: :ok
        else
          @users = User.all.limit(25).order(updated_at: :desc)
          render json: @users, status: :ok
        end
      end

      def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
      end

      def edit
      end

      def update
        @user = User.find(params[:id])
        @user.update_attributes(user_params)
        render json: @user.to_json, status: :ok
      end

      private

      def user_params
        params.permit(:page, :id, :first_name, :last_name, :email)
      end

      def users_number
        { users_amount: User.pluck(:id).count }
      end
    end
  end
end
