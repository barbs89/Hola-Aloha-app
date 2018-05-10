class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy, :apply, :booking]
  
  # posts/:id/booking
  def booking
    if current_user.stripe_id.blank?
      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken],
      )
      current_user.stripe_id = customer.id
      current_user.save!
    end

    charge = Stripe::Charge.create(
      customer: current_user.stripe_charge_id,
      amount: @job.price,
      description: @job.description,
      currency: "AUD",
    )

    # @post.bookings << current_user
    # curent_user.charges << Charge.new(charge_id: charge.id)
    flash[:notice] = "Payment made!"
    redirect_back fallback_location: jobs_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # GET /jobs
  # GET /jobs.json
  def index
    unless params[:job].present?
    @jobs = Job.all
    else
    language_name = params[:language_from][:search]
    @jobs = Job.search_by_language(language_name)
    end
  end

  def apply
    # @job.jobto << current_user
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.user = current_user
    
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    # @job.user_id = current_user.id
    @job.user = current_user
    
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:language_from_id, :language_to_id, :subject, :description, :price, :completed_at)
    end
end
