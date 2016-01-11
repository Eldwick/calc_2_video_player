require "nokogiri"
require 'open-uri'
require 'json'

doc =  Nokogiri::HTML(open("http://scidiv.bellevuecollege.edu/dh/CC_Videos*/ContempCalcVideoLibrary.html"))

videoHash = {}
current_chapter = false
current_section = false
youtube_domains = ["youtube.com", "https://youtu.be/"]
doc.css('div.WordSection1 *').each do |link|
  if link.name == "span" && link.parent.name == "p"
    if link[:style] == "font-size:12.0pt"
      if (link.text == "Chapter 11")
        break
      end
      current_chapter = link.text
      videoHash[current_chapter] = {}
    elsif link[:style] == "font-size:10.0pt" && link.text.length > 5
      current_section = link.text
      videoHash[current_chapter][current_section] = []
    end
  end
  if link.name == "a" && current_section
    if link[:href].match("youtube.com")
      videoHash[current_chapter][current_section] << {
        title: link.text,
        id: link[:href].gsub("https://www.youtube.com/watch?v=", "")
      }
    elsif link[:href].match("youtu.be")
      videoHash[current_chapter][current_section] << {
        title: link.text,
        id: link[:href].gsub("https://youtu.be/", "")
      }
    end
  end
end

while (videoHash.keys.first != "Chapter 1")
  videoHash.delete(videoHash.keys.first)
end

File.write('video_hash.json', videoHash.to_json)
