class Parse
  def self.tokenise(input)
    cmd, args = input.split(' ', 2)
    if cmd then return cmd.upcase, args else return nil, nil end
  end
  
  def self.parse(input)
    cmd, args = tokenise(input)
    if %w{PLACE MOVE LEFT RIGHT REPORT}.include?(cmd) then return cmd, args else return nil, nil end
  end
end