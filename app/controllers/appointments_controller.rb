class AppointmentsController < ApplicationController
  before_action :set_patient
  before_action :set_doctor, only: [:edit, :update]
  before_action :set_appointment, only: [:edit, :update]

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

   def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

   def appointment_params
     params.require(:appointment).permit(:date, :patient_id, :doctor_id)
   end
end
