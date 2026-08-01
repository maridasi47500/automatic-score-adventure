class ColornotesController < ApplicationController
  before_action :set_colornote, only: %i[ show edit update destroy ]

  # GET /colornotes or /colornotes.json
  def index
    @colornotes = Colornote.all
  end

  # GET /colornotes/1 or /colornotes/1.json
  def show
  end

  # GET /colornotes/new
  def new
    @colornote = Colornote.new
  end

  # GET /colornotes/1/edit
  def edit
  end

  # POST /colornotes or /colornotes.json
  def create
    @colornote = Colornote.new(colornote_params)

    respond_to do |format|
      if @colornote.save
        format.html { redirect_to @colornote, notice: "Colornote was successfully created." }
        format.json { render :show, status: :created, location: @colornote }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @colornote.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /colornotes/1 or /colornotes/1.json
  def update
    respond_to do |format|
      if @colornote.update(colornote_params)
        format.html { redirect_to @colornote, notice: "Colornote was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @colornote }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @colornote.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /colornotes/1 or /colornotes/1.json
  def destroy
    @colornote.destroy!

    respond_to do |format|
      format.html { redirect_to colornotes_path, notice: "Colornote was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_colornote
      @colornote = Colornote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def colornote_params
      params.require(:colornote).permit(:degreenote, :color_id, :alteration, :score_id)
    end
end
