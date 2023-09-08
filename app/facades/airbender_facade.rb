class AirbenderFacade
  attr_reader :nation

  def initialize(nation)
    @nation = nation
  end

  def nation_characters
    service = AirbenderService.new
    characters = service.get_nation_characters(@nation)
  end
end