\version "2.22.1"

\paper {
  ragged-right = ##t
}

\layout {
  indent = 0.0
  \context {
    \Score
    \override BarNumber.break-visibility = ##(#t #t #t)
  }
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
  \relative c' {
    \time 3/4
    \key d \minor

    \mark "\partial"
    % % % % % % % % % % % % % % % % % % % % %
    \partial 2
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}

\new Score {
  \relative c' {
    \time 3/4
    \key d \minor

    \mark "\partial with current bar number = 2"
    % % % % % % % % % % % % % % % % % % % % %
    \partial 2
    \set Score.currentBarNumber = #2
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}

\new Score {

  \relative c' {
    \break
    \time 3/4
    \key d \minor

    \mark "s4"
    % % % % % % % % % % % % % % % % % % % % %
    s4
    \firstMeasure
    \remainingMeasures
    % % % % % % % % % % % % % % % % % % % % %
  }
}

\new Score {
  \relative c' {
    \time 3/4
    \key d \minor

    \mark "s4 with zero length spacing section"
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
  \relative c' {
    \time 3/4
    \key d \minor

    \mark "first measure length = 2/4"
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
