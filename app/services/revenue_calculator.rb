class RevenueCalculator
  attr_accessor :plans

  def initialize(plans)
    @plans = plans
  end

  def total_revenue
    plans.map {|plan| plan.price.to_i }.inject(:+)
  end

end