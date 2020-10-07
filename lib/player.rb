class Player
  attr_accessor :name, :token, :move_count
  def initialize(name, token, move_count)
    @name = name
    @token = token
    @move_count = move_count
  end
end
