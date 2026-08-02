class Score < ApplicationRecord
has_many :colornotes
accepts_nested_attributes_for :colornotes, allow_destroy: true
after_create :myfunc1
after_create :myfunc
after_update :myfunc
def myfunc1

[["0", "NATURAL"],
 ["0", "SHARP"],
 ["1", "FLAT"],
 ["2", "NATURAL"],
 ["2", "SHARP"],
 ["3", "FLAT"],
 ["3", "NATURAL"],
 ["4", "SHARP"],
 ["5", "NATURAL"],
 ["5", "FLAT"],
 ["6", "SHARP"],
 ["1", "NATURAL"],
 ["3", "SHARP"],
 ["4", "FLAT"],
 ["5", "SHARP"],
 ["6", "FLAT"]].each do |notedegree, alteration|
Colornote.create(score: self, color: Color.all.sample, degreenote: notedegree, alteration: alteration)
end
end

def myfunc
y=""
self.colornotes.each do |z|
y+="\n    (cons (ly:make-pitch 0 #{z.degreenote} #{z.alteration}) (x11-color '#{z.color.name}))"
end
x="""
#(define color-mapping
   (list
#{y}
))
% Compare pitch and alteration (not octave).
#(define (pitch-equals? p1 p2)
   (and
    (= (ly:pitch-alteration p1) (ly:pitch-alteration p2))
    (= (ly:pitch-notename p1) (ly:pitch-notename p2))))

#(define (pitch-to-color pitch)
   (let ((color (assoc pitch color-mapping pitch-equals?)))
     (if color
         (cdr color))))

#(define (color-notehead grob)
   (pitch-to-color
    (ly:event-property (event-cause grob) 'pitch)))
global = {
  \\key #{key_signature.gsub(" "," \\")}
  \\numericTimeSignature
  \\time #{time_signature}
  \\tempo 4=100
}


\\score {
  \\new Staff \\relative c' {
    \\global
    \\override NoteHead.color = #color-notehead
    #{content}
  }
}
"""
      @score=self
      File.write("./public/uploads/score#{@score.id}.ly","<lilypond staffsize=\"34\">"+x+"</lilypond>")
      y=`(cd #{Rails.root.to_s}/public/uploads && lilypond-book score#{@score.id}.ly -f html --output mapartition#{@score.id})`


end

def mypic
      @score=self
      @doc=Nokogiri::HTML(File.read(Rails.root.to_s+"/public/uploads/mapartition#{@score.id}/score#{@score.id}.html"))
      @pic=@doc.css("img")[0].attributes["src"].value
      @pic
end
end
