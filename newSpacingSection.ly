\version "2.22.1"

\paper {
  ragged-right = ##t
}

\layout {
  indent = 3.4\cm
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#t #t #t)
  }
}

prolegomena = {
  \time 3/4
  \key d \minor
}

firstMeasure = {
  <<
    { a'4. a8 }
    \\
    { < f d >2 }
  >>
  | % 2
}
remainingMeasures = {
  <<
    { e'4 e4. e8 }
    \\
    { < bes g d >4 < a g cis, >2 }
  >>
  | % 3
  <<
    { f'4 d4. c8 }
    \\
    { < a f d >4 < f bes, >2 }
  >>
  | % 4
  <<
    { bes4 a g16 f( e f) }
    \\
    { < g g, >4 < f a, > cis }
  >>
}

\new Score {
  \new Staff \with {
    instrumentName = \markup \center-column
    {"partial"}
  }
  \relative c' {
    \prolegomena
    % % % % % % % % % % % % % % % % % % % % %
    \partial 2
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}



\new Score {
  \new Staff \with {
    instrumentName = \markup \center-column
    {
      "partial"
      \line { \smaller "bar number = 2" }
    }
  }
  \relative c' {
    \prolegomena
    % % % % % % % % % % % % % % % % % % % % %
    \partial 2
    \set Score.currentBarNumber = #2
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}

\new Score {
  \new Staff \with {
    instrumentName = \markup \center-column
    {"s4"}
  }

  \relative c' {
    \prolegomena
    % % % % % % % % % % % % % % % % % % % % %
    s4
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}

\new Score {
  \new Staff \with {
    instrumentName = \markup \center-column
    {
      "s4"
      \line { \smaller "spacing tweak" }
    }
  }
  \relative c' {
    \prolegomena
    % % % % % % % % % % % % % % % % % % % % %
    \newSpacingSection
    \override Score.SpacingSpanner.spacing-increment = #6.5
    \override Score.SpacingSpanner.shortest-duration-space = #1
    s4
    \newSpacingSection
    \revert Score.SpacingSpanner.spacing-increment
    \revert Score.SpacingSpanner.shortest-duration-space
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}


\new Score {
  \new Staff \with {
    instrumentName = \markup \center-column
    {
      "∅"
      \line { \smaller "start with 2/4" }
    }
  }
  \relative c' {
    \prolegomena
    % % % % % % % % % % % % % % % % % % % % %
    \set Timing.measureLength = #(ly:make-moment 1/2)
    \firstMeasure
    \unset Timing.measureLength
    \override Staff.TimeSignature #'stencil = ##f
    \time 3/4
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}
