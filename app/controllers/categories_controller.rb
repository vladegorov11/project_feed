class CategoriesController < ApplicationController
 before_action :set_categorie, only: [:destroy, :show, :edit]

 def index
   @categories = Categorie.all
 end

 def show
 end

 def edit
 end

 def new
   @categorie = Categorie.new
 end

 def create
   @categorie = Categorie.new(categorie_params)

   respond_to do |format|
     if @categorie.save
       format.html { redirect_to @categorie, notice: 'Source was successfully created.' }
       format.json { render :show, status: :created, location: @categorie }
     else
       format.html { render :new }
       format.json { render json: @categorie.errors, status: :unprocessable_entity }
     end
   end
 end

 def update
   respond_to do |format|
     if @categorie.update(categorie_params)
       format.html { redirect_to @categorie, notice: 'Source was successfully updated.' }
       format.json { render :show, status: :ok, location: @categorie }
     else
       format.html { render :edit }
       format.json { render json: @categorie.errors, status: :unprocessable_entity }
     end
   end
 end

 def destroy
 @categorie.destroy
   respond_to do |format|
     format.html { redirect_to categories_url, notice: 'Feed was successfully destroyed.' }
     format.json { head :no_content }
   end
 end
 private

   def set_categorie
     @categorie = Categorie.find(params[:id])
   end


   def categorie_params
     params.require(:categorie).permit(:name)
   end
end
