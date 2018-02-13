require_relative "lib/route"
require_relative "lib/cargo_train"
require_relative "lib/passenger_train"
require_relative "lib/cargo_wagon"
require_relative "lib/pasenger_wagon"
require_relative "lib/station"

@stations = []
@trains = []
@routes = []

def print_menu
  puts '-' * 20
  puts '1. Create Station'
  puts '2. Create Train'
  puts '3. Create Route'
  puts '4. Add Station to the existing Route'
  puts '5. Remove Station from the existing Route'
  puts '6. Assign Route to the Train'
  puts '7. Add Wagon'
  puts '8. Remove Wagon'
  puts '9. Move Train forward'
  puts '10. Move Train backward'
  puts '11. Show Stations list'
  puts '12. Show Trains on the Station '
  puts '0. Exit'
  puts '-' * 20
end

def create_station
  print 'Enter station name: '
  name = gets.chomp

  @stations << Station::new(name)
end

def create_train
  begin
    puts 'Select type of train:'
    puts '1 - Cargo'
    puts '2 - Passenger'
    item = gets.to_i
  end until [1, 2].include?(item)

  print 'Enter train number: '
  train_number = gets.chomp
  case item
    when 1
      @trains << CargoTrain::new(train_number)
    when 2
      @trains << PassengerTrain::new(train_number)
  end
end

def add_route
  if @stations.size < 2 || @stations.uniq.size == 1
    puts "\nThere is #{@stations.size} station exist. You should create station.\n\n"
    print_collection(@stations) if @stations.any?
    return
  end
  print_collection(@stations)
  start_station = select_item(@stations, 'Select start station:')
  end_station = select_item(@stations, 'Select end station:')
  @routes << Route::new(start_station, end_station)
end

def add_station
  if @routes.empty?
    puts 'There is no route. You should create it'
    return
  end
  if @stations.size <= 2
    puts "\nThere is only #{@stations.size} station exist. You should create station.\n\n"
    return
  end
  print_collection(@routes)
  route = select_item(@routes, 'Select route: ')
  print_collection(@stations)
  station = select_item(@stations, 'Select station:')
  route.add_station(station)
end

def remove_station
  if @routes.empty?
    puts 'There is no route. You should create it'
    return
  end
  if @stations.size <= 2
    puts "\nThere is #{@stations.size} station exist. You should create station, before delete it.\n\n"
    return
  end
  print_collection(@routes)
  route = select_item(@routes, 'Select route:')
  print_collection(@stations)
  station = select_item(@stations, 'Select station:')
  route.delete_station(station)
end

def assign_route
  if @routes.empty?
    puts 'There is no route. You should create it'
    return
  end

  if @trains.empty?
    puts 'There is no train. You should create it'
    return
  end
  print_collection(@trains)
  train = select_item(@trains, 'Select train:')
  print_collection(@routes)
  route = select_item(@routes, 'Select route:')

  train.route = route
end

def add_wagon_to_train
  if @trains.empty?
    puts 'There is no train. You should create it'
    return
  end
  print_collection(@trains)
  train = select_item(@trains, 'Select train:')
  if train.type == 'cargo'
    train.hook_wagon(CargoWagon::new)
  else
    train.hook_wagon(PassengerWagon::new)
  end
  print_collection(train.wagons)
end

def remove_wagon_from_train
  if @trains.empty?
    puts 'There is no train. You should create it'
    return
  end
  print_collection(@trains)
  train = select_item(@trains, 'Select train:')
  if train.wagons.empty?
    puts 'There is no wagon in the train. You should create it'
    return
  end
  print_collection(train.wagons)
  wagon = select_item(train.wagons, 'Select wagon:')
  train.unhook_wagon(wagon)
  print_collection(train.wagons)
end

def move_train_forward
  if @routes.empty?
    puts 'There is no route. You should create it'
    return
  end
  if @trains.empty?
    puts 'There is no train. You should create it'
    return

  end
  print_collection(@trains)
  train = select_item(@trains, 'Select train:')

  if train.route.nil?
    puts 'Train does not belong to any route'
    puts
    return
  end

  if train.go_to_next_station
    puts "Train #{train.object_id} was moved"
  else
    puts 'Train stays on the station'
  end
end

def move_train_backward
  if @routes.empty?
    puts 'There is no route. You should create it'
    return
  end
  if @trains.empty?
    puts 'There is no train. You should create it'
    return
  end

  print_collection(@trains)
  train = select_item(@trains, 'Select train:')

  if train.route.nil?
    puts 'Train does not belong to any route'
    puts
    return
  end

  print_collection(@trains)
  train = select_item(@trains, 'Select train:')

  if train.go_to_previous_station
    puts "Train #{train.object_id} was moved"
  else
    puts 'Train stays on the station'
  end
end

def list_all_stations
  if @stations.empty?
    puts "\nThere is no station exist. You should create it.\n\n"
    return
  end
  @stations.each { |item| puts item.name }
end

def show_trains_on_station
  if @stations.empty?
    puts "\nThere is no station exist. You should create station.\n\n"
    return
  end

  print_collection(@stations)
  station = select_item(@stations, 'Select station:')

  if station.trains.empty?
    puts "\nThere is no trains on the station.\n\n"
    return
  end

  print_collection(station.trains)
end

def print_collection(collection)
  collection.each.with_index(1) { |item, index| puts "#{index}. #{item.to_s}" }
  puts
end

def select_item(collection, message)
  puts message
  collection[gets.to_i - 1]
end

loop do
  print_menu
  choice = gets.to_i
  case choice
    when 1
      create_station
    when 2
      create_train
    when 3
      add_route
    when 4
      add_station
    when 5
      remove_station
    when 6
      assign_route
    when 7
      add_wagon_to_train
    when 8
      remove_wagon_from_train
    when 9
      move_train_forward
    when 10
      move_train_backward
    when 11
      list_all_stations
    when 12
      show_trains_on_station
    when 0
      break
  end
end
