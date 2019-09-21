module VehiclesHelper
  include ActionView::Helpers::NumberHelper

  def format_efficiency(efficiency)
    if efficiency
      "#{number_with_precision efficiency, precision: 4} gallons/mi"
    end
  end
end
