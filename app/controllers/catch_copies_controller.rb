class CatchCopiesController < ApplicationController
  before_action :set_catch_copy, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :search]

  # GET /catch_copies
  # GET /catch_copies.json
  def index
    @catch_copies = CatchCopy.includes(:user).order("created_at DESC").page(params[:page]).per(3)
  end

  # GET /catch_copies/1
  # GET /catch_copies/1.json

  def show
    @comment = Comment.new
    @comments = @catch_copy.comments.includes(:user)
  end


  # GET /catch_copies/new
  def new
    @catch_copy = CatchCopy.new
  end

  # GET /catch_copies/1/edit
  def edit
  end

  # POST /catch_copies
  # POST /catch_copies.json
  def create
    @catch_copy = CatchCopy.new(catch_copy_params)
    respond_to do |format|
      if @catch_copy.save
        format.html { render :create, notice: 'Catch copy was successfully created.' }
        format.json { render :create, status: :created, location: @catch_copy }
      else
        format.html { render :new }
        format.json { render json: @catch_copy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catch_copies/1
  # PATCH/PUT /catch_copies/1.json
  def update
    respond_to do |format|
      if @catch_copy.update(catch_copy_params)
        format.html { render :update, notice: 'Catch copy was successfully updated.' }
        format.json { render :update, status: :ok, location: @catch_copy }
      else
        format.html { render :edit }
        format.json { render json: @catch_copy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catch_copies/1
  # DELETE /catch_copies/1.json
  def destroy
    @catch_copy.destroy
    respond_to do |format|
      format.html { render :destroy, notice: 'Catch copy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @catch_copies = CatchCopy.search(params[:keyword])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catch_copy
      @catch_copy = CatchCopy.find(params[:id])
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    # Only allow a list of trusted parameters through.
    def catch_copy_params
      params.require(:catch_copy).permit(:title, :target, :job_category, :image).merge(user_id: current_user.id)
    end
end
