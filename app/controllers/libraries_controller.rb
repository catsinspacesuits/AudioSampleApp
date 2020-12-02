class LibrariesController < ApplicationController
  before_action :set_library, only: [:show, :edit, :update, :destroy]

  def index
    @libraries = Library.all
  end

  def show
  end

  def new
    @library = Library.new
    authorize @library
  end

  def edit
    authorize @library
  end

  def create
    @library = Library.new(library_params)
    authorize @library

    respond_to do |format|
      if @library.save
        format.html { redirect_to libraries_path, notice: 'Library was successfully created.' }
        format.json { render :index, status: :created, location: @library }
      else
        format.html { render :new }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @library
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to libraries_path, notice: 'Library was successfully updated.' }
        format.json { render :index, status: :ok, location: @library }
      else
        format.html { render :edit }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @library
    @library.destroy
    respond_to do |format|
      format.html { redirect_to libraries_url, notice: 'Library was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_library
      @library = Library.find(params[:id])
    end

    def library_params
      params.require(:library).permit(:name)
    end
end

