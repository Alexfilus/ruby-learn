class Station
  def initialize( name )
    @name = name
    @trains = []
  end
  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def get_trains_by_type(train_type)
    return @trains.select { |train| train.type.to_s == train_type }
  end

end