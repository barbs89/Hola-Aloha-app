class RequestsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_request, only: [:show, :edit, :update, :delete]
  before_action :set_profile
 
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user

        if @request.save
            flash[:notice] = 'Your request has been submitted!'
            redirect_to requests_path
        else
            flash[:alert] = 'Unable to save request! Please resubmit.'
            redirect_back fallback_location: new_request_path
        end
  end

  private
    def request_params
        params.require(:request).permit(:subject, :description, :lang_from, :lang_to, :price, :user_id, :file_data)
    end
    
    def set_profile
			@profile = Profile.find(current_user.id) if current_user.present?
		end
    def set_request
        @request = Request.find(params[:id])
    end
end
