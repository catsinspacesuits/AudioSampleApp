class SamplesController < ApplicationController
  before_action :find_sample, only: [:edit, :update, :destroy, :show]
  # after_action :verify_authorized

  def index
    if params[:query].present?
      @samples = Sample.search_by_title(params[:query]).order('created_at DESC')
    else
      @samples = Sample.all.order('created_at DESC')
    end
  end

  def show
    @related_samples = @sample.find_related_tags
  end

  def new
    @sample = Sample.new
    authorize @sample
  end

  def create
    @sample = Sample.new(sample_params)
    authorize @sample

    respond_to do |format|
      if @sample.save
        format.html { redirect_to samples_path, notice: 'Sample was successfully created.' }
        format.json { render :index, status: :created, location: @sample }
      else
        format.html { render :new }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    authorize @sample
  end

  def update
    authorize @sample
    if @sample.update(sample_params)
      redirect_to sample_path(@sample)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @sample
    @sample.destroy
    redirect_to samples_path
  end

   # assign samples with tag(s) 
  def tagged
    @tag = params[:tag]
    if params[:tag].present?
      @samples = Sample.tagged_with(params[:tag])
    else
      @samples = Sample.all
    end
  end

  def tags_index
    @tags = ActsAsTaggableOn::Tag.all.order('name asc')
  end

  private

  def find_sample
    @sample = Sample.find(params[:id])
  end

  def sample_params
    params.require(:sample).permit(:title, :description, :audio, :file_type, :file_size, :sample_rate, :channels, :tag_list, category_ids: [])
  end
end




