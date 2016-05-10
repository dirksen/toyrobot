class Parse
  def self.tokenise(input)
    cmd, args = input.split(' ', 2)
    return [
      cmd ? cmd.upcase.to_sym : nil,
      args ? args.split(/[, ]/).reject(&:empty?) : nil
    ]
  end
  
  def self.parse(input)
    cmd, args = tokenise(input)
    return [
      %i{PLACE MOVE LEFT RIGHT REPORT}.include?(cmd) ? cmd : nil,
      args
    ]
  end
end