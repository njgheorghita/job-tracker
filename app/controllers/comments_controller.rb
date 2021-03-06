class CommentsController < ApplicationController  
  
  def create
    company = Company.find(params[:company_id])
    job = company.jobs.find(params[:job_id])
    job.comments.create(comment_params)

    redirect_to company_job_path(company.id, job.id)
  end

  def destroy
    company = Company.find(params[:company_id])
    job = company.jobs.find(params[:job_id])
    job.comments.destroy(params[:id])

    redirect_to company_job_path(company.id, job.id)
  end

  def edit 
    company = Company.find(params[:company_id])
    job = company.jobs.find(params[:job_id])
    @edit_comment = [params[:id]]

    redirect_to company_job_path(company.id, job.id, :edit_comment => [params[:id]])
  end

  def update
    company = Company.find(params[:company_id])
    job = company.jobs.find(params[:job_id])
    job.comments.update(params[:id], comment_params)

    redirect_to company_job_path(company.id, job.id)
  end

  private 

  def comment_params
    params.require(:comment).permit(:content)
  end
end
