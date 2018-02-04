class Route
  attr_reader :stations

  def initialize(start_station, finish_station)
    @stations = [start_station, finish_station]
  end

  def add_station(station, after_index)
    insert_position = after_index + 1
    return if insert_position >= @stations.size
    @stations.insert(insert_position, station)
  end

  def delete_station(station)
    @stations.delete(station) unless @stations[0] == station || @stations[-1] == station
  end
end