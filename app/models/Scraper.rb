require 'nokogiri'
require 'open-uri'

def self.theme_content(theme_name)
  theme_letter = theme_name[0].downcase
  binding.pry
  theme = Nokogiri::HTML(open("https://www.dreamdictionary.org/#{theme_letter}"))

  if theme.at('p').css("strong").text.strip.upcase == theme_name.upcase

    @theme_interpretation = theme.at('p').text.strip
  end

end
