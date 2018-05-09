class PagesController < ApplicationController
  def home
  end

  def incomplete_jobs
    @jobs_incomplete = Job.where(completed_at: nil)
  end

  def contact_email
    user_info = {
      user: current_user,
      name: email_params[:name],
      message: email_params[:message],
    }
    ContactMailer.send_contact_email(user_info).deliver_now
    render :contact
  end

  private

  def email_params
    params.require(:contact).permit(:name, :message)
  end
end
