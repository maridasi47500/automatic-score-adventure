class Score < ApplicationRecord
after_create do

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

after_update do
y=""
self.colornotes.each do |z|
y+="\n    (cons (ly:make-pitch 0 #{z.degreenote} #{z.alteration}) (x11-color '#{z.color.name}))"
end
x="""
#(define color-mapping
   (list
#{y}
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

\score {
  \new Staff \relative c' {
    \override NoteHead.color = #color-notehead
    #{content}
  }
}
"""
end
end
