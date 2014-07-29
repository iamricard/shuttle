class Quote
  attr_reader :from, :to

  def initialize(from, to, vehicle = 'bike')
    x = (to[0] - from[0]) ** 2
    y = (to[1] - from[1]) ** 2

    @distance = Math.sqrt(x + y)
    @vehicle = Vehicle.new(vehicle, @distance)
  end

  def price
    @distance * @vehicle.fee
  end
end

