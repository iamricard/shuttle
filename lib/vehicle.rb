class Vehicle
  attr_reader :fee

  MAX_DISTANCES = {
    :bike => 10,
    :mbike => 100,
    :car => 200,
    :van => 500
  }

  EXTRA_FEES = {
    :bike => 1,
    :mbike => 1.2,
    :car => 1.3,
    :van => 1.4
  }

  def initialize(type, distance)
    @type = set_type(type, distance)
    @fee = EXTRA_FEES[@type.to_sym]
  end

  private
  def set_type(type, distance)
    if MAX_DISTANCES[type.to_sym] > distance
      return type
    end

    type = calculate_type(distance)

    unless type.nil?
      type[0]
    else
      raise 'Unquotable'
    end
  end

  def calculate_type(distance)
    MAX_DISTANCES.detect { |k, v| v >= distance }
  end

end

