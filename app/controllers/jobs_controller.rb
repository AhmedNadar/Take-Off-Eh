class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  respond_to :html

  def index
    if(params.has_key?(:job_type))
      @jobs = Job.where(job_type: params[:job_type]).pending.desc
    else
      @jobs = Job.pending.desc
      respond_with(@jobs)
    end    
  end

  def show
    respond_with(@job)
  end

  def new
    @job = Job.new
    respond_with(@job)
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user

    token           = params[:stripeToken]
    card_brand      = params[:user][:card_brand]
    card_exp_month  = params[:user][:card_exp_month]
    card_exp_year   = params[:user][:card_exp_year]
    card_last4      = params[:user][:card_last4]

    # Create a Customer
    customer = Stripe::Customer.create ({
      source: token,
      email: current_user.email,
      name: current_user.name,
      # phone: @job.company.phone_number
    })

    # Create a charge
    charge = Stripe::Charge.create(
      customer:               customer.id,
      amount:                 29900,
      currency:               'cad',
      description:            @job.title,
      statement_descriptor:   'A 299$ job listing!',
      receipt_email:          @job.user.email
    )

    current_user.stripe_id      = charge.id
    current_user.card_brand     = card_brand
    current_user.card_exp_month = card_exp_month
    current_user.card_exp_year  = card_exp_year
    current_user.card_last4     = card_last4
    current_user.save!

    @job.save
    respond_with(@job)

    rescue Stripe::CardError => e
    flash.alert = e.message
    render action: :new
  end

  def update
    @job.update(job_params)
    respond_with(@job)
  end

  def destroy
    @job.destroy
    respond_with(@job)
  end

  # scope simply loads all the posts that belong to a user
  def my_jobs
    @my_jobs = current_user.jobs
  end

  private
    def set_job
      @job = Job.friendly.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, 
                                  :description, 
                                  :job_type,
                                  :link_to_apply,
                                  :category,
                                  :region,
                                  :company_statement,
                                  :status, 
                                  :remote,
                                  :price,                                   
                                  :published_at, 
                                  :featured_until,
                                  :featured,
                                  :slug,
                                  :company_id,
                                  :user_id
                                )
    end
end