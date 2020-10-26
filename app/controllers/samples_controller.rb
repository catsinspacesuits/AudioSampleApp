class SamplesController < ApplicationController
  before_action :find_sample, only: [:edit, :update, :destroy, :show]

  def index
    @samples = Sample.all
  end

  def show
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    @sample.save
    redirect_to sample_path(@sample)
  end

  def edit
  end

  def update
    if @sample.update(sample_params)
      redirect_to sample_path(@sample)
    else
      render 'edit'
    end
  end

  def destroy
    @sample.destroy
    redirect_to samples_path
  end

  private

  def find_sample
    @sample = Sample.find(params[:id])
  end

  def sample_params
    params.require(:sample).permit(:title, :description, :tag, :category, :file_type)
  end
end




