class ProfilesController < ApplicationController

  before_action :authenticate_user!
#   before_action :set_profile, only: [:show, :edit, :update, :destroy, :apply]
  

  def index
    @profiles = Profile.all
  end
  def show
    redirect_to :root unless user_signed_in?
    
    
    @profile = current_user.profile
   
    # user.present? && user == profile.user
    @jobs_incomplete = Job.where(user: current_user, completed_at: nil)
    @jobs_complete = Job.where(user: current_user).where.not(completed_at: nil)
 end

def edit
    @profile = Profile.find_or_initialize_by(user: current_user)
    
    # user.present? && user == profile.user
end
    
def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


def update
    @profile = current_user.profile
    
    # user.present? && user == profile.user

    if @profile.update(profile_params)
        flash[:notice] = 'Profile Updated'
        redirect_to profile_path
    else
        flash[:alert] = 'Could not save profile'
        redirect_back(fallback_location: profile_path)
        # (fallback_location: root_path)
    end
end



private
    def profile_params
        params.require(:profile).permit([
            :first_name, 
            :last_name,
            :date_of_birth,
            :image,
            :house_number,
            :street_name,
            :suburb,
            :state,
            :postcode,
            :country
        ])
    end
    # def set_profile
    #     @profile = Profile.find(params[:id])
    # end
end
