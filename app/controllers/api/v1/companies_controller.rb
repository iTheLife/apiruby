class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :update, :destroy]

# для выполнения routes с ассоциацией
  def index
    if params[:company_id]
      @companies = Company.find(params[:company_id]).id
    else
      @companies = Company.all
    end
    render json: { companies: @companies }, except: [:id, :created_at, :updated_at]
  end

  def show
    if params[:id]
      @companies = Company.find(params[:id])
    else
      @companies = Company.all
    end
    render json: { companies: @companies }, except: [:id, :created_at, :updated_at]
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company.as_json, status: :created
    else
      render json: {user: @company.errors, status: :no_content}
    end
  end

  def update
    if @job.update(company_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @companies = Company.find(params[:id])
      @companies.destroy();
      render json: {status: :succes, message: "Запись #{params[:id]} успешно удалена"}
  end




  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.permit(:location, :name)
  end
end