module Nameable

  def initials
    names = self.display_name.split(' ')
    names.length > 1 ? (names.first[0].to_s + names.last[0].to_s).upcase : names.first[0].to_s.upcase
  end
end

