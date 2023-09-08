module ApplicationHelper
  def element_nation
  [
    ['Air Nomads', 'air+nomads'],
    ['Earth Kingdom', 'earth+kingdom'],
    ['Fire Nation', 'fire+nation'],
    ['Water Tribes', 'water+tribes'],
  ]
  end

  def format_nation(nation)
    nation.gsub('+', ' ').split.map(&:capitalize).join(' ')
  end
end
