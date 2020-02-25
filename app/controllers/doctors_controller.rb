class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :update, :edit, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to @doctor
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end 

  def update 
    if @doctor.update(doctor_params)
      redirect_to @doctor
      #. same as redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end


  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:last_name)
    end
end
