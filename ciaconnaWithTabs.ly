\version "2.22.1"

custom-tuning = \stringTuning <d a d' g' b' e''>

\layout {
  indent = 0.0
  \context {
    \Score
    \override BarNumber.break-visibility = #'#(#f #f #f)
    barNumberVisibility = #all-bar-numbers-visible
  }
  \context {
    \TabStaff
    \consists "Fingering_engraver"
    \consists "New_fingering_engraver"
    \override StringNumber.stencil = ##f
    fingeringOrientations = #'(left left left)
    strokeFingerOrientations = #'(right right right)
  }
  \context {
    \Voice
    \remove "Fingering_engraver"
    % took me forever to track this down
    \remove "New_fingering_engraver"
  }
}

LH.1 = \finger\markup {
  \fontsize #-3 "1"
}
LH.2 = \finger\markup {
  \fontsize #-3 "2"
}
LH.3 = \finger\markup {
  \fontsize #-3 "3"
}
LH.4 = \finger\markup {
  \fontsize #-3 "4"
}

RH.1 = \rightHandFinger #1
RH.2 = \rightHandFinger #2
RH.3 = \rightHandFinger #3
RH.4 = \rightHandFinger #4

mynotes = {
  \fixed c' {
    \key d \minor
        \time 3/4
    \bar ""
    s4
    <<
      { <a\LH.1\RH.3 >4. a8 }
      \\
      { < f\LH.2\RH.2 d,\RH.1 >2 }
    >>
    |
    % 2
    <<
      { e'4 e'4. e'8 }
      \\
      { < bes\LH.1 g\LH.4 d\LH.3 >4 < a\4\LH.4 g cis\LH.1 >2 }
    >>
    |
    % 3
    <<
      { f'4\2 d'4.\3 c'8\3 }
      \\
      { < a\4 f\5 d, >4 < f\5 bes,\6  >2 }
    >>
    |
    % 4
    <<
      { bes4\4 a g16 f _\( e f\) }
      \\
      { < g, g\3 >4 < f a, > cis }
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
    \clef moderntab
    \set fingeringOrientations = #'(left left left)
    \mynotes
  }
>>
