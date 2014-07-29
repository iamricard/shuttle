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
    @type = detect_type(type, distance)

    raise 'Unquotable' unless @type

    @fee = EXTRA_FEES[@type.to_sym]
  end

  private
  def detect_type(type, distance)
    MAX_DISTANCES[type.to_sym] > distance ? type : calculate_type(distance)
  end

  def calculate_type(distance)
    matching_type = MAX_DISTANCES.detect { |k, v| v >= distance }

    matching_type.nil? ? nil : matching_type[0]
  end

end

