class DashboardsController < ApplicationController
  def index
    @plans_count = Plan.count
    @clients = Client.all
    plans = subscription_plans.includes(:plan).map(&:plan)
    @total_revenue = RevenueCalculator.new(plans).total_revenue
  end

  private

  def subscription_plans
    @_subscriptions ||= SubscriptionPlan.all
  end
end