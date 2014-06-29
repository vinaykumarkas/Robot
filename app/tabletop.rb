class Table

  attr_accessor :position
  def place(x, y)
    self.position = { x: x, y: y } if are_these_valid_coordinates?(x, y)
  end

  def is_placed?
    self.position != nil
  end

  private

  def are_these_valid_coordinates?(x, y)
    (x >= 0 && x <= 4 && y >= 0 && y <= 4)
  end
end