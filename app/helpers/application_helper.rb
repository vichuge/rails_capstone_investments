module ApplicationHelper
  def take_icon(id)
    Inversion.find(id).groups.map(&:icon)[0].nil? ? 'question' : Inversion.find(id).groups.map(&:icon)[0]
  end
end
