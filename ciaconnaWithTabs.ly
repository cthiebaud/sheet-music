custom-tuning = \stringTuning <d a d' g' b' e''>

\layout {
  indent = 0.0
  \context {
    \Score
    \override BarNumber.break-visibility = #'#(#t #t #t)
    barNumberVisibility = #all-bar-numbers-visible
  }
  \context {
    \TabStaff
    % \consists "Fingering_engraver"
    \consists "New_fingering_engraver"
    fingeringOrientations = #'(left left left)
  }
  \context {
    \Voice
    % took me forever to track this down
    \remove "Fingering_engraver"
    \remove "New_fingering_engraver"
  }
}

mynotes = {
  \fixed c' {
    \key d \minor
    \time 3/4
    \bar ""
    s4
    <<
      { a4.-1\rightHandFinger #3 a8 }
      \\
      { < f-2\rightHandFinger #2 d,-0\rightHandFinger #1 >2 }
    >>
    |
    % 2
    <<
      { e'4 e'4. e'8 }
      \\
      { < bes g d >4 < a g cis >2 }
    >>
    |
    % 3
    <<
      { f'4 d'4. c'8 }
      \\
      { < a f d, >4 < f bes, >2 }
    >>
    |
    % 4
    <<
      { bes4 a g16 f _\( e f\) }
      \\
      { < g, g >4 < f a, > cis }
    >>
  }
}

<<
  \new Staff {
    \clef treble
    \mynotes
  }
  \new TabStaff {
    \set TabStaff.stringTunings = #custom-tuning
    \mynotes
  }
>>
