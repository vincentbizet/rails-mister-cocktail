class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.fin(params[:cocktail_id])
    @dose =Dose.new
  end

  def create
    @dose = dose.new(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose, notice: 'dose was successfully created'}
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new}
        format.json { render json: @dose.errors, status: :unprocessable_entier }
      end
    end
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: "Dose was successfully deleted" }
      format.json { head :no_content }
    end
  end
end
