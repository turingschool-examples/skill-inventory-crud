class Skill

  attr_accessor :name, :status
  attr_reader :id

  def initialize(data)
    @name = data[:name]
    @status = data[:status]
    @id = data[:id]
  end

end
