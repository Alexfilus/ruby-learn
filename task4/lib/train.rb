class Train
  attr_reader :speed
  attr_accessor :wagon
  attr_accessor :route

  def initialize(number)
    @number = number
    @wagons = []
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

  def hook_wagon(wagon)
    @wagons << wagon
  end

  def unhook_wagon
    @wagons.pop
  end

  def route=(route)
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
    return if finish_station?
    current_station.delete_train(self)
    @current_station_index += 1
    current_station.add_train(self)
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