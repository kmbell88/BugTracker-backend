class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /bugs
  def index
    @bugs = Bug.all

    render json: @bugs
  end

  # GET /bugs/1
  def show
    render json: @bug
  end

  # POST /bugs
  def create
    @bug = Bug.new(bug_params)
    @bug.user_id = @user.id

    if @bug.save
      render json: @bug, status: :created, location: @bug
    else
      render json: @bug.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bugs/1
  def update
    if @bug.update(bug_params)
      render json: @bug
    else
      render json: @bug.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bugs/1
  def destroy
    @bug.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:issue, :description, :location, :status, :app_id, :user_id)
    end
end
