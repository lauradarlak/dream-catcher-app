require 'nokogiri'
require 'open-uri'

class Scraper

  def self.theme_content(theme_name)
    theme_letter = theme_name[0].downcase

    themes = Nokogiri::HTML(open("https://www.dreamdictionary.org/#{theme_letter}"))
    themes.css("div.content div.single p").each do |theme|


      if theme.css("strong").text.chomp(':').upcase.include?(theme_name.chomp('s').upcase)
        @theme_interpretation = theme.text.strip

      end
    end

    @theme_interpretation
  end
end
