class NasaController
  def link_to_rover(name)
    MarsRover.new(name)
  end
end
