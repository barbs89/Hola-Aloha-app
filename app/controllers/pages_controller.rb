class PagesController < ApplicationController
  def home
  end

  def incomplete_jobs
    @jobs_incomplete = Job.where(completed_at: nil)
  end
end
