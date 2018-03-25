class PresentationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ppt, only: [:show, :edit, :update, :destroy]

  def show
  end
  
  def index
    @p = [{id: 1,title: "Secul",description: "Nothing about People and Culture",deafult: false}]
  end
  # GET /presentations/new
  def new
    @presentation = Presentation.new
  end

  # GET /presentations/1/edit
  def edit
  end

  # POST /presentations
  # POST /presentations.json
  def create
    @ppt = Presentation.new(ppt_params)
    if @ppt.save
      # format.html { redirect_to @ppt, notice: 'Post was successfully created.' }
      # format.json { render :show, status: :created, location: @ppt }
    else
      # format.html { render :new }
      @ppt.errors.full_messages.each do |message|
        flash[:notice] = message
      end
      # format.json { render json: @post.errors, status: :unprocessable_entity }
    end
    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(ppt_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { render :show, status: :ok, location: @presentation }
      else
        format.html { render :edit }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /Presentation/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url, notice: 'Presentation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ppt
      # @presentation = Presentation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ppt_params
      params.require(:presentation).permit(:content, :pallete_id, :startup_id)
    end
end
