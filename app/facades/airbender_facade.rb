class AirbenderFacade
  attr_reader :nation

  def initialize(nation)
    @nation = nation
  end

  def first_25_characters
    json = character_data
    json.first(25).map do |character_data|
      Character.new(character_data)
    end
  end

  def character_count
    character_data.count
  end

  def character_data
    service = AirbenderService.new
    @_characters_data ||= service.get_nation_characters(@nation)
  end
end