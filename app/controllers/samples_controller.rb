class SamplesController < ApplicationController
  before_action :find_sample, only: [:edit, :update, :destroy, :show]

  # assign samples with tag(s) 
  def tagged
    if params[:tag].present?
      @samples = Sample.tagged_with(params[:tag])
      @tag = params[:tag]
    else
      @samples = Sample.all
    end
  end

  def index
    @samples = Sample.all.order('created_at DESC')
  end

  def show
    @related_samples = @sample.find_related_tags
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
    params.require(:sample).permit(:title, :description, :file_type, :tag_list, category_ids: [])
  end
end




