class ResourcesController < ApplicationController


  def index
      @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user

    if @resource.save
      redirect_to resources_path
    else
      @error = @resource.errors.full_messages
      render :new
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    redirect_to resources_path
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :url)
  end

end




