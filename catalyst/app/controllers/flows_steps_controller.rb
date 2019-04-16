class FlowsStepsController < ApplicationController
  before_action :load_flows_step, only: [:update]

  def update
    @flows_step.update_attributes!(allowed_params)
    flash[:success] = 'Serial order updated...'
    redirect_to request.referrer
  end

  private

  def load_flows_step
    @flows_step = FlowsStep.find(params[:id])
  end

  def allowed_params
    @allowed_params ||= params.require(:flows_step).permit(:serial)
  end
end
