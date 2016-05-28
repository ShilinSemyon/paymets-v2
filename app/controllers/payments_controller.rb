class PaymentsController < ApplicationController
  http_basic_authenticate_with name: 'olga', password: 't42ks31'

  def index
    @payments = Payment.debit_behind_year(params[:year_id])
    @sum_debit_behind_year = @payments.sum(:debit)
  end

  def new
    @month = Month.find(params[:month_id])
    @payment = @month.build_payment
  end

  def create
    @month = Month.find(params[:month_id])
    @payment = @month.create_payment(payments_params)
    @month.payment.year = session[:current_year_id]
    if @payment.save
      redirect_to @month
    else
      flash.now[:error] = 'Не могу создать платеж'
      render 'new'
    end
  end

  private
  def payments_params
    params.require(:payment).permit(:payment, :other_payment, :description, :month_id)
  end
end
