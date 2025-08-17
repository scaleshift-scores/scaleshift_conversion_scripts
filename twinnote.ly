% TwinNote include for LilyPond — practical implementation
% Docs: https://twinnote.clairnote.org/learn/

% Goals implemented:
% - Chromatic staff mapping (6-6 pattern): staff position per semitone
% - Two line staff (lines a major third apart)
% - Two notehead types by whole-tone set:
%   * even semitone: solid up-triangle
%   * odd semitone: hollow down-triangle
% - Rhythm as in trad. notation; half notes get double stems
% - Simplified TwinNote-style accidentals

% --- Core utilities ---
#(define (tn-pitch-semitone pitch)
   (ly:pitch-semitones pitch))

#(define (tn-notehead-pitch grob)
   (define event (ly:grob-property grob 'cause))
   (if (ly:stream-event? event)
       (ly:event-property event 'pitch)
       (ly:make-pitch 0 0 0)))

#(define (tn-notehead-semitone grob)
   (tn-pitch-semitone (tn-notehead-pitch grob)))

% --- Notehead stencils: triangles ---
% Simple up/down triangles; white = outline, black = filled
#(define tn-tri-up-path
   '(
      moveto 0 0
      lineto -0.9 -0.6
      lineto 0.9 -0.6
      closepath))

#(define tn-tri-down-path
   '(
      moveto 0 -0.6
      lineto -0.9 0
      lineto 0.9 0
      closepath))

#(define (tn-make-triangle-stencil grob up? filled?)
   (let* ((mag (magstep (ly:grob-property grob 'font-size 0)))
          (path (if up? tn-tri-up-path tn-tri-down-path))
          (stil (make-path-stencil path (if filled? 0.0001 0.18) 1 1 filled?)))
     (ly:stencil-scale stil mag mag)))

#(define (tn-notehead-stencil-callback grob)
   (let* ((semi (modulo (tn-notehead-semitone grob) 12))
          (even? (= 0 (modulo semi 2)))
          (up? even?)
          (filled? even?))
     (tn-make-triangle-stencil grob up? filled?)))

% --- Double stems for half notes ---
#(define (tn-grob-edge grob positive)
   (let* ((offset (ly:grob-property grob 'Y-offset))
          (extent (ly:grob-property grob 'Y-extent))
          (edge (if positive (cdr extent) (car extent))))
     (+ offset edge)))

#(define (tn-note-heads-from-stem grob default)
   (let* ((arr (ly:grob-object grob 'note-heads)))
     (if (ly:grob-array? arr) (ly:grob-array->list arr) default)))

#(define (tn-double-stem grob)
   (let* ((base-stem (ly:stem::print grob))
          (dir (ly:grob-property grob 'direction))
          (up-stem (= 1 dir))
          (x-ext (ly:grob-property grob 'X-extent))
          (stem-width (abs (- (car x-ext) (cdr x-ext))))
          (width-scale 1.5)
          (spacing-scale 3.5)
          (stem2-width (* stem-width width-scale))
          (width-shift (/ (abs (- stem-width stem2-width)) 2))
          (spacing-shift (* dir spacing-scale stem-width))
          (left (car x-ext))
          (right (cdr x-ext))
          (stem2-left (+ spacing-shift left (* -1 width-shift)))
          (stem2-right (+ spacing-shift right width-shift))
          (stem2-x (cons stem2-left stem2-right))
          (y-ext (ly:grob-property grob 'Y-extent))
          (heads (tn-note-heads-from-stem grob '()))
          (heads-edge (let loop ((lst heads)
                                 (acc (tn-grob-edge (car heads) up-stem)))
                        (if (null? (cdr lst))
                            acc
                            (let* ((next (cadr lst))
                                   (val (tn-grob-edge next up-stem))
                                   (new-acc (if up-stem (max acc val) (min acc val))))
                              (loop (cdr lst) new-acc)))))
          (tip (if up-stem (cdr y-ext) (car y-ext)))
          (stem2-y (if up-stem (cons heads-edge tip) (cons tip heads-edge)))
          (blot (ly:output-def-lookup (ly:grob-layout grob) 'blot-diameter))
          (stem2 (ly:round-filled-box stem2-x stem2-y blot)))
     (ly:grob-set-property! grob 'stencil (ly:stencil-add base-stem stem2))
     (ly:grob-set-property! grob 'X-extent (ly:stencil-extent (ly:grob-property grob 'stencil) 0))))

#(define (tn-stem-grob-callback grob)
   (let* ((note-heads (tn-note-heads-from-stem grob '())))
     (when (and (pair? note-heads)
                (= 1 (ly:grob-property (car note-heads) 'duration-log)))
       (tn-double-stem grob))))

% --- Simplified TwinNote accidental signs ---
#(define (tn-accidental-stencil-table)
   (let* ((vline (make-path-stencil '(moveto 0 -0.5 lineto 0 0.5) 0.2 1 1 #f))
          (dot (make-circle-stencil 0.24 0.01 #t))
          (acc (lambda (dy) (ly:stencil-add vline (ly:stencil-translate dot `(0 . ,dy)))))
          (sharp (acc 0.5))
          (flat (acc -0.5))
          (dbl (lambda (s) (ly:stencil-add (ly:stencil-translate s '(-0.25 . 0)) (ly:stencil-translate s '(0.25 . 0)))))
          (dblsharp (dbl sharp))
          (dblflat (dbl flat))
          (diag (make-path-stencil '(moveto -0.13 -0.07 lineto 0.13 0.07) 0.33 1 1 #f))
          (sv (make-path-stencil '(moveto 0 -0.3 lineto 0 0.3) 0.2 1 1 #f))
          (natural (ly:stencil-add diag (ly:stencil-translate sv '(0.2 . -0.3)) (ly:stencil-translate sv '(-0.2 . 0.3))))
          (tbl (make-hash-table 7)))
     (hash-set! tbl 1/2 sharp)
     (hash-set! tbl -1/2 flat)
     (hash-set! tbl 1 dblsharp)
     (hash-set! tbl -1 dblflat)
     (hash-set! tbl 0 natural)
     tbl))

#(define tn-accidental-table (tn-accidental-stencil-table))

#(define (tn-accidental-grob-callback grob)
   (let* ((alt (accidental-interface::calc-alteration grob))
          (make (hash-ref tn-accidental-table alt)))
     (if make
         (let* ((mag (magstep (ly:grob-property grob 'font-size 0)))
                (stil (if (procedure? make) make (lambda (g) make))))
           (ly:stencil-scale (stil grob) mag mag))
         (ly:accidental-interface::print grob))))

% --- Layout and context setup ---
\paper {}

\layout {
  \context { \Staff
    % Two-line staff; lines a major third (4 semitones) apart
    \override StaffSymbol.line-count = #2
    \override StaffSymbol.line-positions = #'(-2 2)
    % Chromatic mapping: one staff-position per semitone
    staffLineLayoutFunction = #tn-pitch-semitone
    % Hide key signatures; use explicit accidentals instead
    \remove "Key_engraver"
    \accidentalStyle dodecaphonic
  }
  \context { \Voice
    % Use custom TwinNote triangles (shape encodes pitch-class set)
    \override NoteHead.stencil = #tn-notehead-stencil-callback
    % Double stems for half notes
    \override Stem.before-line-breaking = #tn-stem-grob-callback
    % TwinNote accidental signs
    \override Accidental.stencil = #tn-accidental-grob-callback
  }
}

% Convenience: apply TwinNote overrides locally
twinnoteOn = {
  \accidentalStyle dodecaphonic
  \override NoteHead.stencil = #tn-notehead-stencil-callback
  \override Stem.before-line-breaking = #tn-stem-grob-callback
  \override Accidental.stencil = #tn-accidental-grob-callback
}
