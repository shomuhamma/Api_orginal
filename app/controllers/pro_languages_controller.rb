class ProLanguagesController < ApplicationController
  before_action :set_pro_language, only: %i[ show update destroy ]
  before_action :auth_req, only: %i[ create update destroy ]
  # GET /pro_languages
  def index
    @pro_languages = ProLanguage.all

    render json: @pro_languages
  end

  # GET /pro_languages/1
  def show
    render json: @pro_language
  end

  # POST /pro_languages
  def create
    @pro_language = ProLanguage.new(pro_language_params)

    if @pro_language.save
      render json: @pro_language, status: :created, location: @pro_language
    else
      render json: @pro_language.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pro_languages/1
  def update
    if @pro_language.update(pro_language_params)
      render json: @pro_language
    else
      render json: @pro_language.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pro_languages/1
  def destroy
    @pro_language.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_language
      @pro_language = ProLanguage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pro_language_params
      params.require(:pro_language).permit(:name, :creator)
    end
end
