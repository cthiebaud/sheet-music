custom-tuning = \stringTuning <d a d' g' b' e''>

\layout {
  indent = 0.0
  \context {
    \Score
    barNumberVisibility = #all-bar-numbers-visible
    \override BarNumber.break-visibility = #'#(#t #t #t)
  }
}

mynotes = {
  \fixed c' {
    \key d \minor
    \time 3/4
    \bar ""
    s4
    <<
      { a4. a8 }
      \\
      { < f d, >2 }
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
