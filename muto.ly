% MUTO Chromatic 3-Line Notation (LilyPond include)
% References:
% - https://muto-method.com/en/index.html
% - https://muto-method.com/en/score.html
% - https://muto-method.com/assets/pdf/MUTOmethod_en.pdf

\version "2.24.0"

% --- Core: one staff-position per semitone ---
#(define (muto-pitch-semitone pitch)
   (ly:pitch-semitones pitch))

% Notes:
% - Chromatic mapping: visual distance matches real semitone distance.
% - 3-line per octave concept: bottom solid line = Do, dotted middle line = Fi (F#),
%   top solid line = Do (octave). LilyPond does not style individual staff lines
%   differently per-position by default; this implementation renders all lines solid.
%   The chromatic mapping and three-lines-per-octave spacing remain faithful to MUTO.

% --- Default layout ---
\paper {}

\layout {
  \context { \Staff
    % Chromatic mapping: one vertical step per semitone
    staffLineLayoutFunction = #muto-pitch-semitone

    % Show three staff lines per octave across two octaves around middle C.
    % Positions are in semitone units relative to middle C.
    % Lines at -12 (Do), -6 (Fi), 0 (Do), 6 (Fi), 12 (Do).
    \override StaffSymbol.line-positions = #'(-12 -6 0 6 12)

    % No key signatures or traditional accidentals (MUTO uses equal chromatic steps)
    \remove "Key_engraver"
    \override KeySignature.stencil = ##f
    \override KeyCancellation.stencil = ##f

    % Use numeric time signatures
    \numericTimeSignature

    % Optional: hide clef glyph (MUTO does not rely on G/F clefs)
    \override Clef.stencil = ##f
    \override CueClef.stencil = ##f
    \override CueEndClef.stencil = ##f
  }

  \context { \Voice
    % Remove accidental engraver; all pitches are positioned chromatically
    \remove "Accidental_engraver"
    % Belt-and-suspenders: suppress any accidental stencils that do appear
    \override Accidental.stencil = ##f
    \override AccidentalCautionary.stencil = ##f
    \override AccidentalSuggestion.stencil = ##f
    \override AmbitusAccidental.stencil = ##f
    \override TrillPitchAccidental.stencil = ##f
  }
}

% --- Convenience macros ---

% Switch staff extent to 1, 2, or 3 octaves of MUTO lines around middle C.
mutoOneOctave = { \override Staff.StaffSymbol.line-positions = #'(-6 0 6) }
mutoTwoOctaves = { \override Staff.StaffSymbol.line-positions = #'(-12 -6 0 6 12) }
mutoThreeOctaves = { \override Staff.StaffSymbol.line-positions = #'(-18 -12 -6 0 6 12 18) }

% Apply MUTO overrides locally within a scope (e.g., a Voice)
mutoOn = {
  \override Accidental.stencil = ##f
  \override AccidentalCautionary.stencil = ##f
  \override AccidentalSuggestion.stencil = ##f
  \override AmbitusAccidental.stencil = ##f
  \override TrillPitchAccidental.stencil = ##f
}


