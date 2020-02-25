class AppointmentsController < ApplicationController
  before_action :set_patient

  def index
    @appointments = @patient.appointments.all
  end

  def new
    @doctor = Doctor.all
    @appointment = @patient.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)
    if @appointment.save
      redirect_to patient_appointments_path(@patient)
    else
      render :new
    end
  end


  def edit 
    render partial: 'appointments/form'
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path(@patient)
    else
      render :edit
    end
  end


  def destroy
    @patient.appointments.find(params[:id]).destroy
    # @appointment.destroy
    redirect_to patient_appointments_path(@patient)
  end

 private
   def set_patient
     @patient = Patient.find(params[:patient_id]) 
   end

   def appointment_params
     params.require(:appointment).permit(:date)
   end
end
