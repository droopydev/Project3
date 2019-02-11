class ParentsController < ApplicationController
  before_action :authenticate_client!

  def index
    @parent = Parent.where(client_id: current_client.id)[0]
    @courses = Course.all
    @carts = Cart.where(parent_id: parent_id)
    @centres = Centre.all
    if @parent.blank?
      redirect_to new_parent_path
    end

  end

  def new
    @parent = Parent.new
  end

  def show
    @parent = set_parent
    if @parent.client_id != current_client.id
      redirect_to error_path
    end
  end

  def edit
    @parent = set_parent
    if @parent.client_id != current_client.id
      redirect_to error_path
    end
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.client_id = current_client.id

    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    respond_to do |format|
      if @parent.update(parent_params)
        format.html { redirect_to @parent, notice: 'Parent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
  end

  private
    def set_parent
      @parent = Parent.find(params[:id])
    end

    def parent_params
      params.require(:parent).permit(:salutation, :name, :contact_no)
    end

    def parent_id
      return Parent.find_by(client_id: current_client.id).id
  end
end
