class FlowsController < ApplicationController
  before_action :load_flow, only: [:update, :edit, :clone]
  before_action :load_site, except: [:clone]
  before_action :format_condition_expression, only: [:create, :update]

  def index
    @flows = @site.flows
  end

  def new
    @flow = Flow.new(site_id: @site.id)
  end

  def edit
  end

  def create
    @flow = Flow.find_or_create_by!(allowed_params.except(:condition_expression))
    c = allowed_params[:condition_expression]
    @flow.create_condition(expression: c) if c.present?
    flash[:success] = "Flow created"
    render :new
  end

  def clone
    ActiveRecord::Base.transaction do
      @cloned_flow = Flow.create!(@flow.attributes.except('id', 'created_at', 'updated_at'))
      @flow.flows_steps.each do |fs|
        @cloned_flow.flows_steps.create!(
          fs.attributes.except('id', 'created_at', 'updated_at', 'flow_id')
        )
      end
    end
    redirect_to edit_site_flow_path(@flow.site, @cloned_flow)
  end

  def show
  end

  def update
    @flow.update_attributes!(allowed_params.except(:condition_expression))
    c = allowed_params[:condition_expression]
    fc = @flow.condition

    if c.blank?
      @flow.condition.try(:destroy)
    else
      if fc.present?
        fc.update_attributes!(expression: c)
      else
        @flow.create_condition(expression: c)
      end
    end
    flash[:success] = "Flow updated"
    redirect_to edit_site_flow_path(@flow.site, @flow)
  end

  private

  def load_site
    @site = Site.find(params[:site_id])
  end

  def load_flow
    @flow = Flow.find(params[:id])
  end

  def allowed_params
    @allowed_params ||= params.require(:flow).permit(:name, :condition_expression, :site_id)
  end

  def format_condition_expression
    allowed_params[:condition_expression] = Interpolatable.parse(allowed_params[:condition_expression])
  end
end
