\version "2.22.1"

#(set-default-paper-size "a6" 'landscape)

% original here: https://lilypond.org/doc/v2.21/Documentation/snippets/simultaneous-notes.it.html
vFive = #(context-spec-music (make-voice-props-set 4) 'Voice)

\layout {
  \context {
    \Score
    % \omit BarNumber
  }
}

\paper {
  indent = 0.0
}

\fixed c' {
  \time 3/4
  \key d \minor

  \accidentalStyle forget

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
      f'8. s16 s2 | 
      e'8 s8 e'8 s4. |
      e'8 r d'8. f'16 e'8. d'16 |
      d'8 r cis' r r r16 a'
    }
    \new Voice {
      \voiceTwo
      s2. |
      d8 s8 cis8 s8 s4 |
      d8 r8 bes,8 r8 r8 r16 g, |
      a,8 r8 r4 r8 r16 a,
    }
    \new Voice {
      \voiceThree
      d'8. s16 s2 |
      bes8 s8 a8 s4. |
      a8 s s2 |
      s2 s8 s16 cis'
    }
    \new Voice {
      \vFive
      d8. e16 f8. g32 a bes8. a16 |
      g8. f16 g8. bes16 a8. g16 |
      f8. e16 f8. a16 g8. f16 |
      e8. d16 e8. g16 f8. e16 
    }
  >>
  | %  4
  \break
  <<
    \new Voice  {
      \voiceOne
      f'8. s16 s2 | 
      e'8 s8 e'8 s4. |
      e'8 r d'8. f'16 e'8. cis'16 |
      d'8. e'16 d'4 (cis'8.) d'16
    }
    \new Voice {
      \voiceTwo
      s2. |
      d8 s8 cis8 s8 s4 |
      d8 r8 bes,8 r8 r8 r16 bes, |
      a,8. g,16 a,2
    }
    \new Voice {
      \voiceThree
      d'8. s16 s2 |
      bes8 s8 a8 s4. |
      a8 s s2 |
      s2.
    }
    \new Voice {
      \vFive
      d8. e16 f8. g32 a bes8. a16 |
      g8. f16 g8. bes16 a8. g16 |
      f8. e16 \override Beam.positions = #'(0.4 . 1.2) f8. a16 \override Beam.positions = #'(0.4 . 0) g8. e16 |
      \override Beam.positions = #'(0.4 . 0.7) f8. g16 e2 
    }
  >>
  | %  5
  \break
  <<
    \new Voice  {
      \voiceOne
      d'8
    }
    \new Voice {
      \voiceTwo
      d8
    }
    \new Voice {
      \voiceThree
      s8
    }
    \new Voice {
      \vFive
      \once \override NoteColumn.force-hshift = 0 d8
    }
  >>

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
