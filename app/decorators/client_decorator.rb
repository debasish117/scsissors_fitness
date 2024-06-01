class ClientDecorator < Draper::Decorator
  include ApplicationHelper
  delegate_all
  MONTHLY = "Monthly"
  QUARTERLY = "3 Months"
  HALY_YEAR = "6 Months"

  def status
    subscription&.status
  end

  def expiry_date
    case subscription.plan.name
    when MONTHLY
      format_date(subscription.created_at + 30.days)
    when QUARTERLY
      format_date(subscription.created_at + 90.days)
    when HALY_YEAR
      format_date(subscription.created_at + 180.days)
    else
      0.days
    end
  end

  private

  def subscription
    @_subscription ||= client.subscription_plans.first
  end
end