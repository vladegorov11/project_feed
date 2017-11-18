class Admin::SourcesController < Admin::AdminController
  before_action :set_source, only: [:show, :edit, :update, :destroy]
  
  def index
    @sources = Source.all
  end

  def show
  end

  def new
    @source = Source.new
  end

  def edit
  end

  def create
    @source = Source.new(source_params)

    respond_to do |format|
      if @source.save
        format.html { redirect_to admin_source_path(@source), success: 'Ресурс успешно создан.' }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new, danger: 'Ресурс не созданю '  }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to admin_source_path(@source), success: 'Ресурс успешно обновлен.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit, danger: 'Ресурс не обновлен.' }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @source.destroy
    respond_to do |format|
      format.html { redirect_to admin_sources_path, success: 'Ресурс успешно удален.' }
      format.json { head :no_content }
    end
  end

  private

    def set_source
      @source = Source.find(params[:id])
    end


    def source_params
      params.require(:source).permit(:name, :password, :login, :api_url, :image_url, :description_url, :category_ids => [])
    end
end
