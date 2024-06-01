class SubscriptionPlan < ApplicationRecord
  belongs_to :client
  belongs_to :plan
  
  validates_uniqueness_of :client_id, scope: :plan_id, message: 'already has a plan selected.'

  enum :status, { draft: 0, active: 1, expired: 2 }, prefix: true, scopes: false 
end
