class Time
  def nice_format
    self.strftime("%a, %b #{self.day.ordinalize} at %l:%M%P")
  end
end
