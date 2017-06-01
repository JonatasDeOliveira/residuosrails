class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # POST /update_weight
  def update_weight
    if register_params[:residue_id] != nil then
      update_date_weight(Residue.find(register_params[:residue_id]))
    end
    if register_params[:laboratory_id] != nil then
      update_date_weight(Laboratory.find(register_params[:laboratory_id]))
    end
    if register_params[:department_id] != nil then
      update_date_weight(Department.find(register_params[:department_id]))
    end
    if register_params[:collection_id] != nil then
      update_date_weight(Collection.find(register_params[:collection_id]))
    end
  end
  
  def update_date_weight(obj)
    reg_old = obj.registers.last
    obj.registers.create(weight: reg_old.weight + register_params[:weight].to_f())
    reg_old.updated_at = obj.registers.last.created_at
    reg_old.save
    reg_old
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:weight, :department_id, :laboratory_id, :residue_id, :collection_id, :report_id)
    end
end
