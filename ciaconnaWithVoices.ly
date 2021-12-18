\version "2.22.1"

#(set-default-paper-size "a6" 'landscape)

% original here: https://lilypond.org/doc/v2.21/Documentation/snippets/simultaneous-notes.it.html
vFive = #(context-spec-music (make-voice-props-set 4) 'Voice)

\layout {
  \context {
    \Score
    \omit BarNumber
  }
}

\paper {
  indent = 0.0
}

\fixed c' {
  \time 3/4
  \key d \minor
  | %  1
  \newSpacingSection
  \override Score.SpacingSpanner.spacing-increment = #7
  \override Score.SpacingSpanner.shortest-duration-space = #1
  s4
  \newSpacingSection
  \revert Score.SpacingSpanner.spacing-increment
  \revert Score.SpacingSpanner.shortest-duration-space
  <<
    \new Voice  {
      \voiceOne
      a4. a8 |
      e'4 e'4. e'8 |
      f'4 d'4. c'8 |
      bes4 a g16 [f _( e f )]
    }
    \new Voice {
      \voiceTwo
      d2 |
      d4 cis2 |
      d4 bes,2 |
      g,4 a, cis
    }
    \new Voice {
      \voiceThree
      f2 |
      bes4 a2 |
      a4 s2 |
      g4 f s
    }
    \new Voice {
      \vFive
      s2 |
      g4 g2 |
      f4 f2 |
      s2.
    }
  >>
  | %  2
  <<
    \new Voice  {
      \voiceOne
      g16 [ e _( f d )] a4. a8 |
      e'4 e'4. e'8 |
      f'4 d'4. d'8 |
      bes'4 a'8. g'32 f' g'8. e'16 |
    }
    \new Voice {
      \voiceTwo
      d8 s d2 |
      d4 cis2 |
      d4 bes,2 |
      g,4 a,8. s16 s4 |
    }
    \new Voice {
      \voiceThree
        s4 f2 |
        bes4 a2 |
        a4 s2 |
        d'4 cis'8. s16 s4 |
    }
    \new Voice {
      \vFive
        s2. |
        g4 g2 |
        f4 f2 |
        e4 e8.
    }
  >>
  | %  3
  \break
  <<
    \new Voice  {
      \voiceOne
    }
    \new Voice {
      \voiceTwo
    }
    \new Voice {
      \voiceThree
    }
    \new Voice {
      \vFive
    }
  >>
}
