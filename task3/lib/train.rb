class Train
  attr_reader :speed

  def initialize(number, type, count_of_wagons)
    @number = number
    @type = type
    @count_of_wagons = count_of_wagons
    @speed = 0
  end

  def speed_up(accelerate)
    @speed += accelerate if accelerate > 0
  end

  def stop
    @speed = 0
  end

  def moving?
    @speed != 0
  end

  def hook_wagon
    @count_of_wagons += 1 unless moving?
  end

  def unhook_wagon
    @count_of_wagons -= 1 unless moving? || @count_of_wagons == 0
  end

  def set_route(route)
    @route = route
    @current_station_index = 0
    current_station.add_train(self)
  end

  def current_station
    @route.stations[@current_station_index]
  end

  def start_station?
    @current_station_index == 0
  end

  def finish_station?
    @current_station_index == @route.stations.size - 1
  end

  def go_to_next_station
    unless finish_station?
      current_station.delete_train(self)
      @current_station_index += 1
      current_station.add_train(self)
    end
  end

  def go_to_previous_station
    return if start_station?
    current_station.delete_train(self)
    @current_station_index -= 1
    current_station.add_train(self)
  end

  def next_station
    @route.stations[@current_station_index + 1] unless finish_station?
  end

  def previous_station
    @route.stations[@current_station_index - 1] unless start_station?
  end
end