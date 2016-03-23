class Skill

  attr_accessor :name, :status
  attr_reader :id

  def initialize(info={name: nil, status: "unknown"}, id)
    @name = info[:name]
    @status = info[:status]
    @id = id
  end

end
