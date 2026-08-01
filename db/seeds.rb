#require "nokogiri"
#require "open-uri"
#@doc=Nokogiri::HTML(URI.open("https://lilypond.org/doc/v2.26/Documentation/notation/list-of-colors.fr.html"))
#@x=""
#@doc.css("[alt*='image of music']").each do |x|
#p h=x.parent.parent.css("code")[0].text
#@x+="\n"
#@x+=h
#end
#File.write("touteslescouleurs.hey", @x)
File.read("touteslescouleurs.hey").split("\n").each do |genre_name|
     Color.find_or_create_by!(name: genre_name)
end
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
