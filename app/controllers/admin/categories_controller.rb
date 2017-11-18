class Admin::CategoriesController < Admin::AdminController
 before_action :set_category, only: [:destroy, :show, :edit, :update]

 def index
   @categories = Category.all
 end

 def show
   @feeds = Feed.where(source_id: @category.sources.ids)
 end

 def edit
 end

 def new
   @category = Category.new
 end

 def create
   @category = Category.new(category_params)
   respond_to do |format|
     if @category.save
       format.html { redirect_to admin_category_path(@category), success: 'Категория успешно добавлена  ' }
       format.json { render :show, status: :created, location: @category }
     else
       format.html { render :new, danger: 'Категория не добавлена ' }
       format.json { render json: @category.errors, status: :unprocessable_entity }
     end
   end
 end

 def update
   respond_to do |format|
     if @category.update(category_params)
       format.html { redirect_to admin_category_path(@category), success: 'Категория успешно обновлена' }
       format.json { render :show, status: :ok, location: @category }
     else
       format.html { render :edit, danger: 'Категория не обновлена' }
       format.json { render json: @category.errors, status: :unprocessable_entity }
     end
   end
 end

 def destroy
 @category.destroy
   respond_to do |format|
     format.html { redirect_to admin_categories_path, success: 'Категория успешно удалена ' }
     format.json { head :no_content }
   end
 end
 private

   def set_category
     @category = Category.find(params[:id])
   end


   def category_params
     params.require(:category).permit(:name)
   end
end
