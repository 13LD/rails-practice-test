class ProcesorsController < ApplicationController
  before_action :set_procesor, only: [:show, :edit, :destroy]

  # GET /procesors
  # GET /procesors.json
  def index
    @procesors = Procesor.all
  end

  # GET /procesors/1
  # GET /procesors/1.json
  def show
    str = @procesor.document.url(:original, false)
    f_path = str.slice(0...(str.index('.zip')))
    system("cd #{Rails.root}/public#{f_path} && rails_best_practices -f html .")
    system("open #{Rails.root}/public#{f_path}/rails_best_practices_output.html")
    redirect_to procesors_path
  end

  # GET /procesors/new
  def new
    @procesor = Procesor.new
  end


  # POST /procesors
  # POST /procesors.json
  def create
    @procesor = Procesor.new(procesor_params)

    respond_to do |format|
      if @procesor.save
        system("open #{Rails.root}/public/#{@procesor.document.url(:original, false)}")


        format.html { redirect_to procesors_path, notice: 'Procesor was successfully created.' }
        format.json { render :show, status: :created, location: @procesor }
      else
        format.html { render :new }
        format.json { render json: @procesor.errors, status: :unprocessable_entity }
      end
    end
  end

  def document_download
    @procesor = Procesor.find(params[:id])
    file_path = @procesor.document_file_name
    str = @procesor.document.url(:original, false)
    f_path = str.slice(0...(str.index('.zip')))
    if !file_path.nil?
      send_file "#{Rails.root}/public/system/documents/#{@procesor.id}/original/#{file_path}", :x_sendfile => true
    else
      redirect_to procesors_url
    end
  end


  # DELETE /procesors/1
  # DELETE /procesors/1.json
  def destroy
    @procesor.destroy
    respond_to do |format|
      format.html { redirect_to procesors_url, notice: 'Procesor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procesor
      @procesor = Procesor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procesor_params
      params.require(:procesor).permit(:document)
    end
end
