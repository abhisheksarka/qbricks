class StepsController < ApplicationController
  before_action :load_site_and_flows
  before_action :load_step, only: %i[update edit]
  before_action :format_condition_expression, only: %i[create update]
  before_action :parse_config, only: %i[create update]

  def new
    @step = Step.new
  end

  def index
    caller = if params[:flow_id]
               @flow = @site.flows.find(params[:flow_id])
             else
               @site
             end
    @steps = caller.steps
  end

  def edit
  end

  def update
    # update the step record
    @step.update!(
      allowed_params.except(:condition_expression, :flow_ids).merge(site_id: @site.id)
    )

    # If condition provided, create the condition record
    c = allowed_params[:condition_expression]
    if c.blank?
      @step.condition.try(:destroy)
    elsif @step.condition.present?
      @step.condition.update!(expression: c)
    else
      @step.create_condition!(expression: c)
    end

    # If flow_id provided, create the flow join table record
    f = (params[:flow_ids] || []).map(&:to_i)

    ActiveRecord::Base.transaction do
      FlowsStep.where(step_id: @step.id).each do |fs|
        fs.destroy unless f.include? fs.flow_id
      end
      f.each do |flow_id|
        FlowsStep.find_or_create_by!(step_id: @step.id, flow_id: flow_id)
      end
    end

    flash[:success] = "Step updated"
    redirect_to edit_site_step_path(@site, @step)
  end

  def create
    # create the step record
    @step = Step.find_or_create_by!(
      allowed_params.except(:condition_expression, :flow_ids).merge(site_id: @site.id)
    )

    # If condition provided, create the condition record
    c = allowed_params[:condition_expression]
    @step.create_condition(expression: c) if c.present?

    # If flow_id provided, create the flow join table record
    f = (params[:flow_ids] || []).map(&:to_i)
    f.each do |flow_id|
      FlowsStep.find_or_create_by(step_id: @step.id, flow_id: flow_id, serial: FlowsStep.count + 1)
    end

    flash[:success] = "Step created"
    redirect_to edit_site_step_path(@site, @step)
  end

  private

  def load_site_and_flows
    @site = Site.find(params[:site_id])
    @flows = @site.flows
  end

  def load_step
    @step = Step.find(params[:id])
  end

  def allowed_params
    @allowed_params ||= params.require(:step).permit(:name, :step_type, :config, :condition_expression, :flow_ids, :script)
  end

  def format_condition_expression
    allowed_params[:condition_expression] = Interpolatable.parse(allowed_params[:condition_expression])
  end

  def parse_config
    allowed_params[:config] = JSON.parse(allowed_params[:config])
  end
end
