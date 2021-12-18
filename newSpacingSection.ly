\version "2.22.1"

\paper {
  ragged-right = ##t
}

\layout {
  indent = 0.0
}

sameStuff = {
  <<
    { a'4. a8 }
    \\
    { < f d >2 }
  >>
  | % 2
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

\relative c' {

  \set Staff.explicitKeySignatureVisibility = #begin-of-line-visible
  \override Staff.KeyCancellation.break-visibility = #all-invisible
  \override Staff.TimeSignature.break-visibility = #end-of-line-invisible

  \time 3/4
  \key d \minor

  \accidentalStyle forget

  | % 1
  \mark "\partial 2"
  \partial 2
  \sameStuff
  \break
  \time 3/4
  | % 1
  \mark "s4"
  s4
  \sameStuff
  \break
  \time 3/4
  | % 1
  \mark "s4 with \\newSpacingSection"
  \newSpacingSection
  \override Score.SpacingSpanner.spacing-increment = #6.5
  \override Score.SpacingSpanner.shortest-duration-space = #1
  s4
  \newSpacingSection
  \revert Score.SpacingSpanner.spacing-increment
  \revert Score.SpacingSpanner.shortest-duration-space
  \sameStuff
}
