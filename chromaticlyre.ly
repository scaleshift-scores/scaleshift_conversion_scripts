
%===============================================================================
%                                                                              %
%  LyreBird                                                                    %
%  ========                                                                    %
%  Chromatic Lyre Notation for LilyPond                                        %
%  lyrebird.ly - version: 23.05.18 (2023 May 18)                               %
%                                                                              %
%  Documentation available at www.delos.cz (work in progress)                  %
%                                                                              %
%===============================================================================



\version "2.24.0"

\header {
  LN-tagline = \markup { \vspace #3 \teeny { Chromatic Lyre Music Notation | www.delos.cz | Music engraving by LilyPond with LyreBird extension | www.lilypond.org}}
}

%===============================================================================
% Custom glyphs for Chromatic Lyre Notation
%===============================================================================

%-------------------------------------------------------------------------------
%
% Help for transferring SVG paths
%
%    Commands for SVG path:
%    M = moveto
%    m = rmoveto
%    L = lineto
%    l = rlineto
%    h (horizontal rlineto) = rlineto x 0
%    v (vertical rlineto) = rlineto 0 y
%    C = curveto
%    c = rcurveto
%    s (shorthand rcurveto) = rcurveto x1=0 y1=0 x2 y2 x y (? not 100% sure)
%    z = closepath
%
%    square =
%    #(ly:stencil-scale
%    (ly:make-stencil
%    `(path .1
%    ( moveto 0 -0.5 rlineto 1 0 rlineto 0 1 rlineto 0 0 rlineto -1 0 closepath)
%    )
%    (cons 0 1)
%    (cons 0 1))
%    1 -1)
%
%    {
%    \override NoteHead.stencil = \square
%    e' f' g' a' b' c'' d'' e''
%    }
%
%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
% LN Note Heads - Stencils
%-------------------------------------------------------------------------------


crotchetWhiteNatural =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0 -0.315
                    rcurveto 0.243 -0.215 0.694 -0.247 1.006 -0.082
                    rcurveto 0.321 0.172 0.386 0.487 0.136 0.708
                    rcurveto -0.251 0.212 -0.695 0.254 -1.013 0.079
                    rcurveto -0.326 -0.16 -0.38 -0.493 -0.129 -0.705
                    closepath
                    rmoveto 0.189 0.212
                    rcurveto -0.028 0.29 0.154 0.505 0.412 0.516
                    rcurveto 0.179 0.011 0.319 -0.161 0.336 -0.301
                    rcurveto 0.039 -0.287 -0.165 -0.523 -0.416 -0.534
                    rcurveto -0.097 0 -0.172 0.043 -0.226 0.097
                    rcurveto -0.045 0.046 -0.088 0.093 -0.106 0.222
                    closepath )
          round round #t)
   (cons -0.10951367 1.2484517)
   (cons -0.502200368095435 0.499649621448038))
  1 -0.95)

% crotchetWhiteNaturalOld =
% #(ly:stencil-scale
%   (ly:make-stencil
%    `(path .001
%        ( rmoveto 0 -0.315
%          rcurveto 0.243 -0.215 0.694 -0.247 1.006 -0.082
%          rcurveto 0.321 0.172 0.386 0.487 0.136 0.708
%          rcurveto -0.251 0.212 -0.695 0.254 -1.013 0.079
%          rcurveto -0.326 -0.16 -0.38 -0.493 -0.129 -0.705
%          closepath
%          rmoveto 0.189 0.212
%          rcurveto -0.028 0.29 0.154 0.505 0.412 0.516
%          rcurveto 0.179 0.011 0.319 -0.161 0.336 -0.301
%          rcurveto 0.039 -0.287 -0.165 -0.523 -0.416 -0.534
%          rcurveto -0.097 0 -0.172 0.043 -0.226 0.097
%          rcurveto -0.045 0.046 -0.088 0.093 -0.106 0.222
%          closepath )
%       round round #t)
%    (cons -0.157799898122233 1.29521859107104)
%    (cons -0.502200368095435 0.499649621448038))
%   1 -0.95)

crotchetBlackNatural =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 0 -0.315
                    rcurveto 0.243 -0.215 0.694 -0.247 1.006 -0.082
                    rcurveto 0.321 0.172 0.386 0.487 0.136 0.708
                    rcurveto -0.251 0.212 -0.695 0.254 -1.013 0.079
                    rcurveto -0.326 -0.16 -0.38 -0.493 -0.129 -0.705
                    closepath)
          round round #t)
   (cons -0.10951367 1.2484517)
   (cons -0.502200368095435 0.499649621448038))
  1 -0.95)

crotchetWhiteSharp =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto -0.083 0.012
                    rcurveto 0.104 -0.311 0.48 -0.565 0.831 -0.576
                    rcurveto 0.365 -0.011 0.58 0.226 0.472 0.544
                    rcurveto -0.107 0.312 -0.476 0.566 -0.837 0.577
                    rcurveto -0.366 0.017 -0.567 -0.24 -0.466 -0.545
                    closepath
                    rmoveto 0.268 -0.104
                    rcurveto -0.021 0.286 0.172 0.501 0.43 0.501
                    rcurveto 0.179 0 0.318 -0.172 0.326 -0.315
                    rcurveto 0.029 -0.283 -0.179 -0.516 -0.433 -0.516
                    rcurveto -0.097 0 -0.175 0.047 -0.222 0.101
                    rcurveto -0.047 0.054 -0.087 0.101 -0.101 0.229
                    closepath )
          round round #t)
   (cons -0.10951367 1.2484517)
   (cons -0.564867769717343 0.558297938332758))
  1 -0.95)

% crotchetWhiteSharpOld =
% #(ly:stencil-scale
%   (ly:make-stencil
%    `(path .001
%        ( rmoveto 0 0.012
%          rcurveto 0.104 -0.311 0.48 -0.565 0.831 -0.576
%          rcurveto 0.365 -0.011 0.58 0.226 0.472 0.544
%          rcurveto -0.107 0.312 -0.476 0.566 -0.837 0.577
%          rcurveto -0.366 0.017 -0.567 -0.24 -0.466 -0.545
%          closepath
%          rmoveto 0.268 -0.104
%          rcurveto -0.021 0.286 0.172 0.501 0.43 0.501
%          rcurveto 0.179 0 0.318 -0.172 0.326 -0.315
%          rcurveto 0.029 -0.283 -0.179 -0.516 -0.433 -0.516
%          rcurveto -0.097 0 -0.175 0.047 -0.222 0.101
%          rcurveto -0.047 0.054 -0.087 0.101 -0.101 0.229
%          closepath )
%       round round #t)
%    (cons -0.026513670526204 1.33145170462841)
%    (cons -0.564867769717343 0.558297938332758))
%   1 -0.95)

crotchetBlackSharp =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto -0.083 0.012
                    rcurveto 0.104 -0.311 0.48 -0.565 0.831 -0.576
                    rcurveto 0.365 -0.011 0.58 0.226 0.472 0.544
                    rcurveto -0.107 0.312 -0.476 0.566 -0.837 0.577
                    rcurveto -0.366 0.017 -0.567 -0.24 -0.466 -0.545
                    closepath)
          round round #t)
   (cons -0.10951367 1.2484517)
   (cons -0.564867769717343 0.558297938332758))
  1 -0.95)

crotchetWhiteFlat =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.195 -0.532
                    rcurveto 0.322 -0.086 0.73 0.079 0.941 0.369
                    rcurveto 0.219 0.294 0.133 0.608 -0.186 0.694
                    rcurveto -0.319 0.086 -0.738 -0.075 -0.949 -0.372
                    rcurveto -0.218 -0.294 -0.121 -0.599 0.194 -0.691
                    closepath
                    rmoveto -0.007 0.444
                    rcurveto -0.021 0.286 0.172 0.501 0.43 0.501
                    rcurveto 0.179 0 0.319 -0.172 0.326 -0.315
                    rcurveto 0.029 -0.283 -0.179 -0.516 -0.433 -0.516
                    rcurveto -0.097 0 -0.175 0.047 -0.222 0.101
                    rcurveto -0.048 0.053 -0.087 0.1 -0.101 0.229
                    closepath )
          round round #t)
   (cons -0.10951367 1.2484517)
   (cons -0.55527788510905 0.554580463853929))
  1 -0.95)

% crotchetWhiteFlatOld =
% #(ly:stencil-scale
%   (ly:make-stencil
%    `(path .001
%        ( rmoveto 0 -0.532
%          rcurveto 0.322 -0.086 0.73 0.079 0.941 0.369
%          rcurveto 0.219 0.294 0.133 0.608 -0.186 0.694
%          rcurveto -0.319 0.086 -0.738 -0.075 -0.949 -0.372
%          rcurveto -0.218 -0.294 -0.121 -0.599 0.194 -0.691
%          closepath
%          rmoveto -0.007 0.444
%          rcurveto -0.021 0.286 0.172 0.501 0.43 0.501
%          rcurveto 0.179 0 0.319 -0.172 0.326 -0.315
%          rcurveto 0.029 -0.283 -0.179 -0.516 -0.433 -0.516
%          rcurveto -0.097 0 -0.175 0.047 -0.222 0.101
%          rcurveto -0.048 0.053 -0.087 0.1 -0.101 0.229
%          closepath )
%       round round #t)
%    (cons -0.312031745277076 1.06300037940609)
%    (cons -0.55527788510905 0.554580463853929))
%   1 -0.95)

crotchetBlackFlat =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 0.195 -0.532
                    rcurveto 0.322 -0.086 0.73 0.079 0.941 0.369
                    rcurveto 0.219 0.294 0.133 0.608 -0.186 0.694
                    rcurveto -0.319 0.086 -0.738 -0.075 -0.949 -0.372
                    rcurveto -0.218 -0.294 -0.121 -0.599 0.194 -0.691
                    closepath)
          round round #t)
   (cons -0.10951367 1.2484517)
   (cons -0.55527788510905 0.554580463853929))
  1 -0.95)

minimWhiteNatural =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.115 -0.375
                    rcurveto 0.354 -0.195 0.838 -0.207 1.201 -0.028
                    rcurveto 0.154 0.075 0.311 0.192 0.323 0.378
                    rcurveto 0.013 0.185 -0.116 0.319 -0.269 0.401
                    rcurveto -0.352 0.198 -0.838 0.202 -1.2 0.028
                    rcurveto -0.156 -0.074 -0.312 -0.192 -0.324 -0.379
                    rcurveto -0.013 -0.184 0.117 -0.318 0.269 -0.4
                    closepath
                    rmoveto 0.238 0.266
                    rcurveto -0.028 0.211 0.061 0.424 0.266 0.508
                    rcurveto 0.21 0.086 0.443 -0.001 0.502 -0.231
                    rcurveto 0.058 -0.224 -0.058 -0.466 -0.271 -0.558
                    rcurveto -0.238 -0.104 -0.445 0.044 -0.497 0.281
                    closepath)
          round round #t)
   (cons -0.1 1.585006190763158)
   (cons -0.530150916725926 0.530258223870647))
  1 -0.95)

% minimWhiteNaturalOld =
% #(ly:stencil-scale
%   (ly:make-stencil
%    `(path .001
%        ( rmoveto 0 -0.375
%          rcurveto 0.354 -0.195 0.838 -0.207 1.201 -0.028
%          rcurveto 0.154 0.075 0.311 0.192 0.323 0.378
%          rcurveto 0.013 0.185 -0.116 0.319 -0.269 0.401
%          rcurveto -0.352 0.198 -0.838 0.202 -1.2 0.028
%          rcurveto -0.156 -0.074 -0.312 -0.192 -0.324 -0.379
%          rcurveto -0.013 -0.184 0.117 -0.318 0.269 -0.4
%          closepath
%          rmoveto 0.238 0.266
%          rcurveto -0.028 0.211 0.061 0.424 0.266 0.508
%          rcurveto 0.21 0.086 0.443 -0.001 0.502 -0.231
%          rcurveto 0.058 -0.224 -0.058 -0.466 -0.271 -0.558
%          rcurveto -0.238 -0.104 -0.445 0.044 -0.497 0.281
%          closepath)
%       round round #t)
%    (cons -0.270398068272782 1.52540425903594)
%    (cons -0.530150916725926 0.530258223870647))
%   1 -0.95)

minimBlackNatural =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.115 -0.375
                    rcurveto 0.354 -0.195 0.838 -0.207 1.201 -0.028
                    rcurveto 0.154 0.075 0.311 0.192 0.323 0.378
                    rcurveto 0.013 0.185 -0.116 0.319 -0.269 0.401
                    rcurveto -0.352 0.198 -0.838 0.202 -1.2 0.028
                    rcurveto -0.156 -0.074 -0.312 -0.192 -0.324 -0.379
                    rcurveto -0.013 -0.184 0.117 -0.318 0.269 -0.4
                    closepath)
          round round #t)
   (cons -0.1 1.585006190763158)
   (cons -0.530150916725926 0.530258223870647))
  1 -0.95)

minimWhiteSharp =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.024 -0.14
                    rcurveto 0.262 -0.293 0.692 -0.467 1.083 -0.44
                    rcurveto 0.166 0.011 0.355 0.057 0.448 0.208
                    rcurveto 0.108 0.176 0.03 0.369 -0.095 0.511
                    rcurveto -0.256 0.3 -0.692 0.467 -1.082 0.44
                    rcurveto -0.167 -0.011 -0.356 -0.055 -0.449 -0.208
                    rcurveto -0.107 -0.175 -0.03 -0.368 0.095 -0.511
                    closepath
                    rmoveto 0.329 0.029
                    rcurveto -0.027 0.212 0.061 0.424 0.266 0.508
                    rcurveto 0.217 0.089 0.461 -0.01 0.508 -0.252
                    rcurveto 0.043 -0.222 -0.071 -0.451 -0.281 -0.54
                    rcurveto -0.238 -0.099 -0.441 0.052 -0.493 0.284
                    closepath)
          round round #t)
   (cons -0.1 1.585006190763158)
   (cons -0.583245518575776 0.582339199268777))
  1 -0.95)

% minimWhiteSharpOld =
% #(ly:stencil-scale
%   (ly:make-stencil
%    `(path .001
%        ( rmoveto 0 -0.14
%          rcurveto 0.262 -0.293 0.692 -0.467 1.083 -0.44
%          rcurveto 0.166 0.011 0.355 0.057 0.448 0.208
%          rcurveto 0.108 0.176 0.03 0.369 -0.095 0.511
%          rcurveto -0.256 0.3 -0.692 0.467 -1.082 0.44
%          rcurveto -0.167 -0.011 -0.356 -0.055 -0.449 -0.208
%          rcurveto -0.107 -0.175 -0.03 -0.368 0.095 -0.511
%          closepath
%          rmoveto 0.329 0.029
%          rcurveto -0.027 0.212 0.061 0.424 0.266 0.508
%          rcurveto 0.217 0.089 0.461 -0.01 0.508 -0.252
%          rcurveto 0.043 -0.222 -0.071 -0.451 -0.281 -0.54
%          rcurveto -0.238 -0.099 -0.441 0.052 -0.493 0.284
%          closepath)
%       round round #t)
%    (cons -0.146205371949679 1.58264980444155)
%    (cons -0.583245518575776 0.582339199268777))
%   1 -0.95)

minimBlackSharp =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.024 -0.14
                    rcurveto 0.262 -0.293 0.692 -0.467 1.083 -0.44
                    rcurveto 0.166 0.011 0.355 0.057 0.448 0.208
                    rcurveto 0.108 0.176 0.03 0.369 -0.095 0.511
                    rcurveto -0.256 0.3 -0.692 0.467 -1.082 0.44
                    rcurveto -0.167 -0.011 -0.356 -0.055 -0.449 -0.208
                    rcurveto -0.107 -0.175 -0.03 -0.368 0.095 -0.511
                    closepath)
          round round #t)
   (cons -0.1 1.585006190763158)
   (cons -0.583245518575776 0.582339199268777))
  1 -0.95)

minimWhiteFlat =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.274 -0.571
                    rcurveto 0.393 -0.062 0.839 0.088 1.123 0.365
                    rcurveto 0.135 0.131 0.259 0.316 0.187 0.51
                    rcurveto -0.062 0.164 -0.222 0.237 -0.385 0.263
                    rcurveto -0.389 0.063 -0.835 -0.092 -1.117 -0.364
                    rcurveto -0.136 -0.132 -0.259 -0.317 -0.187 -0.512
                    rcurveto 0.06 -0.161 0.219 -0.235 0.379 -0.262
                    closepath
                    rmoveto 0.076 0.459
                    rcurveto -0.028 0.212 0.061 0.425 0.266 0.508
                    rcurveto 0.217 0.089 0.461 -0.01 0.508 -0.252
                    rcurveto 0.043 -0.221 -0.071 -0.451 -0.281 -0.539
                    rcurveto -0.239 -0.1 -0.441 0.051 -0.493 0.283
                    closepath)
          round round #t)
   (cons -0.1 1.585006190763158)
   (cons -0.585377242630398 0.581475935101314))
  1 -0.95)

minimBlackFlat =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0.274 -0.571
                    rcurveto 0.393 -0.062 0.839 0.088 1.123 0.365
                    rcurveto 0.135 0.131 0.259 0.316 0.187 0.51
                    rcurveto -0.062 0.164 -0.222 0.237 -0.385 0.263
                    rcurveto -0.389 0.063 -0.835 -0.092 -1.117 -0.364
                    rcurveto -0.136 -0.132 -0.259 -0.317 -0.187 -0.512
                    rcurveto 0.06 -0.161 0.219 -0.235 0.379 -0.262
                    closepath)
          round round #t)
   (cons -0.1 1.585006190763158)
   (cons -0.585377242630398 0.581475935101314))
  1 -0.95)

bracketSemiBreve =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0 0
                    rcurveto 0 0.101 -0.154 0.101 -0.154 0 rlineto 0 -1.246
                    rcurveto 0 -0.101 0.154 -0.101 0.154 0 rlineto 0 1.246
                    closepath
                    rmoveto 1.772 0
                    rcurveto 0 0.101 -0.154 0.101 -0.154 0 rlineto 0 -1.246
                    rcurveto 0 -0.101 0.154 -0.101 0.154 0 rlineto 0 1.246
                    closepath)
          round round #t)
   (cons -0.1245 1.7425)
   (cons -1.32225 0.07625))
  1 -0.9)

semiBreveWhiteNatural =
#(ly:stencil-add
  minimWhiteNatural
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 -0.563)))

semiBreveBlackNatural =
#(ly:stencil-add
  minimBlackNatural
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 -0.563)))

semiBreveWhiteSharp =
#(ly:stencil-add
  minimWhiteSharp
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 -0.563)))

semiBreveBlackSharp =
#(ly:stencil-add
  minimBlackSharp
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 -0.563)))

semiBreveWhiteFlat =
#(ly:stencil-add
  minimWhiteFlat
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 -0.563)))

semiBreveBlackFlat =
#(ly:stencil-add
  minimBlackFlat
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 -0.563)))

bracketBreve =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rmoveto 0 0
                    rcurveto 0 0.101 -0.154 0.101 -0.154 0 rlineto 0 -1.246
                    rcurveto 0 -0.101 0.154 -0.101 0.154 0 rlineto 0 1.246
                    closepath
                    rmoveto 1.772 0
                    rcurveto 0 0.101 -0.154 0.101 -0.154 0 rlineto 0 -1.246
                    rcurveto 0 -0.101 0.154 -0.101 0.154 0 rlineto 0 1.246
                    closepath
                    rmoveto -2.058 0
                    rcurveto 0 0.101 -0.154 0.101 -0.154 0 rlineto 0 -1.246
                    rcurveto 0 -0.101 0.154 -0.101 0.154 0 rlineto 0 1.246
                    closepath
                    rmoveto 2.344 0
                    rcurveto 0 0.101 -0.154 0.101 -0.154 0 rlineto 0 -1.246
                    rcurveto 0 -0.101 0.154 -0.101 0.154 0 rlineto 0 1.246
                    closepath)
          round round #t)
   (cons -0.2545 1.8725)
   (cons -1.32225 0.07625))
  1 -0.9)

breveWhiteNatural =
#(ly:stencil-add
  minimWhiteNatural
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 -0.563)))

breveBlackNatural =
#(ly:stencil-add
  minimBlackNatural
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 -0.563)))

breveWhiteSharp =
#(ly:stencil-add
  minimWhiteSharp
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 -0.563)))

breveBlackSharp =
#(ly:stencil-add
  minimBlackSharp
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 -0.563)))

breveWhiteFlat =
#(ly:stencil-add
  minimWhiteFlat
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 -0.563)))

breveBlackFlat =
#(ly:stencil-add
  minimBlackFlat
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 -0.563)))

%-------------------------------------------------------------------------------
% Qarter Tone Noteheads (experimental)
%-------------------------------------------------------------------------------

crotchetQuarterSharp =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate crotchetBlackSharp (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate crotchetWhiteSharp (cons 0 -0.25)))

crotchetQuarterFlat =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate crotchetBlackFlat (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate crotchetWhiteFlat (cons 0 -0.25)))

minimQuarterSharp =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate minimBlackSharp (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate minimWhiteSharp (cons 0 -0.25)))

minimQuarterFlat =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate minimBlackFlat (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate minimWhiteFlat (cons 0 -0.25)))

semiBreveQuarterSharp =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate semiBreveBlackSharp (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate semiBreveWhiteSharp (cons 0 -0.25)))

semiBreveQuarterFlat =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate semiBreveBlackFlat (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate semiBreveWhiteFlat (cons 0 -0.25)))

breveQuarterSharp =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate breveBlackSharp (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate breveWhiteSharp (cons 0 -0.25)))

breveQuarterFlat =
#(ly:stencil-add
  (stencil-with-color
   (ly:stencil-translate breveBlackFlat (cons 0 -0.25)) (x11-color 'grey60))
  (ly:stencil-translate breveWhiteFlat (cons 0 -0.25)))


%-------------------------------------------------------------------------------
% LN Rests - Stencils
%-------------------------------------------------------------------------------

restLN =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 0 0
                    rlineto 0 0.458
                    rlineto -1.694 0
                    rlineto 0 -0.458
                    rlineto 1.694 0
                    closepath)
          round round #t)
   (cons -1.6945 0.0005)
   (cons -0.0005 0.4585))
  1 -0.95)

restMinim =
#(ly:stencil-add
  (ly:stencil-translate
   restLN
   (cons 1.584 1.034)))

restSemiBreveCon =
#(ly:stencil-add
  restMinim
  (ly:stencil-translate
   bracketSemiBreve
   (cons -0.066 0.256)))
% SemiBreve rest stencil - position not fixed (= TN SemiBreve rest)

restSemiBreve =
#(ly:stencil-add
  (ly:stencil-translate
   restSemiBreveCon
   (cons 0 -1.634)))

restBreve =
#(ly:stencil-add
  restMinim
  (ly:stencil-translate
   bracketBreve
   (cons -0.066 0.256)))
% x = (bracket connection + rest pos)


%-------------------------------------------------------------------------------
% LN Clefs - Stencils
%-------------------------------------------------------------------------------

ClefAltoLN =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 1 -1.8
                    rlineto 0.143 0 rlineto 0 3.619 rlineto -0.143 0 rlineto 0 -3.619
                    closepath
                    rmoveto -0.64 3.619
                    rlineto 0 -3.619 rlineto 0.429 0 rlineto 0 3.619 rlineto -0.429 0
                    closepath
                    rmoveto 1.134 -2.606
                    rcurveto 0.046 0.114 0.043 0.444 0.444 0.433
                    rcurveto 0.347 0 0.336 -0.534 0.336 -0.623
                    rcurveto 0 -0.269 -0.089 -0.752 -0.365 -0.752
                    rcurveto -0.372 0 -0.541 0.233 -0.408 0.204
                    rcurveto 0.247 -0.046 0.326 0.054 0.326 0.244
                    rcurveto 0 0.154 -0.168 0.229 -0.247 0.229
                    rcurveto -0.19 0 -0.297 -0.218 -0.279 -0.347
                    rcurveto 0.057 -0.412 0.544 -0.43 0.791 -0.419
                    rcurveto 0.315 0.018 0.609 0.365 0.609 0.816
                    rcurveto 0 0.418 -0.211 0.831 -0.663 0.831
                    rcurveto -0.226 0 -0.369 -0.14 -0.397 -0.158
                    rcurveto -0.05 0.061 -0.114 0.315 -0.114 0.336
                    rcurveto 0 0 0.064 0.276 0.114 0.336
                    rcurveto 0.029 -0.018 0.172 -0.161 0.397 -0.161
                    rcurveto 0.451 0 0.663 0.419 0.663 0.834
                    rcurveto 0 0.451 -0.294 0.798 -0.609 0.816
                    rcurveto -0.247 0.011 -0.734 -0.015 -0.791 -0.419
                    rcurveto -0.018 -0.125 0.089 -0.351 0.279 -0.351
                    rcurveto 0.079 0 0.247 0.082 0.247 0.232
                    rcurveto 0 0.189 -0.107 0.297 -0.326 0.243
                    rcurveto -0.136 -0.028 0.064 0.204 0.408 0.204
                    rcurveto 0.276 0 0.365 -0.483 0.365 -0.752
                    rcurveto 0 -0.089 0.011 -0.623 -0.336 -0.623
                    rcurveto -0.422 0 -0.369 0.315 -0.458 0.426
                    rcurveto 0.011 -0.226 -0.061 -0.416 -0.128 -0.559
                    rcurveto -0.04 -0.082 -0.086 -0.157 -0.14 -0.229
                    rcurveto 0.054 -0.068 0.104 -0.146 0.146 -0.229
                    rcurveto 0.072 -0.14 0.14 -0.333 0.136 -0.562
                    closepath)
          round round #t)
   (cons -0.1405 2.2015)
   (cons -1.82059193300061 1.83434937999215))
  0.88 -0.88)

ClefTrebleLN =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 2.7 0
                    rcurveto -0.226 0.412 -0.39 0.72 -0.501 0.924
                    rcurveto -0.147 0.269 -0.269 0.487 -0.358 0.662
                    rcurveto -0.09 0.172 -0.204 0.394 -0.348 0.663
                    rcurveto -0.118 0.229 -0.225 0.44 -0.318 0.629
                    rcurveto -0.104 0.215 -0.193 0.462 -0.269 0.745
                    rcurveto 0 0 -0.104 0.516 -0.093 0.698
                    rcurveto 0.015 0.183 0.043 0.325 0.083 0.433
                    rcurveto 0.043 0.111 0.086 0.193 0.125 0.255
                    rcurveto 0.043 0.061 0.107 0.121 0.197 0.189
                    rcurveto 0 0 0.222 0.111 0.397 0.133
                    rcurveto 0.2 0.011 0.308 -0.004 0.469 -0.122
                    rcurveto 0.197 -0.176 0.258 -0.315 0.258 -0.434
                    rcurveto 0 -0.075 -0.003 -0.125 -0.014 -0.153
                    rcurveto -0.007 -0.029 -0.025 -0.068 -0.054 -0.118
                    rcurveto -0.058 -0.097 -0.172 -0.189 -0.287 -0.204
                    rcurveto -0.114 -0.015 -0.197 -0.007 -0.293 0.079
                    rcurveto -0.089 0.085 -0.136 0.218 -0.05 0.493
                    rcurveto -0.226 -0.097 -0.286 -0.297 -0.254 -0.479
                    rcurveto 0.071 -0.261 0.189 -0.347 0.465 -0.426
                    rcurveto 0.083 -0.011 0.129 -0.015 0.136 -0.015
                    rcurveto 0.275 0.004 0.437 0.122 0.537 0.24
                    rcurveto 0.104 0.125 0.154 0.226 0.154 0.451
                    rcurveto -0.032 0.226 -0.101 0.318 -0.187 0.415
                    rcurveto -0.043 0.05 -0.086 0.093 -0.125 0.125
                    rcurveto -0.04 0.036 -0.111 0.086 -0.222 0.147
                    rlineto  -0.132 0.054
                    rcurveto -0.093 0.035 -0.211 0.054 -0.358 0.054
                    rcurveto -0.684 0 -1.311 -0.563 -1.311 -1.239
                    rcurveto -0.025 -0.34 0.083 -0.72 0.322 -1.139
                    rcurveto 0.347 -0.536 0.637 -0.973 0.866 -1.313
                    rcurveto 0.219 -0.344 0.423 -0.648 0.605 -0.909
                    rcurveto 0.118 -0.179 0.214 -0.33 0.29 -0.455
                    rcurveto -0.547 0.301 -0.977 -0.354 -1.135 -0.852
                    rcurveto -0.1 -0.319 -0.143 -0.609 -0.168 -0.82
                    rlineto 0 3.1 rlineto -0.144 0 rlineto 0 -3.619 rlineto 0.144 0
                    rlineto 0 -0.004
                    rcurveto -0.029 0.326 0.25 1.303 0.351 1.475
                    rcurveto 0.057 0.111 0.165 0.247 0.236 0.308
                    rcurveto 0.181 0.151 0.477 0.201 0.986 0.029
                    closepath
                    rmoveto -2.356 1.812
                    rlineto 0 -3.619 rlineto 0.43 0 rlineto 0 3.619 rlineto -0.43 0
                    closepath)
          round round #t)
   (cons -0.157026098223572 2.2005)
   (cons -1.8125 5.4385))
  0.88 -0.88)

ClefBassLN =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 2.7 0.01
                    rcurveto -0.559 -0.172 -0.816 -0.122 -0.988 0.021
                    rcurveto -0.068 0.061 -0.176 0.2 -0.233 0.314
                    rcurveto -0.1 0.172 -0.379 1.149 -0.351 1.476
                    rlineto 0 -0.004 rlineto -0.144 0 rlineto 0 -3.62 rlineto 0.144 0
                    rlineto 0 3.1
                    rcurveto 0.025 -0.211 0.064 -0.49 0.15 -0.815
                    rcurveto 0.107 -0.384 0.308 -0.928 0.759 -0.928
                    rcurveto 0.118 0 0.215 0.028 0.301 0.068
                    rlineto -0.187 -0.208
                    rcurveto -0.375 -0.433 -0.49 -1.006 -0.444 -1.632
                    rcurveto 0.025 -0.186 0.072 -0.383 0.14 -0.591
                    rcurveto 0.097 -0.254 0.179 -0.522 0.254 -0.805
                    rcurveto 0.075 -0.283 0.104 -0.516 0.09 -0.698
                    rcurveto -0.011 -0.183 -0.04 -0.326 -0.083 -0.433
                    rcurveto -0.039 -0.111 -0.082 -0.193 -0.125 -0.254
                    rcurveto -0.04 -0.061 -0.104 -0.122 -0.193 -0.189
                    rcurveto -0.089 -0.068 -0.222 -0.115 -0.401 -0.144
                    rcurveto -0.097 0 -0.172 0.007 -0.226 0.018
                    rcurveto 0 0 -0.132 0.046 -0.24 0.115
                    rcurveto -0.197 0.175 -0.258 0.315 -0.258 0.433
                    rcurveto 0 0.075 0.003 0.125 0.011 0.154
                    rcurveto 0.011 0.029 0.028 0.068 0.057 0.118
                    rcurveto 0.057 0.097 0.172 0.189 0.287 0.204
                    rcurveto 0.114 0.014 0.2 0.007 0.29 -0.079
                    rcurveto 0.096 -0.086 0.139 -0.219 0.053 -0.494
                    rcurveto 0.226 0.097 0.287 0.297 0.254 0.479
                    rcurveto -0.072 0.261 -0.19 0.347 -0.465 0.426
                    rcurveto -0.083 0.011 -0.129 0.014 -0.136 0.014
                    rcurveto -0.275 -0.003 -0.437 -0.122 -0.541 -0.24
                    rcurveto -0.1 -0.125 -0.15 -0.226 -0.15 -0.451
                    rcurveto 0.032 -0.226 0.101 -0.319 0.187 -0.416
                    rcurveto 0.042 -0.05 0.082 -0.093 0.122 -0.125
                    rcurveto 0.039 -0.036 0.114 -0.086 0.226 -0.147
                    rlineto 0.132 -0.054
                    rcurveto 0.093 -0.036 0.211 -0.054 0.358 -0.054
                    rcurveto 0.684 0 1.311 0.562 1.311 1.239
                    rcurveto 0.024 0.34 -0.083 0.72 -0.322 1.139
                    rcurveto -0.301 0.537 -0.444 1.009 -0.426 1.417
                    rcurveto 0.011 0.254 0.05 0.466 0.119 0.634
                    rcurveto 0.067 0.168 0.196 0.368 0.39 0.602
                    rcurveto 0.084 0.106 0.177 0.249 0.278 0.41
                    closepath
                    rmoveto -2.356 -1.812
                    rlineto 0 3.62 rlineto 0.43 0 rlineto 0 -3.62 rlineto -0.43 0
                    closepath)
          round round #t)
   (cons -0.1755 2.2005)
   (cons -5.4315 1.8215))
  0.88 -0.88)

OttavaLN =
#(ly:stencil-scale
  (ly:make-stencil
   `(path 0.001
          ( rmoveto 2.2 -2.5
                    rcurveto 0 0.24 -0.244 0.394 -0.448 0.394
                    rcurveto -0.189 0 -0.437 -0.086 -0.437 -0.304
                    rcurveto 0 -0.15 0.114 -0.25 0.172 -0.279
                    rcurveto -0.115 -0.061 -0.15 -0.172 -0.15 -0.272
                    rcurveto 0 -0.218 0.2 -0.315 0.415 -0.315
                    rcurveto 0.315 0 0.405 0.132 0.405 0.293
                    rcurveto 0.003 0.086 -0.04 0.168 -0.115 0.229
                    rcurveto 0.089 0.043 0.158 0.126 0.158 0.254
                    closepath
                    rmoveto -0.158 -0.483
                    rcurveto -0.011 -0.125 -0.072 -0.233 -0.286 -0.233
                    rcurveto -0.115 0 -0.244 0.061 -0.226 0.165
                    rcurveto 0.018 0.097 0.336 0.218 0.433 0.243
                    rcurveto 0.043 -0.043 0.082 -0.114 0.079 -0.175
                    closepath
                    rmoveto -0.082 0.608
                    rcurveto 0 -0.186 -0.3 -0.247 -0.401 -0.268
                    rcurveto -0.082 0.046 -0.122 0.089 -0.122 0.189
                    rcurveto 0 0.158 0.075 0.272 0.287 0.272
                    rcurveto 0.071 0.001 0.236 -0.078 0.236 -0.193
                    closepath)
          round round #t)
   (cons 1.3145 2.2005)
   (cons -3.2765 -2.1055))
  0.8 -0.8)

ClefTrebleHighLN =
#(ly:stencil-add
  ClefTrebleLN
  (ly:stencil-translate
   OttavaLN
   (cons 0 -1.4)))

ClefBassLowLN =
#(ly:stencil-add
  ClefBassLN
  (ly:stencil-translate
   OttavaLN
   (cons 0 -2.96)))

%-------------------------------------------------------------------------------
% Other glyphs
%-------------------------------------------------------------------------------

schleifer =
#(ly:stencil-scale
  (ly:make-stencil
   `(path .001
          ( rcurveto 0.28 -0.29 0.57 -0.51 0.88 -0.65
                     rcurveto 0.32 -0.15 0.32 -0.14 0.02 0.03
                     rcurveto -0.3 0.17 -0.55 0.37 -0.75 0.61
                     rcurveto -0.2 0.24 -0.41 0.53 -0.65 0.87
                     rcurveto -0.01 0.02 -0.03 0.03 -0.05 0.03
                     rcurveto -0.02 0 -0.04 -0.01 -0.05 -0.02
                     rlineto -0.35 -0.43 rlineto -0.28 0.43
                     rcurveto -0.01 0.02 -0.03 0.03 -0.06 0.03
                     rcurveto -0.02 0 -0.03 -0.01 -0.05 -0.02
                     rlineto -0.35 -0.43 rlineto -0.11 0.17
                     rcurveto -0.02 0.02 -0.04 0.03 -0.05 0.03
                     rcurveto -0.06 0 -0.08 -0.08 -0.06 -0.11
                     rlineto 0.34 -0.5 rcurveto 0.01 -0.02 0.03 -0.03 0.05 -0.03
                     rcurveto 0.02 0 0.04 0.01 0.05 0.03
                     rlineto 0.35 0.43 rlineto 0.28 -0.43
                     rcurveto 0.01 -0.02 0.03 -0.03 0.06 -0.03
                     rcurveto 0.02 0 0.03 0.01 0.05 0.03
                     rlineto 0.35 0.43 rlineto 0.38 -0.45 closepath)
          round round #t)
   (cons 0 1)
   (cons 0 1))
  1 -1)

%-------------------------------------------------------------------------------

%===============================================================================

%-------------------------------------------------------------------------------
% LN / TN switch
%-------------------------------------------------------------------------------

% Put "TN = ##t" or "notation = TN"
% before \include LN.ily to render in Traditional Notation
% The output is: notation = LN (TN = #f, LN = #t) or notation = TN (TN = #t, LN = #f)

#(define notation
   (if (not (defined? 'notation)) "LN" notation))

#(define TN
   (if (not (defined? 'TN)) #f TN))

#(if (eq? TN #t) (set! notation "TN") (set! TN #f))

#(if (string= notation "TN") (set! TN #t))

#(define LN
   (if TN #f #t))

#(if LN (set! notation "LN"))

#(if TN (begin
         (set! output-suffix "TN")
         (set! write-performances-midis (lambda (performances basename . rest) 0))))

%-------------------------------------------------------------------------------

% LyreBird version
#(define lyrebird-version
   (if (not (defined? 'lyrebird-version)) '10000000 lyrebird-version))

% LilyPond Version
% (copied and modified (by P.Morris) from openLilyLib, lilypond-version-predicates.ily)

#(define (calculate-ly-version version-list)
   "Return an integer representation of the LilyPond version,
    can be compared with =, <, >, etc."
   (+ (* 1000000 (list-ref version-list 0))
      (* 1000 (list-ref version-list 1))
      (list-ref version-list 2)))

#(define (check-ly-version proc ref-version-list)
   "Compare the LilyPond version with the reference version
    in @code{ref-version-list} (e.g. (list 2 18 2) or '(2 19 7) )
    using @code{proc} (e.g. >  <  >=  <=) and return #t or #f."
   (proc (calculate-ly-version (ly:version))
         (calculate-ly-version ref-version-list)))

%-------------------------------------------------------------------------------
% Null function
%-------------------------------------------------------------------------------

null-function = #(define-void-function () ())
null-function-n = #(define-void-function (y) (number?))
null-function-n-n = #(define-void-function (x y) (number? number?))
null-function-s = #(define-void-function (s) (string?))
null-function-s-s = #(define-void-function (s t) (string? string?))
null-function-s-markup = #(define-music-function (s) (string?)
                            #{-\markup ""#})

% Absolute value helper function
% when LilyPond upgrades to Guile 2.0, use "abs" and remove this function
#(define (abs x) (if (> x 0) x (- 0 x)))

%-------------------------------------------------------------------------------
% Functions for managing note heads in chromatic staff
%-------------------------------------------------------------------------------

#(define (LN-notehead-pitch grob)
   "Takes a note head grob and returns its pitch."
   (ly:event-property (ly:grob-property grob 'cause) 'pitch))

#(define (LN-notehead-semitone grob)
   "Takes a note head grob and returns its semitone."
   (ly:pitch-semitones (LN-notehead-pitch grob)))

#(define (LN-notehead-staff-position grob)
   "Adjusts vertical position of note heads for chromatic staff"
   (ly:grob-set-property! grob 'staff-position (LN-notehead-semitone grob)))

#(define (LN-cluster-position grob)
   "Adjusts vertical position of note heads for chromatic staff"
   (ly:grob-set-property! grob 'Y-offset (/(LN-notehead-semitone grob)6)))


%-------------------------------------------------------------------------------
% Coloring Grobs
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Function for coloring all grobs

%% http://lsr.di.unimi.it/LSR/Item?id=443
#(define (override-color-for-all-grobs color)
   (lambda (context)
     (let loop ((x all-grob-descriptions))
       (if (not (null? x))
           (let ((grob-name (caar x)))
             (ly:context-pushpop-property context grob-name 'color color)
             (loop (cdr x)))))))
%% usage examples:
%%    \applyContext #(override-color-for-all-grobs (x11-color 'blue))
%%    \stopStaff \startStaff
%%    \context Score
%%    \applyContext #(override-color-for-all-grobs (x11-color 'red)

#(define (revert-color-for-all-grobs)
   (lambda (context)
     (let loop ((x all-grob-descriptions))
       (if (not (null? x))
           (let ((grob-name (caar x)))
             (ly:context-pushpop-property context grob-name 'color)
             (loop (cdr x)))))))

color =
#(define-music-function (c color) (string? string?)
   (if
    (string= color "")
    #{\stopStaff
      \context #c
      \applyContext #(revert-color-for-all-grobs)
      \startStaff
    #}
    #{\stopStaff
      \context #c {
        \applyContext #(revert-color-for-all-grobs)
        \applyContext #(override-color-for-all-grobs (x11-color (string->symbol color)))
      }
      \startStaff  #}))

% { \color ChordNames DarkGreen
%   \color Lyrics "yellow4"
%   \color Score ForestGreen
%   \color Staff green
%   \color Voice violet }

%-------------------------------------------------------------------------------
% Function for coloring background behind the staves

bgColor =
#(define-music-function (color x-exI x-exII y-exI y-exII)
   (string? number? number? number? number?)
   #{\stopStaff
     \override Staff.StaffSymbol $'stencil =
     $(lambda (grob)
        (let* ((staff (ly:staff-symbol::print grob))
               (X-ext (ly:stencil-extent staff X))
               (Y-ext (ly:stencil-extent staff Y)))
          (set! Y-ext (cons
                       (+ (car Y-ext) y-exI)
                       (+ (cdr Y-ext) y-exII)))
          (set! X-ext (cons
                       (+ (car X-ext) x-exI)
                       (+ (cdr X-ext) x-exII)))
          (ly:grob-set-property! grob 'layer -10)
          (ly:stencil-add
           (ly:make-stencil (list 'color  (x11-color (string->symbol color))
                                  (ly:stencil-expr (ly:round-filled-box X-ext Y-ext 0))
                                  X-ext Y-ext)) staff)))
     \startStaff #})
% <<
%   \new Staff { \bgColor blue -1 1 -1 1}
%   \new Staff { \bgColor "grey60" -2 2 -3 3 }

% >>

%-------------------------------------------------------------------------------
% NOTE HEADS AND STEM ATTACHMENT
%------------------------------------------------------------------------------

#(define (customNoteHeads cfill xmod ymod) ; TILTING NOTEHEADS
   (lambda (grob)

     ; (set! (ly:grob-property grob 'staff-position) LN-notehead-semitone ) ;not working - breaks transposing clefs
     ;Adjusts vertical position of note heads for chromatic staff.
     ;Moved here since previous solution produced error in Lilypond 2.22 (stencil changed from inside callback):
     ;when using    \override TrillPitchHead.stencil =  #(customNoteHeads 1 1 1)
     ;together with \override TrillPitchHead.before-line-breaking = #LN-notehead-staff-position

     (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
            (mult (magstep fsz))
            (ptch (ly:event-property (event-cause grob) 'pitch))
            (semi (ly:pitch-semitones ptch))
            (note-type (modulo (+ semi cfill) 2))
            (dur-log (ly:grob-property grob 'duration-log))
            (minim? (if (< dur-log 2) #t #f))
            (black-note? (= note-type 0))

            ;; alteration:
            ;; 0 = natural,
            ;; .5 = sharp
            ;; 1 = double sharp
            ;; -.5 = flat
            ;; -1 = double flat
            (alt (ly:pitch-alteration ptch))
            (notecol (ly:grob-parent grob X))
            (stm (ly:grob-object notecol 'stem))
            (stem-dir (ly:grob-property stm 'direction))
            (stem-x (if (eq? stem-dir UP) 1 -1))
            (ypos (ly:grob-staff-position grob))
            (fnt (ly:grob-default-font grob)))

       ;; TILTING NOTE HEADS
       (set! (ly:grob-property grob 'stencil)
             (ly:stencil-scale
              (cond
               ;;breve, black
               ((and (< dur-log 0) black-note?)
                (case alt
                  ((-1) breveBlackFlat ) ;; bb
                  ((-3/4) breveQuarterFlat) ;; 3/4 b
                  ((-1/2) breveBlackFlat) ;; b
                  ((-1/4) breveQuarterFlat) ;; 1/4 b
                  ((0) breveBlackNatural) ;; natural
                  ((1/4) breveQuarterSharp) ;; 1/4 #
                  ((1/2) breveBlackSharp) ;; #
                  ((3/4) breveQuarterSharp) ;; 3/4 #
                  ((1) breveBlackSharp) ;; ##
                  (else breveBlackNatural)))
               ;;breve, white
               ((and (< dur-log 0) (not black-note?))
                (case alt
                  ((-1) breveWhiteFlat ) ;; bb
                  ((-3/4) breveQuarterFlat) ;; 3/4 b
                  ((-1/2) breveWhiteFlat) ;; b
                  ((-1/4) breveQuarterFlat) ;; 1/4 b
                  ((0) breveWhiteNatural) ;; natural
                  ((1/4) breveQuarterSharp) ;; 1/4 #
                  ((1/2) breveWhiteSharp) ;; #
                  ((3/4) breveQuarterSharp) ;; 3/4 #
                  ((1) breveWhiteSharp) ;; ##
                  (else breveWhiteNatural)))
               ;;semibreve, black
               ((and (= dur-log 0) black-note?)
                (case alt
                  ((-1) semiBreveBlackFlat ) ;; bb
                  ((-3/4) semiBreveQuarterFlat) ;; 3/4 b
                  ((-1/2) semiBreveBlackFlat) ;; b
                  ((-1/4) semiBreveQuarterFlat) ;; 1/4 b
                  ((0) semiBreveBlackNatural) ;; natural
                  ((1/4) semiBreveQuarterSharp) ;; 1/4 #
                  ((1/2) semiBreveBlackSharp) ;; #
                  ((3/4) semiBreveQuarterSharp) ;; 3/4 #
                  ((1) semiBreveBlackSharp) ;; ##
                  (else semiBreveBlackNatural)))
               ;;semibreve, white
               ((and (= dur-log 0) (not black-note?))
                (case alt
                  ((-1) semiBreveWhiteFlat ) ;; bb
                  ((-3/4) semiBreveQuarterFlat) ;; 3/4 b
                  ((-1/2) semiBreveWhiteFlat) ;; b
                  ((-1/4) semiBreveQuarterFlat) ;; 1/4 b
                  ((0) semiBreveWhiteNatural) ;; natural
                  ((1/4) semiBreveQuarterSharp) ;; 1/4 #
                  ((1/2) semiBreveWhiteSharp) ;; #
                  ((3/4) semiBreveQuarterSharp) ;; 3/4 #
                  ((1) semiBreveWhiteSharp) ;; ##
                  (else semiBreveWhiteNatural)))
               ;; minim, white
               ((and (not black-note?) minim?)
                (case alt
                  ((-1) minimWhiteFlat ) ;; bb
                  ((-3/4) minimQuarterFlat) ;; 3/4 b
                  ((-1/2) minimWhiteFlat) ;; b
                  ((-1/4) minimQuarterFlat) ;; 1/4 b
                  ((0) minimWhiteNatural) ;; natural
                  ((1/4) minimQuarterSharp) ;; 1/4 #
                  ((1/2) minimWhiteSharp) ;; #
                  ((3/4) minimQuarterSharp) ;; 3/4 #
                  ((1) minimWhiteSharp) ;; ##
                  (else minimWhiteNatural)))
               ;; minim, black
               ((and black-note? minim?)
                (case alt
                  ((-1) minimBlackFlat ) ;; bb
                  ((-3/4) minimQuarterFlat) ;; 3/4 b
                  ((-1/2) minimBlackFlat) ;; b
                  ((-1/4) minimQuarterFlat) ;; 1/4 b
                  ((0) minimBlackNatural) ;; natural
                  ((1/4) minimQuarterSharp) ;; 1/4 #
                  ((1/2) minimBlackSharp) ;; #
                  ((3/4) minimQuarterSharp) ;; 3/4 #
                  ((1) minimBlackSharp) ;; ##
                  (else minimBlackNatural)))
               ;; crotchet, white
               ((and (not black-note?) (not minim?))
                (case alt
                  ((-1) crotchetWhiteFlat ) ;; bb
                  ((-3/4) crotchetQuarterFlat) ;; 3/4 b
                  ((-1/2) crotchetWhiteFlat) ;; b
                  ((-1/4) crotchetQuarterFlat) ;; 1/4 b
                  ((0) crotchetWhiteNatural) ;; natural
                  ((1/4) crotchetQuarterSharp) ;; 1/4 #
                  ((1/2) crotchetWhiteSharp) ;; #
                  ((3/4) crotchetQuarterSharp) ;; 3/4 #
                  ((1) crotchetWhiteSharp) ;; ##
                  (else crotchetWhiteNatural)))
               ;; crotchet, black
               ((and black-note? (not minim?))
                (case alt
                  ((-1) crotchetBlackFlat ) ;; bb
                  ((-3/4) crotchetQuarterFlat) ;; 3/4 b
                  ((-1/2) crotchetBlackFlat) ;; b
                  ((-1/4) crotchetQuarterFlat) ;; 1/4 b
                  ((0) crotchetBlackNatural) ;; natural
                  ((1/4) crotchetQuarterSharp) ;; 1/4 #
                  ((1/2) crotchetBlackSharp) ;; #
                  ((3/4) crotchetQuarterSharp) ;; 1/4 #
                  ((1) crotchetBlackSharp) ;; ##
                  (else crotchetBlackNatural))))
              ;; x and y scaling values for ly:stencil-scale
              ;; changes size of note heads when user changes size of staff
              ;; (follows change in font size)
              (* xmod mult)
              (* ymod mult)))

       ;; STEM ATTACHMENT
       (if (not minim?)
           (set! (ly:grob-property grob 'stem-attachment)
                 (if black-note?
                     ;; black notes: c d e f# g# a#
                     (cons stem-x 0)
                     ;; white notes: f g a b c# d#
                     (cons stem-x 0)))))))

%-------------------------------------------------------------------------------

#(define (customNoteHeadsNeutral cfill xmod ymod) ; NEUTRAL NOTEHEADS
   (lambda (grob)

     ;(set! (ly:grob-property grob 'staff-position) LN-notehead-semitone )
     ;Adjusts vertical position of note heads for chromatic staff.

     (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
            (mult (magstep fsz))
            (ptch (ly:event-property (event-cause grob) 'pitch))
            (semi (ly:pitch-semitones ptch))
            (note-type (modulo (+ semi cfill) 2))
            (dur-log (ly:grob-property grob 'duration-log))
            (minim? (if (< dur-log 2) #t #f))
            (black-note? (= note-type 0))

            ;; alteration:
            ;; 0 = natural,
            ;; .5 = sharp
            ;; 1 = double sharp
            ;; -.5 = flat
            ;; -1 = double flat
            (alt (ly:pitch-alteration ptch))
            (notecol (ly:grob-parent grob X))
            (stm (ly:grob-object notecol 'stem))
            (stem-dir (ly:grob-property stm 'direction))
            (stem-x (if (eq? stem-dir UP) 1 -1))
            (ypos (ly:grob-staff-position grob))
            (fnt (ly:grob-default-font grob)))

       ;; NEUTRAL NOTE HEADS
       (set! (ly:grob-property grob 'stencil)
             (ly:stencil-scale
              (cond
               ;;breve, black
               ((and (< dur-log 0) black-note?)
                breveBlackNatural)
               ;;breve, white
               ((and (< dur-log 0) (not black-note?))
                breveWhiteNatural)
               ;;semibreve, black
               ((and (= dur-log 0) black-note?)
                semiBreveBlackNatural)
               ;;semibreve, white
               ((and (= dur-log 0) (not black-note?))
                semiBreveWhiteNatural)
               ;; minim, white
               ((and (not black-note?) minim?)
                minimWhiteNatural)
               ;; minim, black
               ((and black-note? minim?)
                minimBlackNatural)
               ;; crotchet, white
               ((and (not black-note?) (not minim?))
                crotchetWhiteNatural)
               ;; crotchet, black
               ((and black-note? (not minim?))
                crotchetBlackNatural))
              ;; x and y scaling values for ly:stencil-scale
              ;; changes size of note heads when user changes size of staff
              ;; (follows change in font size)
              (* xmod mult)
              (* ymod mult)))

       ;; STEM ATTACHMENT
       (if (not minim?)
           (set! (ly:grob-property grob 'stem-attachment)
                 (if black-note?
                     ;; black notes: c d e f# g# a#
                     (cons stem-x 0)
                     ;; white notes: f g a b c# d#
                     (cons stem-x 0)))))))

%-------------------------------------------------------------------------------

% Note heads for sharp and flats / Neutral note heads switch

neutralNH-on = #(if (not TN) #{
  \override Staff.NoteHead.before-line-breaking =
  #(customNoteHeadsNeutral 1 1 1) #})

neutralNH-off = #(if (not TN) #{
  \override Staff.NoteHead.before-line-breaking =
  #(customNoteHeads 1 1 1) #})
%
% the arguments must be the same as in vertScaleStaff & staff scaling
% (the last number is notemod)


%-------------------------------------------------------------------------------
% Dotted notes
%-------------------------------------------------------------------------------

#(define (LN-note-dots grob)
   "Adjust vertical position of dots for certain notes."
   (let* ((parent (ly:grob-parent grob Y))
          ;; parent is a Rest grob or a NoteHead grob
          (parent-name (assq-ref (ly:grob-property parent 'meta) 'name))
          (semi (if (equal? 'Rest parent-name)
                    #f
                    (modulo (LN-notehead-semitone parent) 12))))
     (cond
      ((equal? semi 0) ;; C
                       (ly:grob-set-property! grob 'staff-position
                                              (if (equal? -1 (ly:grob-property grob 'direction))
                                                  -1 ;; down
                                                  1))) ;; up or neutral
      ((member semi (list 2 6 10)) ;; D (2) F#/Gb (6) or A#/Bb (10)
                                   (ly:grob-set-property! grob 'Y-offset -0.36
                                                          )))))


%-------------------------------------------------------------------------------
% STEMS
%-------------------------------------------------------------------------------

% lengthen all stems and remove stems for half notes

%#(if (not TN)
#(define ((stem-lengthen mult) grob)
   ;; inner recursive function
   (define (mod-args args mult)
     (if (pair? args)
         (cons
          (* (car args) mult)
          (mod-args (cdr args) mult))
         '()))
   ;; outer recursive function
   (define (mod-list exps mult)
     (if (pair? exps)
         (let* ((expn (car exps))
                (head (car expn))
                (args (cdr expn))
                (new-args
                 (if (eq? head 'stem-shorten)
                     args
                     (mod-args args mult))))
           (cons (cons head new-args)
                 (mod-list (cdr exps) mult)))
         '()))
   ;; stem length
   ;; use the recursive functions above to modify all the
   ;; relevant values in 'details to extend stem lengths to proper length
   (set!
    (ly:grob-property grob 'details)
    (mod-list
     (ly:grob-property grob 'details)
     mult))
   ;; no stems for half notes
   ;; chromatic-lyre-change

   (if (= 1 (ly:grob-property grob 'duration-log))
       (set! (ly:grob-property grob 'stencil)
             '() )))
%)

%alternative
%; (if (= 1 (ly:grob-property grob 'duration-log))
%;            (set! (ly:grob-property grob 'duration-log)
%;                  0 ))))

%-------------------------------------------------------------------------------
%% BEAMS
%-------------------------------------------------------------------------------


#(define ((ln-beams staff-spc-inv) grob)
   "Adjust size and spacing of beams. Needed
    because of smaller StaffSymbol.staff-space"
   (let*
    ((thick (ly:grob-property-data grob 'beam-thickness))
     (len-frac (ly:grob-property-data grob 'length-fraction))
     (space (if (number? len-frac) len-frac 1))
     (stem (ly:grob-parent grob X))
     (stem-dir (ly:grob-property stem 'direction))
     (dur-log (ly:grob-property stem 'duration-log)))
    (ly:grob-set-property! grob 'beam-thickness
                           (* thick staff-spc-inv))
    ;; 1.1 adjustment below was visually estimated
    (ly:grob-set-property! grob 'length-fraction
                           (* space staff-spc-inv 1.0))
    ;; adjust position of tremolo beams for minims
    ;    (if (eq? dur-log 1)
    ;        (begin
    ;         (ly:grob-set-property! grob 'gap-count 10)
    ;         (ly:grob-set-property! grob 'gap 1)
    ;          (if (eq? stem-dir UP)
    ;              (ly:grob-set-property! grob 'extra-offset '(-1 . -0.5))
    ;              (ly:grob-set-property! grob 'extra-offset '(1 . 0.5)))))
    ))



%-------------------------------------------------------------------------------
% Tremolo (fix StemTremolo position for minims)
%-------------------------------------------------------------------------------

#(define (minim-stem-tremolo grob)
   (let* ((stem (ly:grob-object grob 'stem))
          (dur-log (ly:grob-property stem 'duration-log)))
     (if (eq? dur-log 1)
         (ly:grob-set-property! stem 'duration-log 0))))

% \override StemTremolo.before-line-breaking = #minim-stem-tremolo

%-------------------------------------------------------------------------------
% Center Note Column (adjusting X position of notes & rests)
%-------------------------------------------------------------------------------

% Thanks to David Nalesnik

#(define (sort-by-X-coord sys grob-lst)
   "Arranges a list of grobs in ascending order by their X-coordinates"
   (let* ((X-coord (lambda (x) (ly:grob-relative-coordinate x sys X)))
          (comparator (lambda (p q) (< (X-coord p) (X-coord q)))))

     (sort grob-lst comparator)))

#(define (find-bounding-grobs note-column grob-lst)
   (let* ((sys (ly:grob-system note-column))
          (X-coord (lambda (n) (ly:grob-relative-coordinate n sys X)))
          (note-column-X (X-coord note-column)))

     (define (helper lst)
       (if (and (< (X-coord (car lst)) note-column-X)
                (> (X-coord (cadr lst)) note-column-X))
           (cons (car lst) (cadr lst))
           (if (null? (cddr lst))
               (cons note-column note-column)
               (helper (cdr lst)))))

     (helper grob-lst)))

#(define (read-out ls1 ls2 ls3 symbol)
   "Filters all elements of ls1 from ls2 and appends it to ls3"
   (set! ls3 (append ls3 (filter (lambda (x) (eq? (car ls1) (symbol x))) ls2)))
   (if (null? (cdr ls1))
       ls3
       (read-out (cdr ls1) ls2 ls3 symbol)))

#(define ((center-note-column x-offs) grob)
   (let* ((sys (ly:grob-system grob))
          (elements-lst (ly:grob-array->list (ly:grob-object sys 'all-elements)))
          (grob-name (lambda (x) (assq-ref (ly:grob-property x 'meta) 'name)))
          (X-extent (lambda (q) (ly:grob-extent q sys X)))
          ;; NoteColumn
          (note-column-coord (ly:grob-relative-coordinate grob sys X))
          (grob-ext (X-extent grob))
          (grob-length (interval-length grob-ext))
          ;; NoteHeads
          (note-heads (ly:grob-object grob 'note-heads))
          (note-heads-grobs (if (not (null? note-heads))
                                (ly:grob-array->list note-heads)
                                '()))
          (one-note-head (if (not (null? note-heads-grobs))
                             (car note-heads-grobs)
                             '()))
          (one-note-head-length (if (not (null? one-note-head))
                                    (interval-length (X-extent one-note-head)) ;; NB
                                    0))
          ;; Stem
          (stem (ly:grob-object grob 'stem))
          (stem-dir (ly:grob-property stem 'direction))
          (stem-length-x (interval-length (X-extent stem))) ;; NB
          ;; DotColumn
          (dot-column (ly:note-column-dot-column grob))
          ;; AccidentalPlacement
          (accidental-placement (ly:note-column-accidentals grob))
          ;; Arpeggio
          (arpeggio (ly:grob-object grob 'arpeggio))
          ;; Rest
          (rest (ly:grob-object grob 'rest))
          ;; Grobs to center between
          (args (list 'BarLine
                      'Clef
                      'KeySignature
                      'KeyCancellation
                      'TimeSignature))
          (grob-lst (read-out args elements-lst '() grob-name))
          (new-grob-lst (remove (lambda (x) (interval-empty? (X-extent x))) grob-lst))
          (sorted-grob-lst (sort-by-X-coord sys new-grob-lst))
          ;; Bounds
          (bounds (find-bounding-grobs grob sorted-grob-lst))
          (left (cdr (X-extent (car bounds))))
          (right (car (X-extent (cdr bounds))))

          (basic-offset
           (- (average left right)
              (interval-center (X-extent grob))
              (* -1 x-offs)))
          (dir-correction
           (if (> grob-length one-note-head-length)
               (* stem-dir (* -2 stem-length-x) grob-length)
               0))

          ) ;; End of Defs in let*

     ;; Calculation
     (begin
      (for-each
       (lambda (x)
         (cond ((ly:grob? x)
                (ly:grob-translate-axis!
                 x
                 (- basic-offset dir-correction)
                 X))))
       (list
        (cond ((not (null? note-heads)) grob))
        dot-column accidental-placement arpeggio rest))
      )))

centerNoteColumnOn = \override Staff.NoteColumn.after-line-breaking = #(center-note-column 0)

centerNoteColumnOff = \revert Staff.NoteColumn.after-line-breaking

onceCenterNoteColumn =
#(define-music-function (x-offs)(number?)
   #{
     \once \override Staff.NoteColumn.after-line-breaking = #(center-note-column x-offs)
   #})


%-------------------------------------------------------------------------------
% RESTS
%-------------------------------------------------------------------------------

% Thanks to Paul Morris

%#(if (not TN)
#(define ((custom-rests add-y) grob)
   (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
          (mult (magstep fsz))
          ;; get duration of the rest
          (dur-log (ly:grob-property grob 'duration-log))

          (dot (ly:grob-object grob 'dot))
          (y-off (ly:grob-property grob 'Y-offset ))
          ;; grob direction indicates polyphonic voices:
          ;; \voiceOne or \voiceThree is  +1
          ;; \voiceTwo or \voiceFour is -1
          ;; \oneVoice is 0 or a function?
          (grob-dir (ly:grob-property-data grob 'direction)))

     ;; (display y-off)(newline)
     ;; (display dur-log)(newline)


     ;; for testing
     ;; (display grob-dir)(newline)
     ;; I would take this out:  -Paul
     ;; (ly:grob-set-property! grob 'Y-offset 0)
     ;       (cond
     ;       ((= dur-log 0)
     ;        (ly:grob-set-property! grob 'Y-offset 0.818))
     ;      ; Shift SemiBreve rest to the center
     ;           (else (ly:grob-set-property! grob 'Y-offset 0)))
     ;      ; Other rests to the center

     ;      ;; shift dots on rests, if they have one but not for:
     ;      ;; whole, half, 32nd, 64th, 128th rests (already correct)
     ;      ;; and only when offset is 1 (default position in center of staff)

     (cond
      ((< dur-log 0) ;; breve
                     (set! (ly:grob-property grob 'stencil) (ly:stencil-scale restBreve mult mult))
                     (cond
                      ;; voice 1 or 3
                      ((eq? grob-dir 1)
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off -2.45 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0.1))))
                      ;; voice 2 or 4
                      ((eq? grob-dir -1)
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off 2.45 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0.1))))
                      ;; oneVoice
                      (else
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off 0.75 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0.18))))))

      ((= dur-log 0) ;; semibreve
                     (set! (ly:grob-property grob 'stencil) (ly:stencil-scale restSemiBreve mult mult))
                     (cond
                      ;; voice 1 or 3
                      ((eq? grob-dir 1)
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off -2.45 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y -0.1 ))))
                      ;; voice 2 or 4
                      ((eq? grob-dir -1)
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off 2.45 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y -0.1 ))))
                      ;; oneVoice
                      (else
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off -0.9 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 add-y)))))

      ((< dur-log 2) ;; minim
                     (set! (ly:grob-property grob 'stencil) (ly:stencil-scale restMinim mult mult))
                     (cond
                      ;; voice 1 or 3
                      ((eq? grob-dir 1)
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off -2.45 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0.1 ))))
                      ;; voice 2 or 4
                      ((eq? grob-dir -1)
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off 2.45 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0.1 ))))
                      ;; oneVoice
                      (else
                       (set! (ly:grob-property grob 'Y-offset) (+ y-off 0.9 ))
                       (set! (ly:grob-property grob 'extra-offset) (cons 0 add-y)))))

      ((>= dur-log 2) ;; crotchet and shorter
                      (cond
                       ;; voice 1 or 3
                       ((eq? grob-dir 1)
                        (set! (ly:grob-property grob 'Y-offset) (+ y-off -1.65 ))
                        (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0 ))))
                       ;; voice 2 or 4
                       ((eq? grob-dir -1)
                        (set! (ly:grob-property grob 'Y-offset) (+ y-off 1.65 ))
                        (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0 ))))
                       ;; oneVoice
                       (else
                        (set! (ly:grob-property grob 'Y-offset) (+ y-off 0 ))
                        (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0 ))))))
      )))
%)

%-------------------------------------------------------------------------------


#(define ((custom-rest-position add-y) grob)
   (let* ((fsz  (ly:grob-property grob 'font-size 0.0))
          (mult (magstep fsz))
          ;; get duration of the rest
          (dur-log (ly:grob-property grob 'duration-log))
          (dot (ly:grob-object grob 'dot))
          (grob-dir (ly:grob-property-data grob 'direction)))
     (ly:grob-set-property! grob 'Y-offset 0)

     (cond ;; move rest dot
           ((ly:grob? dot)
            (ly:grob-set-property! dot 'Y-offset  (* add-y 0.817) )))

     (cond
      ((< dur-log 0) ;; breve
                     (set! (ly:grob-property grob 'stencil) (ly:stencil-scale restBreve mult mult))
                     ;(cond
                     ;; voices
                     ;((or (eq? grob-dir 1) (eq? grob-dir -1))
                     (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y -0.9))
                           ;          ))
                           ;; oneVoice
                           ;(else
                           ; (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y -1.18))))
                           ))

      ((= dur-log 0) ;; semibreve
                     (set! (ly:grob-property grob 'stencil) (ly:stencil-scale restSemiBreve mult mult))
                     ;(cond
                     ;; voices
                     ;((or (eq? grob-dir 1) (eq? grob-dir -1))
                     (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0.9 ))
                           ;         ))
                           ;; oneVoice
                           ;(else
                           ; (set! (ly:grob-property grob 'Y-offset) (+  -0.9 ))
                           ; (set! (ly:grob-property grob 'extra-offset) (cons 0 add-y)))
                           ))

      ((< dur-log 2) ;; minim
                     (set! (ly:grob-property grob 'stencil) (ly:stencil-scale restMinim mult mult))
                     ;(cond
                     ;; voices
                     ;((or (eq? grob-dir 1) (eq? grob-dir -1))
                     (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y -0.9 )))
                     ;    ))
                     )

      ((>= dur-log 2) ;; crotchet and shorter
                      (set! (ly:grob-property grob 'extra-offset) (cons 0 (+ add-y 0 ))))
      )))


%-------------------------------------------------------------------------------

% adjust relative offset

restY = #(define-music-function (add-y) (number?)
           #{ \once \override Rest.before-line-breaking =
              #(lambda (grob) ((custom-rests add-y) grob))
           #})

setRestY = #(define-music-function (add-y) (number?)
              #{ \override Rest.before-line-breaking =
                 #(lambda (grob) ((custom-rests add-y) grob))
              #})

resetRestY = \override Rest.before-line-breaking = #(lambda (grob) ((custom-rests 0) grob))


% adjust absolute position

restPos = #(define-music-function (add-y) (number?)
             #{ \once \override Rest.before-line-breaking =
                #(lambda (grob) ((custom-rest-position add-y) grob))
                \once \override Rest.staff-position = #add-y
             #})

setRestPos = #(define-music-function (add-y) (number?)
                #{ \override Rest.before-line-breaking =
                   #(lambda (grob) ((custom-rest-position add-y) grob))
                   \override Rest.staff-position = #add-y
                #})

resetRestPos = {
  \override Rest.before-line-breaking = #(lambda (grob) ((custom-rests 0) grob))
  \revert Rest.staff-position
}

#(if TN
     (begin
      (set! restY null-function-n)
      (set! setRestY null-function-n)
      (set! resetRestY null-function)
      (set! restPos null-function-n)
      (set! setRestPos null-function-n)
      (set! resetRestPos null-function)
      ))

tn-restPos = #(define-music-function (y) (number?)
                #{ \once \override Rest.staff-position = #y
                   \once \override MultiMeasureRest.staff-position = #y
                #})

tn-setRestPos = #(define-music-function (y) (number?)
                   #{ \override Rest.staff-position = #y
                      \override MultiMeasureRest.staff-position = #y
                   #})

tn-resetRestPos = \revert Rest.staff-position

#(if (not TN)
     (begin
      (set! tn-restPos null-function-n)
      (set! tn-setRestPos null-function-n)
      (set! tn-resetRestPos null-function)
      ))

%-------------------------------------------------------------------------------
% Full Bar Rests
%-------------------------------------------------------------------------------

% Custom Full Bar Rest
% example: \R2 3 4 = 2 full bar rests in 3/4 time

"R" = #(define-music-function (x nom den) (number? number? number?)
         #{\repeat unfold #x {
           %\once \override Rest.staff-position = -4
           \onceCenterNoteColumn #0
           #(make-music 'RestEvent
                        'duration (ly:make-duration 1 0 (* 2 nom) den))
         } #})

#(if (eq? TN #t)
     (set! R (define-music-function (x nom den) (number? number? number?)
               #{\repeat unfold #x {
                 %\once \override Rest.staff-position = -4
                 \onceCenterNoteColumn #0
                 #(make-music 'RestEvent
                              'duration (ly:make-duration 0 0 nom den))
               } #})))

%% Full Bar Rest (old)
%% (Center following note column and replace the rest symbol)
%
% "R" = {
%   \once \override Rest.before-line-breaking = ##t
%   \once \override Rest.Y-offset = -0.817
%   \once \override Rest.stencil = \restMinim
%   \onceCenterNoteColumn #0
% }


#(if LN
     (begin
      (set! expandEmptyMeasures #{
        \set Score.restNumberThreshold = 0
        \override MultiMeasureRest.transparent = ##t
        \override MultiMeasureRestNumber.stencil = #(ly:stencil-scale restLN 0.9 0.9)
        \override MultiMeasureRestNumber.Y-offset = 0.185
        \expandEmptyMeasures
            #})
      (set! compressEmptyMeasures #{
        \set Score.restNumberThreshold = 0
        \revert MultiMeasureRest.transparent
        \revert MultiMeasureRestNumber.stencil
        \revert MultiMeasureRestNumber.Y-offset
        \compressEmptyMeasures
            #})))





%-------------------------------------------------------------------------------
% CLEFS LN
%-------------------------------------------------------------------------------

% CLEF SETTINGS ----------------------------------------------------------------

% (re-)set clef settings
clefsLN =
#(define-void-function () ()
   (let* ((treble-pos -5)
          (treble-c (- -12 treble-pos))
          (bass-pos 5)
          (bass-c (- 12 bass-pos))
          (alto-pos 0)
          (alto-c (- 0 alto-pos)))
     ;; add-new-clef args:  clef-name  clef-glyph  clef-position  octavation  c0-position
     (add-new-clef "treble" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "G" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "violin" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "bass" "clefs.F" bass-pos 0 bass-c)
     (add-new-clef "F" "clefs.F" bass-pos 0 bass-c)
     (add-new-clef "alto" "clefs.C" alto-pos 0 alto-c)
     ;(add-new-clef "tenor" "clefs.C" alto-pos 0 alto-c)
     (add-new-clef "C" "clefs.C" alto-pos 0 alto-c)

     (add-new-clef "treble-down" "treble-down" treble-pos 0 -19)
     (add-new-clef "bass-down" "bass-down" bass-pos 0 -5)
     (add-new-clef "alto-down" "alto-down" alto-pos 0 -12)
     (add-new-clef "treble-up" "treble-up" treble-pos 0 5)
     (add-new-clef "bass-up" "bass-up" bass-pos 0 19)
     (add-new-clef "alto-up" "alto-up" alto-pos 0 12)))

\clefsLN
%#(set-custom-clefs)

% use this function to reset clefs back to traditional settings
clefsTN =
#(define-void-function () ()
   (let* ((treble-pos -2)
          (treble-c -4)
          (bass-pos 2)
          (bass-c 4)
          (alto-pos 0)
          (alto-c 0))
     (add-new-clef "treble" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "G" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "violin" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "bass" "clefs.F" bass-pos 0 bass-c)
     (add-new-clef "F" "clefs.F" bass-pos 0 bass-c)
     (add-new-clef "alto" "clefs.C" alto-pos 0 alto-c)
     ;(add-new-clef "tenor" "clefs.C" alto-pos 0 alto-c)
     (add-new-clef "C" "clefs.C" alto-pos 0 alto-c)

     (add-new-clef "treble-down" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "bass-down" "clefs.F" bass-pos 0 bass-c)
     (add-new-clef "alto-down" "clefs.C" alto-pos 0 alto-c)
     (add-new-clef "treble-up" "clefs.G" treble-pos 0 treble-c)
     (add-new-clef "bass-up" "clefs.F" bass-pos 0 bass-c)
     (add-new-clef "alto-up" "clefs.C" alto-pos 0 alto-c)))

% Custom Clef Engraver

#(define Custom_clef_engraver
   (make-engraver
    (acknowledgers
     ((clef-interface engraver grob source-engraver)
      (let* ((glyph-name (ly:grob-property grob 'glyph-name))
             (mult (magstep (ly:grob-property grob 'font-size 0.0))))
        (cond
         ;; G / Treble clef
         ((or
           (equal? glyph-name "clefs.G")
           (equal? glyph-name "clefs.G_change"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefTrebleLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 0))
         ;; F / Bass clef
         ((or
           (equal? glyph-name "clefs.F_change")
           (equal? glyph-name "clefs.F"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefBassLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 0))
         ;; C / Alto etc clef
         ((or
           (equal? glyph-name "clefs.C_change")
           (equal? glyph-name "clefs.C"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefAltoLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 0))

         ;; "treble-down" - LN movable treble clef - offset down
         ((or
           (equal? glyph-name "treble-down_change")
           (equal? glyph-name "treble-down"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefTrebleLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) -4.9))
         ;; "bass-down" - LN movable bass clef - offset down
         ((or
           (equal? glyph-name "bass-down_change")
           (equal? glyph-name "bass-down"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefBassLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) -4.9))
         ;; "alto-down" - LN movable alto clef - offset down
         ((or
           (equal? glyph-name "alto-down_change")
           (equal? glyph-name "alto-down"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefAltoLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) -4.9))
         ;; "treble-up" - LN movable treble clef - offset down
         ((or
           (equal? glyph-name "treble-up_change")
           (equal? glyph-name "treble-up"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefTrebleLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 4.9))
         ;; "bass-up" - LN movable bass clef - offset down
         ((or
           (equal? glyph-name "bass-up_change")
           (equal? glyph-name "bass-up"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefBassLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 4.9))
         ;; "alto-up" - LN movable alto clef - offset down
         ((or
           (equal? glyph-name "alto-up_change")
           (equal? glyph-name "alto-up"))
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefAltoLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 4.9))

         ;; default clef
         (else
          (set! (ly:grob-property grob 'stencil)
                (ly:stencil-scale ClefAltoLN mult mult))
          (set! (ly:grob-property grob 'Y-offset) 0))))))))

#(if (eq? TN #t) #{ \clefsTN #})

%-------------------------------------------------------------------------------
% 8va and 8vb clefs
%-------------------------------------------------------------------------------

%#(if LN
#(begin
  (use-modules (ice-9 regex))
  (define (ln-clef-transposition type)
    "Modify clef transposition number for LN staff."
    ;; ex: "treble^8" becomes "treble^13"
    ;; ex: "bass_15" becomes "bass_25"
    (let ((match (string-match "^(.*[_^][^0-9a-zA-Z]*)([1-9][0-9]*)([^0-9a-zA-Z]*)$" type)))
      (if (and match (match:substring match 2))
          (string-append
           (match:substring match 1)
           (let ((num (string->number (match:substring match 2))))
             (number->string
              ;; if input is 13 or 25, use that.
              (if (or (= num 13) (= num 25))
                  num
                  ;; else convert from 7 notes per octave to 12
                  ;; 8-> 13, 15-> 25
                  ;; ((((X - 1) / 7) [round] * 12) + 1)
                  (+ 1 (* 12 (round (/ (- num 1) 7)))))))
           (match:substring match 3))
          type)))

  (define clef
    (if LN
        (define-music-function (type) (string?)
          "Set the current clef to @var{type}. Replaces standard clef."
          (make-clef-set (ln-clef-transposition type))) clef))

  (define cueClef
    (if LN
        (define-music-function (type) (string?)
          "Set the current cue clef to @var{type}. Replaces standard cueClef."
          (make-cue-clef-set (ln-clef-transposition type))) cueClef))
  )
%)

"clef-trebleHigh" = {
  \clef "treble^13"
  \override Staff.ClefModifier.stencil = \OttavaLN
  \override Staff.ClefModifier.X-offset = #0.36
  \override Staff.ClefModifier.Y-offset = #-1.3
}

"clef-trebleHigh-down" = {
  \clef "treble-down^13"
  \override Staff.ClefModifier.stencil = \OttavaLN
  \override Staff.ClefModifier.X-offset = #0.36
  \override Staff.ClefModifier.Y-offset = #-1.3
}

"clef-bassLow" = {
  \clef "bass_13"
  \override Staff.ClefModifier.stencil = \OttavaLN
  \override Staff.ClefModifier.X-offset = #0.36
  \override Staff.ClefModifier.Y-offset = #-3
}

"clef-bassLow-up" = {
  \clef "bass-up_13"
  \override Staff.ClefModifier.stencil = \OttavaLN
  \override Staff.ClefModifier.X-offset = #0.36
  \override Staff.ClefModifier.Y-offset = #-3
}

#(if TN
     (begin
      (set! clef-trebleHigh null-function)
      (set! clef-trebleHigh-down null-function)
      (set! clef-bassLow null-function)
      (set! clef-bassLow-up null-function)))

%-------------------------------------------------------------------------------
% TN only clef (for conversion LN <-> TN)
%-------------------------------------------------------------------------------

#(define tn-clef
   (if (eq? TN #t)
       (define-music-function (cl) (string?)
         #{ \clef $cl #})
       null-function-s))

%-------------------------------------------------------------------------------
%
% Some useful tweaks:
%
%   \override Staff.ClefModifier.font-shape = #'roman
%   \override Staff.ClefModifier.font-series = #'bold
%   \override Staff.ClefModifier.X-offset = #1
%   \override Staff.ClefModifier.Y-offset = #0.8
%
%   \override Staff.Clef.stencil = \ClefBassLowLN
%   \override Staff.ClefModifier.stencil = ##f
%
%-------------------------------------------------------------------------------



% TIME SIGNATURE ---------------------------------------------------------------
% adjust vertical position, currently not needed
% ClairnoteTimeSignature =
% #(lambda (grob) (set! (ly:grob-property grob 'Y-offset) -1))


%-------------------------------------------------------------------------------
% STAFF SCALING
%-------------------------------------------------------------------------------

% global variable holding the default vertical scaling value
% so it can be used with key signatures and staffSize function
% TODO: how to store this per-staff rather than globally?

%ln-vscale-staff = 1.40000008

% change the vertical distance between the staff lines (staff-space)
% and everything else to match. vscale-staff = 1 gives a staff with an
% octave that is the same size as on a traditional staff (default is 1.2).
%   stems are extended back to their original/traditional size
%   time signature position is adjusted vertically
%   elsewhere key signatures are adjusted to fit the staff

vertScaleStaff =
#(define-music-function (vscale-staff) (number?)
   (define ln-vscale-staff vscale-staff)
   #{
     \override StaffSymbol.staff-space = #(* vscale-staff 7/12)
     \override Stem.before-line-breaking = #(stem-lengthen (/ 1 (* vscale-staff 7/12)))
     \override Beam.before-line-breaking = #(ln-beams (/ 1 (* vscale-staff 7/12)))
   #})

%
staffSize =
#(define-music-function (new-size) (number?)
   #{
     \set Staff.fontSize = #new-size
     \override Staff.StaffSymbol.staff-space = #(magstep (- new-size 1.8))
     \override Staff.StaffSymbol.thickness = #(magstep new-size)
   #})

tn-staffSize =
#(define-music-function (new-size) (number?)
   #{
     \set Staff.fontSize = #new-size
     \override Staff.StaffSymbol.staff-space = #(magstep new-size)
     \override Staff.StaffSymbol.thickness = #(magstep new-size)
   #})



%-------------------------------------------------------------------------------
% KEY SIGNATURES (optional)
%-------------------------------------------------------------------------------

#(define  (keysig grob alt-count)
   "Make key signature reminder (= the accidental sign + number)"
   (let*
    ((num-scale 0.7)
     (acc-scale 0.5)
     (acc (cond
           ((> alt-count 0) (ly:stencil-scale
                             (grob-interpret-markup grob (markup #:sharp))
                             acc-scale acc-scale))
           ((< alt-count 0) (ly:stencil-scale
                             (grob-interpret-markup grob (markup #:flat))
                             acc-scale acc-scale))
           ((= alt-count 0) (ly:stencil-scale
                             (grob-interpret-markup grob (markup #:natural))
                             acc-scale acc-scale))))
     (num (ly:stencil-scale
           (grob-interpret-markup grob
                                  (markup (number->string (abs alt-count))))
           num-scale num-scale)))
    (ly:stencil-combine-at-edge
     (ly:stencil-aligned-to acc Y CENTER) 0 1
     (ly:stencil-aligned-to num Y CENTER) 0.075)))


#(define sum-list
   ;Return the sum of the values from the list
   (lambda (lst)
     (cond
      ((null? lst) 0)
      (else (+ (car lst) (sum-list (cdr lst)))))))

#(define (get-keysig-alt-count alt-alist)
   "Return number of sharps/flats in key sig, (+) for sharps, (-) for flats."
   (if (null? alt-alist) 0
       (* 2 (sum-list
             ((lambda (ls) (map (lambda (n) (+ (cdr n)))ls))
              ;Returns the list of the second values of each pair in the list
              alt-alist)))))

#(define (draw-keysig grob context)
   "Draws LN key signature stencils."
   (let*
    ((alt-count (get-keysig-alt-count (ly:grob-property grob 'alteration-alist)))
     (head (keysig grob alt-count)))
    ;; shift the sig to the right for better spacing
    (ly:stencil-translate-axis head -0.5 X)))

#(define LN_key_signature_engraver
   (make-engraver
    (acknowledgers
     ((key-signature-interface engraver grob source-engraver)
      (let*
       ((context (ly:translator-context engraver))
        (key-sig-stil (draw-keysig grob context))
        (mult (magstep (ly:grob-property grob 'font-size 0.0))))
       (ly:grob-set-property! grob 'stencil
                              (ly:stencil-scale key-sig-stil mult mult)))))))


%-------------------------------------------------------------------------------
% Chord names - markup
%-------------------------------------------------------------------------------

#(define LN-chords
   (if (not (defined? 'LN-chords)) #t LN-chords))

#(define LN-chords-B
   (if (and (string? LN-chords) (string= LN-chords "B")) #t #f))

#(define (AltChordNames pitch lowercase?)

   (define (conditional-string-downcase str condition)
     (if condition
         (string-downcase str)
         str))

   (define (pitch-alteration-semitones pitch)
     (inexact->exact (round (* (ly:pitch-alteration pitch) 2))))

   (define (conditional-kern-before markup bool amount)
     (if bool
         (make-line-markup
          (list (make-hspace-markup amount)
                markup))
         markup))

   (define (accidental->markup alteration)
     (if (= alteration 0)
         (make-line-markup (list empty-markup))
         (conditional-kern-before
          (alteration->text-accidental-markup alteration)
          (= alteration FLAT) 0 )))

   (let* ((name (ly:pitch-notename pitch))
          (alt-semitones  (pitch-alteration-semitones pitch))
          (n-a (if (member (cons name alt-semitones) `((6 . -1) (6 . -2)))
                   (cons 7 (+ alt-semitones))
                   (cons name alt-semitones))))
     (make-line-markup
      (list
       (make-simple-markup
        (conditional-string-downcase
         (if LN-chords-B
             (vector-ref #("C" "D" "E" "F" "G" "A" "B" "B") (car n-a))
             (vector-ref #("C" "D" "E" "F" "G" "A" "H" "B") (car n-a)))
         lowercase?))
       (make-fontsize-markup -2.5
                             (make-raise-markup 0.2
                                                (accidental->markup (/ (cdr n-a) 2))))))))

customChordSymbols = {
  <c g> -\markup { \super "5" }
  <c e g a d'> -\markup { \super "6/9" }
}

chExceptions = #( append
                  ( sequential-music-to-chord-exceptions customChordSymbols #t)
                  ignatzekExceptions)

LNchords = {
  \set chordRootNamer = #AltChordNames

  \set chordNameExceptions = #chExceptions
  \set additionalPitchPrefix = "add"
}

#(if (not LN-chords) (set! LNchords null-function))

%-------------------------------------------------------------------------------
% Fingering
%-------------------------------------------------------------------------------

#(define fingering
   (if (not (defined? 'fingering)) "default" fingering))

fUp = {
  \set fingeringOrientations = #'(up)
  \set stringNumberOrientations = #'(up)
}

"f-up" = \fUp

fDown = {
  \set fingeringOrientations = #'(down)
  \set stringNumberOrientations = #'(down)
}

"f-down" = \fDown

fLeft = {
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(left)
}

"f-left" = \fLeft

fRight = {
  \set fingeringOrientations = #'(right)
  \set stringNumberOrientations = #'(right)
}

"f-right" = \fRight


default-fingering = {
  \revert Staff.StringNumber.stencil
  \revert Staff.Fingering.stencil
  \override Staff.Fingering.font-name = #"Century Schoolbook L"
  \override Staff.StringNumber.font-name = #"Century Schoolbook L"
  \override Staff.Fingering.font-size = -4
  \override Staff.StringNumber.font-size = -4.5
  \override Staff.StringNumber.stencil = #(make-stencil-circler 0.08 0.1 ly:text-interface::print)
  \override Staff.Fingering.whiteout = ##t
  \override Staff.StringNumber.whiteout = ##t
  \unset fingeringOrientations
  \unset stringNumberOrientations
}

LN-fingering = {
  \override Staff.Fingering.font-name = #"Century Schoolbook L"
  \override Staff.StringNumber.font-name = #"Century Schoolbook L"
  \override Staff.StringNumber.stencil = #ly:text-interface::print
  \override Staff.StringNumber.font-size = -4
  %\override Staff.Fingering.stencil = #(make-stencil-circler 0.08 0.1 ly:text-interface::print)
  \override Staff.Fingering.font-size = -4
  \override Staff.Fingering.whiteout = ##t
  \override Staff.StringNumber.whiteout = ##t
  \set Score.fingeringOrientations = #'(left)
  \set Score.stringNumberOrientations = #'(left)
}


"fingeringExtent" = #(define-music-function (x1 x2) (number? number?)
                       #{ \once \override Staff.StringNumber.X-extent = #(cons x1 (+ x2 0.05)) #})

fEx = #fingeringExtent

"defaultFingeringExtent" = #(define-music-function (x1 x2) (number? number?)
                              #{ \once \override Staff.Fingering.X-extent = #(cons x1 (+ x2 0.05)) #})

dfEx = #defaultFingeringExtent

fExArp = #(define-music-function (x) (number?)
            (if fingering #{ \once \override Staff.Arpeggio.X-extent = #(cons 0 x) #}))

#(if TN (set! fExArp null-function-n))
% % not relevant any more
% % LN-fingering custom extents
% % default settings is for LN-fingering (fingering and string-numbers inverted)
% % to use these shortcuts with default-fingering,
% % use the function invert-fingering-extender
%
% invert-fingering-extender =
% #(define-void-function () ()
%    (define temp-var-switch fEx)
%    (set! fEx dfEx)
%    (set! dfEx temp-var-switch)
%    )
%

%-------------------------------------------------------------------------------

fX = #(define-music-function (xoff) (number?)
        #{ \once \override StringNumber.extra-offset = #(cons xoff 0)
           \once \override Fingering.extra-offset = #(cons xoff 0) #})

fY = #(define-music-function (yoff) (number?)
        #{ \once \override StringNumber.extra-offset = #(cons 0 yoff)
           \once \override Fingering.extra-offset = #(cons 0 yoff) #})

fXY = #(define-music-function (x y) (number? number?)
         #{ \once \override StringNumber.extra-offset = #(cons x y)
            \once \override Fingering.extra-offset = #(cons x y)
         #})

setFX = #(define-music-function (xoff) (number?)
           #{ \override StringNumber.extra-offset = #(cons xoff 0)
              \override Fingering.extra-offset = #(cons xoff 0) #})

setFY = #(define-music-function (yoff) (number?)
           #{ \override StringNumber.extra-offset = #(cons 0 yoff)
              \override Fingering.extra-offset = #(cons 0 yoff) #})

setFXY = #(define-music-function (x y) (number? number?)
            #{ \override StringNumber.extra-offset = #(cons x y)
               \override Fingering.extra-offset = #(cons x y)
            #})

%-------------------------------------------------------------------------------

print-finger = #(define-music-function (fin) (string?)
                  #{ -\tweak Fingering.stencil #ly:text-interface::print
                     \finger \markup \override #'(font-name . "Century Schoolbook L") \override #'(font-size . -4.5) $fin #})

print-circled-finger =
#(define-music-function (fin) (string?)
   #{ -\tweak Fingering.stencil #(make-stencil-circler 0.08 0.1 ly:text-interface::print)
      \finger \markup \override #'(font-name . "Century Schoolbook L") \override #'(font-size . -4.5) $fin #})

print-markup-finger =
#(define-music-function (fin) (string?)
   #{-\tweak whiteout ##t -\tweak color #(x11-color "grey1")
     -\markup \finger \override #'(font-name . "Century Schoolbook L") \override #'(font-size . -4) $fin #})

print-circled-markup-finger =
#(define-music-function (fin) (string?)
   #{-\tweak whiteout ##t -\tweak color #(x11-color "grey1")
     -\tweak TextScript.stencil #(make-stencil-circler 0.08 0.1 ly:text-interface::print)
     -\markup \finger \override #'(font-name . "Century Schoolbook L") \override #'(font-size . -4.5) $fin #})


fC = #(define-music-function (fin) (number?)
        (set! fin (number->string fin))
        #{\print-circled-finger #fin #})

C = {
  \once {
    \override Fingering.font-name = #"Century Schoolbook L"
    \override StringNumber.font-name = #"Century Schoolbook L"
    \override Fingering.font-size = -4
    \override StringNumber.font-size = -4.5
    \override StringNumber.stencil = #(make-stencil-circler 0.08 0.1 ly:text-interface::print)
  }
}

mF = #(define-music-function (fin) (string?)
        #{\print-markup-finger $fin #})

mFC = #(define-music-function (fin) (string?)
         #{\print-circled-markup-finger $fin #})

% FM = #(define-music-function (x y fin) (number? number? string?)
%         #{\override TextScript.outside-staff-priority = ##f
%           \once \override TextScript.extra-offset = #(cons (- x 0.06)y)
%           % \once \override TextScript.X-offset = x
%           \once \override Score.GraceSpacing.spacing-increment = #0
%           \grace s -\markup {
%             \finger \override #'(font-name . "Century Schoolbook L")
%             \override #'(font-size . -4) $fin
%         }#})

FXY = #(define-music-function (x y fin) (number? number? string?)
         #{-\tweak extra-offset #(cons x y) \finger $fin #})

FX = #(define-music-function (x fin) (number? string?)
        #{-\tweak extra-offset #(cons x 0) \finger $fin #})

FY = #(define-music-function (y fin) (number? string?)
        #{-\tweak extra-offset #(cons 0 y) \finger $fin #})

FCXY = #(define-music-function (x y fin) (number? number? string?)
          #{-\tweak extra-offset #(cons x y) \print-circled-finger $fin #})


dampLine =
#(define-music-function (offset fing ) (number? number?)
   (define damp-finger fing)
   ;(define fing-number (string->number fing) )
   (if (>= fing 0)
       (begin
        (set! fing (number->string fing))
        (if (string= fing "0") (set! fing ""))
        (set! damp-finger #{
          \markup {
            \override #'(font-size . -5)  "❊" % \musicglyph "pedal.*"
            \hspace #-2.7 \raise #0.2 \finger \override #'(font-name . "Century Schoolbook L")
            \override #'(font-size . -4)  $fing
              } #}))
       (begin
        (set! fing (abs fing) )
        (set! fing (number->string fing))
        (set! damp-finger #{
          \markup {
            \override #'(font-size . -5)  "❊" % \musicglyph "pedal.*"
            \hspace #-3.2 \raise #0.35 \finger \override #'(thickness . 0.65) \circle \override #'(font-name . "Century Schoolbook L")
            \override #'(font-size . -4.5)  $fing
              } #})))
   #{
     \override TextSpanner.style = #'solid
     \override TextSpanner.color = #(x11-color "grey1")
     \override TextSpanner.thickness = 0.5
     %\override TextSpanner.style = #'dashed-line
     %\override TextSpanner.dash-fraction = 0.4
     %\override TextSpanner.dash-period = 1
     \override TextSpanner.bound-details.right.padding = 2
     \override TextSpanner.bound-details.left.padding = 1
     \override TextSpanner.bound-details.right.text = $damp-finger
     \override TextSpanner.after-line-breaking =
     #ly:spanner::kill-zero-spanned-time
     \once \override TextSpanner.extra-offset = #'(0 . 2)
     \once \override TextSpanner.outside-staff-priority = ##f
     %\once \override TextSpanner.Y-offset = #(- offset 10)
     \once \override TextSpanner.staff-padding = #(+ offset 2)
     \textSpannerDown
     <>\startTextSpan
   #})

damp = \stopTextSpan

%dStart = \startTextSpan
%dStop = \stopTextSpan


#(if (or (not fingering) (and (string? fingering) TN))
     (begin
      (set! mF null-function-s-markup)
      (set! mFC null-function-s-markup)
      (set! dampLine null-function-n-n)
      (set! damp null-function)))

%-------------------------------------------------------------------------------
% Laissez Vibrer
%-------------------------------------------------------------------------------

#(define ((alter-lv-tie-curve offsets) grob)
   (let ((coords (ly:semi-tie::calc-control-points grob)))

     (define (add-offsets coords offsets)
       (if (null? coords)
           '()
           (cons
            (cons (+ (caar coords) (car offsets))
                  (+ (cdar coords) (cadr offsets)))
            (add-offsets (cdr coords) (cddr offsets)))))

     (add-offsets coords offsets)))

shapeLv = #(define-music-function (offsets) (list?)
             #{
               \once \override LaissezVibrerTie.control-points =
               #(alter-lv-tie-curve offsets)
             #})

% \relative c' { \shapeLv #'(0 0 0.75 -0.7 2.25 -0.7 3 0) e2\laissezVibrer }

setLaissezVibrerTie = {
  \override LaissezVibrerTie.details =
  #'((ratio . 10) (height-limit . 0.4) (tip-staff-line-clearance . 0)
                  )
  \override LaissezVibrerTie.extra-offset = #'(0.1 . 0)
}

% setLv = {
%      \override Score.LaissezVibrerTie.details =
%  #'((ratio . 10) (height-limit . 0.4) (tip-staff-line-clearance . 0)
% )
%   \override Score.LaissezVibrerTie.control-points =
%   #(lambda (grob)
%      (if (= UP (ly:grob-property grob 'direction))
%          ((alter-lv-tie-curve '(0.05 0 0.05 0.2   0.5 0.2 0.5 0)) grob)
%          ((alter-lv-tie-curve '(0.05 0 0.05 -0.2   0.5 -0.2 0.5 0)) grob)))
%
% }



#(define (enlarged-extent-laissez-vibrer::print grob)
   (let* ((stil (ly:tie::print grob))
          (stil-ext (ly:stencil-extent stil X))
          (stil-length (interval-length stil-ext))
          (new-stil-length 1.5)
          (scale-factor (/ new-stil-length stil-length))
          (new-stil (ly:stencil-scale stil scale-factor 1))
          (new-stil-ext (ly:stencil-extent new-stil X))
          (x-corr (- (car stil-ext) (car new-stil-ext))))
     (ly:stencil-translate-axis
      new-stil
      x-corr
      X)))

#(assoc-set! (assoc-ref all-grob-descriptions 'LaissezVibrerTie)
             'stencil enlarged-extent-laissez-vibrer::print)

LvOn = {
  \once \override Staff.SustainPedal.stencil =
  #(lambda (grob) (grob-interpret-markup grob (markup #{\markup \override #'(font-name . "Bickham Script Pro Semibold")
                                                        \fontsize #5 \italic "Lv."#})))
  <>-\tweak X-offset #-1 \sustainOn
}

LvOff = { <> -\tweak X-offset #-0.2 \sustainOff }

LvOffOn = {
  \once \override Staff.SustainPedal.stencil =
  #(lambda (grob) (grob-interpret-markup grob (markup  #{\markup {
    \musicglyph "pedal.*" \override #'(font-name . "Bickham Script Pro Semibold")
    \fontsize #5 {\hspace #-0.4 \italic "Lv."}
                                                       }#})))
  <>  \sustainOff -\tweak X-offset #-0.2 \sustainOn
}

%LV = \LvOn

Lv = \laissezVibrer

LvUp = \override LaissezVibrerTie.direction = #UP
"Lv-up" = \LvUp

LvDown = \override LaissezVibrerTie.direction = #DOWN
"Lv-down" = \LvDown

LvCenter = \override LaissezVibrerTie.direction = #CENTER
"Lv-center" = \LvCenter

LvX = #(define-music-function (x) (number?)
         #{ \once \override LaissezVibrerTie.extra-offset = #(cons (+ x 0.1) 0) #})

LvY = #(define-music-function (y) (number?)
         #{ \once \override LaissezVibrerTie.extra-offset = #(cons 0.1 y) #})

setLvY = #(define-music-function (y) (number?)
            #{ \override LaissezVibrerTie.extra-offset = #(cons 0.1 y) #})

LvXY = #(define-music-function (x y) (number? number?)
          #{ \once \override LaissezVibrerTie.extra-offset = #(cons (+ x 0.1) y) #})

resetLv = \revert LaissezVibrerTie.extra-offset


tn-LvX = #null-function-n
tn-LvY = #null-function-n
tn-setLvY = #null-function-n
tn-LvXY = #null-function-n-n

#(if TN
     (begin
      (set! tn-LvX LvX)
      (set! tn-LvY LvY)
      (set! tn-setLvY setLvY)
      (set! tn-LvXY LvXY)
      (set! LvX null-function-n)
      (set! LvY null-function-n)
      (set! setLvY null-function-n)
      (set! LvXY null-function-n-n)
      ))

dotExtOn = #(if TN #{\override Dots.Y-extent = #'(-1 . 1)#}
                #{\override Dots.Y-extent = #'(-2 . 2)#})

tn-dotExtOn = #(if TN #{\override Dots.Y-extent = #'(-2 . 2)#})

dotExtOff = \revert Dots.Y-extent

tn-dotExtOff = #(if TN #{\revert Dots.Y-extent#})



%-------------------------------------------------------------------------------
% Custom Repeat Barlines
%-------------------------------------------------------------------------------

%#(if (not TN)
#(define ((make-custom-dot-bar-line dot-positions) grob extent)

   "Draw dots (repeat sign dots) at @var{dot-positions}. The
coordinates of @var{dot-positions} are equivalent to the
coordinates of @code{StaffSymbol.line-positions}, a dot-position
of X and a line-position of X indicate the same vertical position."

   (let* ((staff-space (ly:staff-symbol-staff-space grob))
          (dot (ly:font-get-glyph (ly:grob-default-font grob) "dots.dot"))
          (stencil empty-stencil))
     (for-each
      (lambda (dp)
        (set! stencil (ly:stencil-add stencil
                                      (ly:stencil-translate-axis dot (* dp (/ staff-space 2)) Y))))
      dot-positions)
     stencil))
%    )

%#(if (not TN)
#(define (select-dot-bar-line-procedure grob extent)
   "Based on a staff's line-positions, return a procedure for repeat sign dots."
   (if (equal?
        (ly:grob-property (ly:grob-object grob 'staff-symbol) 'line-positions '())
        '(-4 -2 0 2 4))
       ;; Traditional five line staff
       ((make-custom-dot-bar-line '(-1 1)) grob extent)
       ;; Clairnote staff
       ((make-custom-dot-bar-line '(-1.6 1.6)) grob extent)))
%     )

#(if LN
     (add-bar-glyph-print-procedure ":" select-dot-bar-line-procedure)
     )


%===============================================================================
% CHROMATIC-LYRE-NOTATION (LN) STAFF DEFINITION
%===============================================================================

%-------------------------------------------------------------------------------
% Staff Styles LN
%-------------------------------------------------------------------------------

showClef = { \set Staff.forceClef = ##t }

"staffY-offsetUp" = {
  \override  Staff.StaffSymbol.Y-offset = 4.90000028
  % the value 4.90000028 fixes wrong stem direction of b-note in upper position
  % - the reason must be some inaccuracy connected to vertScaleStaff #1.40000008
  % ( 1.4 * 7/2 = 4.9)
  % maybe it can be fixed better than that...
  \override Staff.TimeSignature.Y-offset = 4.9
  \override Staff.Rest.extra-offset =  #'(0 . 6)
  \override Staff.MultiMeasureRest.Y-offset = 4.9
  \override Staff.BarLine.Y-offset = 4.9
  \override Staff.Stem.Y-offset = 4.9
  \override Staff.Flag.extra-offset =  #'(0 . 6)
  \override Staff.Tie.Y-offset = 4.9
  \override Staff.LedgerLineSpanner.Y-offset = 4.9

  %   \override Staff.TimeSignature.before-line-breaking =
  %   #(lambda (grob) (set! (ly:grob-property grob 'Y-offset) 4.9))
}

"staffY-offsetDown" = {
  \override Staff.StaffSymbol.Y-offset = -4.9
  \override Staff.TimeSignature.Y-offset = -4.9
  \override Staff.Rest.extra-offset =  #'(0 . -6)
  \override Staff.MultiMeasureRest.Y-offset = -4.9
  \override Staff.BarLine.Y-offset = -4.9
  \override Staff.Stem.Y-offset = -4.9
  \override Staff.Flag.extra-offset =  #'(0 . -6)
  \override Staff.Tie.Y-offset = -4.9
  \override Staff.LedgerLineSpanner.Y-offset = -4.9
}

"resetStaffY-offset" = {
  \revert Staff.StaffSymbol.Y-offset
  \revert Staff.TimeSignature.Y-offset
  \revert Staff.Rest.extra-offset
  \revert Staff.MultiMeasureRest.Y-offset
  \revert Staff.BarLine.Y-offset
  \revert Staff.Stem.Y-offset
  \revert Staff.Flag.extra-offset
  \revert Staff.Tie.Y-offset
  \revert Staff.LedgerLineSpanner.Y-offset
}


staff-II = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-8 -4    4 8)
  \resetStaffY-offset
}

staff-II-up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(4 8  16 20)
  \resetStaffY-offset
}

staff-II-down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-20 -16  -8 -4)
  \resetStaffY-offset
}

staff-III-up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-8 -4   4 8   16 20)
  \resetStaffY-offset
}

staff-III-Up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-20 -16   -8 -4   4 8)
  \staffY-offsetUp
}

staff-III-down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-20 -16  -8 -4   4 8)
  \resetStaffY-offset
}

staff-III-Down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-8 -4   4 8   16 20)
  \staffY-offsetDown
}


staff-IV = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-20 -16  -8 -4   4 8  16 20)
  \resetStaffY-offset
}

staff-IV-up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-8 -4   4 8  16 20   28 32)
  \resetStaffY-offset
}

staff-IV-Up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-32 -28  -20 -16  -8 -4  4 8)
  \staffY-offsetUp
}

staff-IV-down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-32 -28  -20 -16 -8 -4   4 8)
  \resetStaffY-offset
}

staff-IV-Down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-8 -4   4 8   16 20   28 32)
  \staffY-offsetDown
}

staff-V-up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-20 -16 -8 -4 4 8 16 20 28 32)
  \resetStaffY-offset
}

staff-V-down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-32 -28 -20 -16 -8 -4 4 8 16 20)
  \resetStaffY-offset
}

staff-VI = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-32 -28 -20 -16 -8 -4 4 8 16 20 28 32)
  \resetStaffY-offset
}

%  Staff styles with 3-octave staff's center (F#/Gb):
%
% "staff-EII-up" = {
%   \stopStaff \startStaff
%   \override Staff.StaffSymbol.line-positions = #'(-2 2    10  14)
%   \override Staff.StaffSymbol.ledger-positions = #'(2 6)
% }
%
% "staff-EII-down" = {
%   \stopStaff \startStaff
%   \override Staff.StaffSymbol.line-positions = #'(-14 -10   -2 2)
%   \override Staff.StaffSymbol.ledger-positions = #'(2 6)
% }
%
% "staff-EIII" = {
%   \stopStaff \startStaff
%   \override Staff.StaffSymbol.line-positions =
%   #'(-14 -10   -2 2    10  14)
%   \override Staff.StaffSymbol.ledger-positions = #'(2 6)
% }
%
% "staff-EIV-up" = {
%   \stopStaff \startStaff
%   \override Staff.StaffSymbol.line-positions =
%   #'(-14 -10   -2 2    10  14   22 26)
%   \override Staff.StaffSymbol.ledger-positions = #'(2 6)
% }
%
% "staff-EIV-down" = {
%   \stopStaff \startStaff
%   \override Staff.StaffSymbol.line-positions =
%   #'(-26 -22 -14 -10   -2 2    10  14)
%   \override Staff.StaffSymbol.ledger-positions = #'(2 6)
% }
%

%-------------------------------------------------------------------------------
% Staff Styles TN
%-------------------------------------------------------------------------------

tn-staff-I = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-4 -2 0 2 4)
  \revert Staff.StaffSymbol.ledger-extra
  \revert Staff.StaffSymbol.ledger-positions
}

tn-staff-II = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions = #'(-10 -8 -6 -4 -2   2 4 6 8 10)
  \revert Staff.StaffSymbol.ledger-extra
  \revert Staff.StaffSymbol.ledger-positions
  \clef alto
}

tn-staff-III-up = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions =
  #'(   -10 -8 -6 -4 -2   2 4 6 8 10   16 18 20 22 24)
  \override Staff.StaffSymbol.ledger-extra = 2
  \override Staff.StaffSymbol.ledger-positions = #'( -24 -22 -20 -18  -16 -14 -12   0  12 14 26 28 30 32  )
  \clef alto
}

tn-staff-III-down = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions =
  #'( -24 -22 -20 -18 -16 -10 -8 -6 -4 -2  2 4 6 8 10 )
  \override Staff.StaffSymbol.ledger-extra = 2
  \override Staff.StaffSymbol.ledger-positions = #'(  -32 -30 -28 -26 -14 -12  0 12 14 16 18 20 22 24  )
  \clef alto
}

tn-staff-IV = {
  \stopStaff \startStaff
  \override Staff.StaffSymbol.line-positions =
  #'(-24 -22 -20 -18 -16   -10 -8 -6 -4 -2   2 4 6 8 10   16 18 20 22 24)
  \override Staff.StaffSymbol.ledger-extra = 2
  \override Staff.StaffSymbol.ledger-positions = #'(  -32 -30 -28 -26 -14 -12   0  12 14 26 28 30 32  )
  \clef alto
}

#(if (eq? TN #t)
     (begin
      (set! staff-II tn-staff-I)
      (set! staff-II-up tn-staff-I)
      (set! staff-II-down tn-staff-I)
      (set! staff-IV tn-staff-II)
      (set! staff-III-up tn-staff-II)
      (set! staff-III-Up tn-staff-II)
      (set! staff-III-down tn-staff-II)
      (set! staff-III-Down tn-staff-II)
      (set! staff-IV-up tn-staff-III-up)
      (set! staff-IV-Up tn-staff-III-up)
      (set! staff-IV-down tn-staff-III-down)
      (set! staff-IV-Down tn-staff-III-down)
      (set! staff-V-up tn-staff-III-up)
      (set! staff-V-down tn-staff-III-down)
      (set! staff-VI tn-staff-IV)
      )
     (begin
      (set! tn-staff-I null-function)
      (set! tn-staff-II null-function)
      (set! tn-staff-III-up null-function)
      (set! tn-staff-III-down null-function)
      (set! tn-staff-IV null-function)
      )
     )


%-------------------------------------------------------------------------------
% Harmonics
%-------------------------------------------------------------------------------

#(define (LN-harmonic grob)
   "Black and white harmonic note heads"
   (let* ((dur-log (ly:grob-property grob 'duration-log))
          (semi (modulo (LN-notehead-semitone grob) 12)))
     (if TN
         (if (< dur-log 2) ;; TN - minim and longer
             (ly:grob-set-property! grob 'style 'harmonic )
             (ly:grob-set-property! grob 'style 'harmonic-black ))
         ; (if (member semi (list 0 2 4 6 8 10)) ;; LN - white note heads
         ;   (begin
         ;   (ly:grob-set-property! grob 'style 'harmonic )
         (begin
          (if (member semi (list 0 2 4 6 8 10)) ;; LN - white note heads
              (ly:grob-set-property! grob 'style 'harmonic )
              (ly:grob-set-property! grob 'style 'harmonic-black ))
          (cond
           (( = dur-log 0) ;; LN semibreve
                           (ly:grob-set-property! grob 'stencil
                                                  (ly:stencil-add (ly:grob-property grob 'stencil)
                                                                  (ly:stencil-scale
                                                                   (ly:stencil-translate bracketSemiBreve (cons 0 -0.563)) 0.8 1 ))))
           ((< dur-log 0) ;; LN breve
                          (ly:grob-set-property! grob 'stencil
                                                 (ly:stencil-add (ly:grob-property grob 'stencil)
                                                                 (ly:stencil-scale
                                                                  (ly:stencil-translate bracketBreve (cons 0 -0.563)) 0.8 1 )))))))))

arm = {
  \once \override NoteHead.before-line-breaking = #LN-harmonic
}

harmonicNote = #arm  % standard Lilypond command

harmonicsOn = {
  \override NoteHead.before-line-breaking = #LN-harmonic
}

harmonicsOff = {
  \revert NoteHead.before-line-breaking
}

% armB = {
%   \once \override NoteHead.before-line-breaking = ##t
%   \once \override NoteHead.style = #'harmonic-black
% } % harmonic - black note head
%
% armW = {
%   \once \override NoteHead.before-line-breaking = ##t
%   \once \override NoteHead.style = #'harmonic
% } % harmonic - white note head

% "testNH" = {
%   \once \override NoteHead.before-line-breaking = ##t
%   \once \override NoteHead.stencil = \minimWhiteFlat
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------
% Custom commands for easier input
%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Clef change position after the barline
alignClef = {
  \override Score.BreakAlignment.break-align-orders =
  #(
     make-vector 3 '(
                      left-edge
                      span-bar
                      breathing-sign
                      staff-bar
                      clef
                      key-cancellation
                      key-signature
                      time-signature
                      ))
}

alignClefOff = {
  \revert Score.BreakAlignment.break-align-orders
}

spanBarEnd = \override Score.SpanBar.break-visibility = #end-of-line-visible

spanBarDefault = {
  \revert Score.SpanBar.break-visibility
  \revert Score.BarLine.allow-span-bar
}

"nospanbar" = {\override Score.BarLine.allow-span-bar = ##f}
% removes barlines spanning through staves

"spanbar" = {\override Score.BarLine.allow-span-bar = ##t}

spanBarOn = #spanbar
spanBarOff = #nospanbar

sbreak = {\break \once \override Score.BarLine.allow-span-bar = ##t}
% break staff with span-barline - can be used instead of \break
% (temporarily disables "nospanbar" setting at \break)


hideTie = {\once \omit Tie}

hideNH = {
  \once \override NoteHead.transparent = ##t
  \once \override NoteHead.no-ledgers = ##t
}
% hides the note head and the ledger line

hideN = {\once \hideNotes \once \omit Stem}

shiftN = #(define-music-function (x) (number?)
            #{ \once \override NoteColumn.X-offset = #x #})

shiftL = #(if TN #{ \null-function #} #{\once \override NoteColumn.X-offset = -0.15 #})

shiftR = #(if TN #{ \null-function #} #{\once \override NoteColumn.X-offset = 0.15 #})

%-------------------------------------------------------------------------------
% Ties and Slurs
%-------------------------------------------------------------------------------

tieY = #(define-music-function (y) (number?)
          #{ \once \override Tie.extra-offset = #(cons 0 y) #})

tieXY = #(define-music-function (x y) (number? number?)
           #{ \once \override Tie.extra-offset = #(cons x y) #})

tiePos =
#(define-music-function (add-y) (number?)
   #{ \once \override Tie.staff-position =
      #(lambda (grob)
         (+ (ly:grob-staff-position (ly:grob-parent grob X)) add-y)) #})

setTiePos =
#(define-music-function (add-y) (number?)
   #{ \override Tie.staff-position =
      #(lambda (grob)
         (+ (ly:grob-staff-position (ly:grob-parent grob X)) add-y)) #})

resetTiePos = \revert Tie.staff-position

% #(define (change-tie-position add-y)
%    "Adjusts vertical staff-position of a tie"
%    (lambda (grob)
%      (let* ((staff-pos (ly:grob-staff-position (ly:grob-parent grob X)))
%             (new-pos (+ staff-pos add-y))            )
%        (ly:grob-set-property! grob 'staff-position new-pos))))
%
% tiePos = #(define-music-function (add-y) (number?)
%             #{ \once \override Tie.before-line-breaking = #(change-tie-position add-y) #})
%
% setTiePos = #(define-music-function (add-y) (number?)
%             #{ \override Tie.before-line-breaking = #(change-tie-position add-y) #})
%
% resetTiePos = \revert Tie.before-line-breaking

slurHeight = #(define-music-function (h) (number?)
                #{ \once \override Slur.height-limit = #h #})

phrasingSlurHeight = #(define-music-function (h) (number?)
                        #{ \once \override PhrasingSlur.height-limit = #h #})

slurY = #(define-music-function (y) (number?)
           #{ \once \override Slur.extra-offset = #(cons 0 y) #})

slurXY = #(define-music-function (x y) (number? number?)
            #{ \once \override Slur.extra-offset = #(cons x y) #})

%-------------------------------------------------------------------------------

% setSlurPos =
% #(define-music-function (y1 y2) (number? number?)
%    #{ \override Score.Slur.after-line-breaking =
%       #(lambda (grob)
%          (let ((cpf (ly:grob-property-data grob 'control-points))
%                (cps (ly:grob-property grob 'control-points)))
%            (ly:grob-set-property! grob 'positions
%                                    (cons
%                                    (+ y1 (cdr (first cps)))
%                                    (+ y2 (cdr (last cps)))))
%            (ly:grob-set-property! grob 'control-points
%                                  (ly:unpure-call cpf grob))))
%    #})

%%
%%   Current version of slurPos (and it's alternatives) causes cyclic dependency
%%   errors (and warnings in Lilypond 2.24) yet compiles fine with expected results.
%%   New version (see "setSlurPos" above, disabled) resolves the errors but sometimes
%%   causes problems and ignores new offsets (e.g. when combined with \tempo).
%%   Until a better solution comes up, the cyclic dependency is simply ignored
%%   and warnings surpressed.
%%

setSlurPos =
#(define-music-function (y1 y2) (number? number?)
   ; (for-each (lambda (x) (ly:expect-warning "cyclic dependency")) (iota 2))
   #{ \override Slur.positions =
      #(lambda (grob)
         (for-each (lambda (x) (ly:expect-warning "cyclic dependency")) (iota 2))
         (cons
          (+ y1 (cdr (first (ly:slur::calc-control-points grob))))
          (+ y2 (cdr (last (ly:slur::calc-control-points grob))))))
   #})

resetSlurPos = \revert Slur.positions

setPhrasingSlurPos =
#(define-music-function (y1 y2) (number? number?)
   #{ \override PhrasingSlur.positions =
      #(lambda (grob)
         (for-each (lambda (x) (ly:expect-warning "cyclic dependency")) (iota 2))
         (cons
          (+ y1 (cdr (first (ly:slur::calc-control-points grob))))
          (+ y2 (cdr (last (ly:slur::calc-control-points grob))))))
   #})

resetPhrasingSlurPos = \revert PhrasingSlur.positions

slurPos = #(define-music-function (y1 y2) (number? number?)
             #{ \once \setSlurPos #y1 #y2 #})

phrasingSlurPos = #(define-music-function (y1 y2) (number? number?)
                     #{ \once \setPhrasingSlurPos #y1 #y2 #})


%-------------------------------------------------------------------------------


mXY = #(define-music-function (x y) (number? number?)
         #{\once \override TextScript.outside-staff-priority = ##f
           \once \override TextScript.extra-offset = #(cons (- x 0.06)y)
         #})

scriptY = #(define-music-function (y) (number?)
             #{ \once \override Script.extra-offset = #(cons 0 y) #})

sY = #scriptY

tn-hideN = #hideN
tn-hideNH = #hideNH
tn-shiftN = #shiftN
tn-slurPos = #slurPos
tn-mXY = #mXY
tn-scriptY = #scriptY
tn-sY = #scriptY

#(if TN
     (begin
      (set! hideN null-function)
      (set! hideNH null-function)
      (set! shiftN null-function-n)
      (set! slurPos null-function-n-n)
      (set! mXY null-function-n-n)
      (set! scriptY null-function-n)
      (set! sY null-function-n)
      )
     (begin
      (set! tn-hideN null-function)
      (set! tn-hideNH null-function)
      (set! tn-shiftN null-function-n)
      (set! tn-slurPos null-function-n-n)
      (set! tn-mXY null-function-n-n)
      (set! tn-scriptY null-function-n)
      (set! tn-sY null-function-n)
      )
     )

% sY = #(define-music-function (y) (number?)
%         #{ \once \override Script.Y-offset = #y #})

drawLine = #(define-music-function (x y) (number? number?)
              #{ -\markup \draw-line #(cons x y) #})

drawDashedLine = #(define-music-function (x y) (number? number?)
                    #{ -\markup \draw-dashed-line #(cons x y) #})

%"centerNC" = \onceCenterNoteColumn #0
% Center following note column (adjust the number for X offset)

"dotDown" = { \once \override Dots.extra-offset = #'( 0 . -0.5) }
"dotUp" = { \once \override Dots.extra-offset = #'( 0 . 0.5) }
dotXY = #(define-music-function (x y) (number? number?)
           #{ \once \override Dots.extra-offset = #(cons x y) #})

tn-dotXY = #dotXY

#(if TN
     (begin
      (set! dotDown null-function)
      (set! dotUp null-function)
      (set! dotXY null-function-n-n)
      )
     (begin
      (set! tn-dotXY null-function-n-n)
      )
     )


stemL = #(define-music-function (l) (number?)
           #{ \once \override Stem.length-fraction = #(magstep l) #})

tn-stemL = #stemL

%breakStem = #(define-music-function (y) (number?)
%               #{ \once \override NoteHead.Y-extent = #(cons y y) #})
% This does not work with Lilypond 2.24 (ignores stem direction)

breakStem =
#(define-music-function (x) (number?)
   #{ \once \override NoteHead.Y-extent =
      #(lambda (grob)
         (if (= UP (ly:grob-property (ly:grob-object (ly:grob-parent grob X) 'stem) 'direction))
             (cons x x) (cons (- x) (- x))))
      %flip values according to stem direction
   #})

tn-breakStem = #breakStem

beamPos = #(define-music-function (y1 y2) (number? number?)
             #{ \once \override Beam.positions = #(cons y1 y2) #})

tn-beamPos = #beamPos

hideTuplet =  { \once \hide TupletBracket \once \hide TupletNumber }

tupletPos = #(define-music-function (y) (number?)
               #{ \once \override TupletBracket.staff-padding = ##f
                  \once \override TupletBracket.padding = #y #})

tupletY = #(define-music-function (y) (number?)
             #{ \once \override TupletBracket.extra-offset = #(cons 0 y)
                \once \override TupletNumber.extra-offset = #(cons 0 y) #})

#(if TN
     (begin
      (set! stemL null-function-n)
      (set! breakStem null-function-n)
      (set! tupletPos null-function-n)
      (set! tupletY null-function-n)
      (set! beamPos null-function-n-n)
      )
     (begin
      (set! tn-stemL null-function-n)
      (set! tn-breakStem null-function-n)
      (set! tn-beamPos null-function-n-n)
      )
     )


ignoreCollision = \override Staff.NoteColumn.ignore-collision = ##t
ignoreCollisionOff = \override Staff.NoteColumn.ignore-collision = ##f


staffPadding =
#(define-music-function (r u) (number? number?)
   #{ \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #r
      \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing.padding = #u
      %\override VerticalAxisGroup.staff-affinity = #CENTER
   #})

staffDistance =
#(define-music-function (d) (number?)
   #{ \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.basic-distance = #d  #})


% System Y-spacer hack:
"YspaceUp" =       {\once \override Rest.transparent = ##t \grace c''''\rest}
"YspaceUpUp" =     {\once \override Rest.transparent = ##t \grace c'''''\rest}
"YspaceDown" =     {\once \override Rest.transparent = ##t \grace c,,,,\rest}
"YspaceDownDown" = {\once \override Rest.transparent = ##t \grace c,,,,,\rest}
% Shortcuts only for temporary use
% (to do: do it properly)

%-------------------------------------------------------------------------------
% Hide note-heads after tie

% (to do: explore "no-ledgers" property which should provide a better solution
%         if "no ledgers" does not work, try something nicer about warnings
%-------------------------------------------------------------------------------

#(define (hide-note-heads-after-tie grob)
   "Hide note heads after ties"
   (let* ((tied-note-head (ly:spanner-bound grob RIGHT))
          (stem (ly:grob-object tied-note-head 'stem))
          (stem-dir (ly:grob-property-data stem 'direction))
          (note-column (ly:grob-parent tied-note-head Y))
          (dot (ly:grob-object tied-note-head 'dot))
          ;(flag (ly:grob-object stem 'flag))
          (dur-log (ly:grob-property tied-note-head 'duration-log))
          )
     (ly:grob-set-property! tied-note-head 'transparent #t)
     ; hide ledger-lines - TODO: find a better solution
     ; (ly:grob-set-property! tied-note-head 'no-ledgers #t) ; should work but does not / Lilypond bug?

     ; workaround for hiding ledger-lines by setting negative note-head extent
     ; side effect: causes warnings "Not drawing a box with negative dimension"
     ; UPDATE: causes a crash for for semibreve and longer with Lilypond 2.22
     ; temporary workaround is setting X-extent (0.5 . 0.5) but small dots are still visible as ledger lines

     (if
      (<= dur-log 0) ;; semibreve and longer
      (ly:grob-set-property! tied-note-head 'X-extent '(0.5 . 0.5)) ;temporary solution for semibreve and longer
      (ly:grob-set-property! tied-note-head 'X-extent '(0.51 . 0.5)))

     ;adjust stem extent & flag positions for wider spacing
     ;(ly:grob-set-property! stem 'X-extent '(-1 . 1))
     ;      (cond
     ;       ((ly:grob? flag)
     ;        (ly:grob-set-property! flag 'X-offset 0.2)))
     ;fix dots positions
     (cond ((ly:grob? dot)
            (ly:grob-set-property! dot 'Y-extent '(-2 . 2))
            (ly:grob-set-property! dot 'X-extent '(-1.5 . 1.5))))
     (if (eq? stem-dir -1)
         (ly:grob-set-property! note-column 'X-offset 0)
         (ly:grob-set-property! note-column 'X-offset 0.15))
     ; temporary workaround to suppress warnings until a better solution is found
     ;(ly:expect-warning (_ ""))
     ;(ly:expect-warning (_ ""))
     ;(ly:expect-warning (_ ""))
     ))

hideTiedNotes = \override Tie.before-line-breaking = #hide-note-heads-after-tie
hideLedgerLines = \once \override NoteHead.no-ledgers = ##t
hideLL = #hideLedgerLines

%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Pitched Articulations
%-------------------------------------------------------------------------------

pTrill = #(define-music-function (note trill) (ly:pitch? ly:music? )
            #{ \once \omit TrillSpanner
               \pitchedTrill $note -\trill \startTrillSpan $trill <> \stopTrillSpan #})

pMordent = #(define-music-function (note trill) (ly:pitch? ly:music? )
              #{ \once \omit TrillSpanner
                 \pitchedTrill $note -\mordent \startTrillSpan $trill <> \stopTrillSpan #})

pPrall = #(define-music-function (note trill) (ly:pitch? ly:music? )
            #{ \once \omit TrillSpanner
               \pitchedTrill $note -\prall \startTrillSpan $trill <> \stopTrillSpan #})

%-------------------------------------------------------------------------------
% MIDI functions
%-------------------------------------------------------------------------------

midiVolume = #(define-music-function (minV maxV) (number? number?)
                #{ \set Staff.midiMinimumVolume = #minV
                   \set Staff.midiMaximumVolume = #maxV #})


%-------------------------------------------------------------------------------
% Bracket (system start bracket)
%-------------------------------------------------------------------------------

%
\layout {
  \context {
    \StaffGroup
    \name Bracket
    \alias StaffGroup
    \override SystemStartBracket.style = #'bracket
    \override SystemStartBracket.thickness = #'0.3
    \override SystemStartBracket.X-offset  = #'0.2
    \override SystemStartBracket.collapse-height = 8

    % \override SystemStartBracket.stencil =
    % #YourStenciloraFunctionReturningYourStencil
    % \override SystemStartBracket.thickness = 0.45


  }
  \context { \Score       \accepts Bracket }
  \context { \ChoirStaff \accepts Bracket }
  \context { \GrandStaff \accepts Bracket }
  \context { \PianoStaff \accepts Bracket }
  \context { \StaffGroup \accepts Bracket }
}

\midi {
  \context {
    \StaffGroup
    \name Bracket
    \alias StaffGroup
  }
  \context { \Score      \accepts Bracket }
  \context { \ChoirStaff \accepts Bracket }
  \context { \GrandStaff \accepts Bracket }
  \context { \PianoStaff \accepts Bracket }
  \context { \StaffGroup \accepts Bracket }
}



%-------------------------------------------------------------------------------
% StaffGroup (for connecting more LN staves with square bracket)
%-------------------------------------------------------------------------------

%
\layout {
  \context {
    \StaffGroup
    \name StaffGroupTN
    \alias StaffGroup
  }
  \context { \Score      \accepts StaffGroupTN  }
  \context { \ChoirStaff \accepts StaffGroupTN }
  \context { \GrandStaff \accepts StaffGroupTN }
  \context { \PianoStaff \accepts StaffGroupTN }
  \context { \StaffGroup \accepts StaffGroupTN }

  \context {
    \StaffGroup
    \override SystemStartBracket.style = #'line-bracket
    \override SystemStartBracket.X-offset  = -1
    \override SystemStartBracket.collapse-height = 14
  }
}

\midi {
  \context {
    \StaffGroup
    \name StaffGroupTN
    \alias StaffGroup
  }
  \context { \Score      \accepts StaffGroupTN }
  \context { \ChoirStaff \accepts StaffGroupTN }
  \context { \GrandStaff \accepts StaffGroupTN }
  \context { \PianoStaff \accepts StaffGroupTN }
  \context { \StaffGroup \accepts StaffGroupTN }
}


%-------------------------------------------------------------------------------
% Staff Definiton (LN / TN)
%-------------------------------------------------------------------------------
%

#(define staff-definition
   (if (not TN)
       ;-----------------------------------------------------------------------------
       ;  LN - StaffTN
       ;-----------------------------------------------------------------------------
       #{
         \layout {
           % copy \Staff context with its standard settings to
           % a custom staff context called \StaffTN
           \context {
             \Staff
             \name StaffTN
             \alias Staff
             % needed for staff identification for repeat sign dots
             \override StaffSymbol.line-positions = #'(-4 -2 0 2 4)
             \override Stem.no-stem-extend = ##t
             %\staffSize 0.5

             {\set Score.restNumberThreshold = 1}
             \override MultiMeasureRest.expand-limit = 1
             \override MultiMeasureRest.thick-thickness = 5

             %\default-fingering
             \LN-fingering
             \override Fingering.color = #(x11-color "grey1")
             \override StringNumber.color = #(x11-color "grey1")

             \consists "Span_arpeggio_engraver"

             \remove \LN_key_signature_engraver
             % not working
             % - probably overriden by LN-key-signature-switch at Voice context
           }

           % allow parent contexts to accept \StaffTrad
           \context { \Score \accepts StaffTN }
           \context { \ChoirStaff \accepts StaffTN }
           \context { \GrandStaff \accepts StaffTN }
           \context { \PianoStaff \accepts StaffTN }
           \context { \StaffGroup \accepts StaffTN }

           \LNchords

           %------------------------------------------------------------------------
           %  LN - Staff
           %%-----------------------------------------------------------------------
           \context {
             \Staff

             staffLineLayoutFunction = #ly:pitch-semitones
             middleCPosition = -12
             clefPosition = -5
             \override StaffSymbol.line-positions = #'(-8 -4 4 8)
             \override StaffSymbol.ledger-positions = #'(0 4)
             \override StaffSymbol.ledger-extra = 1
             \override Stem.no-stem-extend = ##t

             % user scalable properties (eventually)
             %     \vertScaleStaff #28/20 #(* 240/161 23/20)
             % The value 28/20 (=1.4) caused some inconsistency in horizontal
             % positioning of major seconds in chords. 1.40000008 fixed that.
             \vertScaleStaff 1.40000008
             \override NoteHead.before-line-breaking = #(customNoteHeads 1 1 1)
             \override Dots.before-line-breaking = #LN-note-dots

             \override TrillPitchAccidental.stencil = ##f
             %\override TrillPitchHead.before-line-breaking =  #(customNoteHeads 1 1 1)
             %\override TrillPitchHead.stencil =  #(customNoteHeads 1 1 1)
             \override TrillPitchHead.stencil =  #(lambda (grob) ((customNoteHeads 1 1 1) grob) (ly:expect-warning (_ "")))
             \override TrillPitchHead.before-line-breaking = #LN-notehead-staff-position

             \override ClusterSpannerBeacon.before-line-breaking = #LN-cluster-position
             \override ClusterSpanner.padding = #'-0.2

             \override Flag.font-size = -1
             \override StemTremolo.before-line-breaking = #minim-stem-tremolo

             \override Rest.before-line-breaking = #(lambda (grob) ((custom-rests 0) grob))
             \override Rest.font-size = -1
             \override MultiMeasureRest.staff-position = 0
             \override MultiMeasureRest.expand-limit = 0
             \override MultiMeasureRest.thick-thickness = 5

             \numericTimeSignature
             \override TimeSignature.font-size = #-2
             \override TimeSignature.X-offset = #-0.9
             \override Clef.X-extent = #'(0 . 2.8)

             %\override Dots.Y-extent = #'(-2 . 2)
             \setLaissezVibrerTie

             %\default-fingering
             \LN-fingering
             \override Fingering.color = #(x11-color "grey1")
             \override StringNumber.color = #(x11-color "grey1")

             \override NoteColumn.ignore-collision = ##t

             \remove Accidental_engraver
             \remove Key_engraver

             % to use custom clefs:
             \consists \Custom_clef_engraver
             \clef alto

             \consists "Span_arpeggio_engraver"
             %     \mergeDifferentlyHeadedOn
             %     \mergeDifferentlyDottedOn
           }

           \override LyricText.font-size = 0
           \override ChordName.font-size = 0
           \override ChordName.baseline-skip = 4
           \LNchords
           %  \alignClef
           \expandEmptyMeasures
         }
       #}
       ;-----------------------------------------------------------------------------
       ;  TN - StaffTN
       ;-----------------------------------------------------------------------------
       #{
         \layout {
           % copy \Staff context with its standard settings to
           % a custom staff context called \StaffTN
           \context {
             \Staff
             \name StaffTN
             \alias Staff
             % needed for staff identification for repeat sign dots
             %\override StaffSymbol.line-positions = #'(-4 -2 0 2 4)

             %\staffSize 0.5

             {\set Score.restNumberThreshold = 1}
             \override MultiMeasureRest.expand-limit = 1
             \override MultiMeasureRest.thick-thickness = 5

             \consists "Span_arpeggio_engraver"
           }

           % allow parent contexts to accept \StaffTrad
           \context { \Score \accepts StaffTN }
           \context { \ChoirStaff \accepts StaffTN }
           \context { \GrandStaff \accepts StaffTN }
           \context { \PianoStaff \accepts StaffTN }
           \context { \StaffGroup \accepts StaffTN }

           \LNchords

           %------------------------------------------------------------------------
           %  TN - Staff
           %%-----------------------------------------------------------------------
           \context {
             \Staff
             \override Stem.no-stem-extend = ##t

             %\staffSize 0.5

             %\override MultiMeasureRest.staff-position = 0
             \override MultiMeasureRest.expand-limit = 1
             \override MultiMeasureRest.thick-thickness = 5

             \numericTimeSignature

             \setLaissezVibrerTie

             %\default-fingering
             \LN-fingering
             \override Fingering.color = #(x11-color "grey1")
             \override StringNumber.color = #(x11-color "grey1")

             \override NoteColumn.ignore-collision = ##t

             \consists "Span_arpeggio_engraver"

           }
           \context {
             \Voice
             \remove Fingering_engraver
             \remove New_fingering_engraver
           }

           \override LyricText.font-size = 0
           \override ChordName.font-size = 0
           \override ChordName.baseline-skip = 4
           \LNchords
           %  \alignClef
         }
       #}))


\layout {\staff-definition}

\midi {
  \context {
    \Staff
    \name StaffTN
    \alias Staff
  }
  \context { \Score       \accepts StaffTN }
  \context { \ChoirStaff  \accepts StaffTN }
  \context { \GrandStaff \accepts StaffTN }
  \context { \PianoStaff  \accepts StaffTN }
  \context { \StaffGroup \accepts StaffTN }
}

%-------------------------------------------------------------------------------
% LyreBird switches (if used, variables must be set in the LyreBird header)
%-------------------------------------------------------------------------------

#(define neutral-noteheads
   (if (not (defined? 'neutral-noteheads)) #f neutral-noteheads))

#(define neutral-noteheads-switch
   (if neutral-noteheads
       #{
         \layout {
           \context {
             \Staff
             \neutralNH-on
           }
         }
       #} #{\layout {}#}))

\layout {\neutral-noteheads-switch}

#(define LN-key-signature
   (if (not (defined? 'LN-key-signature)) #t LN-key-signature))

#(if TN (set! LN-key-signature #f))

#(define LN-key-signature-switch
   (if LN-key-signature #{
     \layout {
       \context {
         \Voice
         %\Staff
         \consists Key_engraver
         \consists \LN_key_signature_engraver
         \override KeySignature.break-visibility = #all-invisible
         \override KeyCancellation.break-visibility = #all-invisible
         \override KeySignature.X-extent = #'( 0 . 0.3 )
         explicitKeySignatureVisibility = #end-of-line-invisible
       }
     }
       #} #{\layout {}#}))

\layout {\LN-key-signature-switch}

#(define remove-empty-staves
   (if (not (defined? 'remove-empty-staves)) #f remove-empty-staves))

#(define remove-empty-staves-switch
   (if remove-empty-staves
       #{
         \layout {
           \context {
             \Staff
             \RemoveEmptyStaves
             \override VerticalAxisGroup.remove-first = ##t
           }
         }
       #} #{\layout {}#}))

\layout {\remove-empty-staves-switch}

#(define instrument-names
   (if (not (defined? 'instrument-names)) #t instrument-names))

#(define instrument-names-switch
   (if (not instrument-names)
       #{
         \layout {
           \context {
             \Staff
             \remove "Instrument_name_engraver"
           }
         }
       #} #{\layout {}#}))

\layout { \instrument-names-switch }

#(define bar-numbers
   (if (not (defined? 'bar-numbers)) #t bar-numbers))

#(define bar-numbers-switch
   (if (and (number? bar-numbers)(> bar-numbers 0))
       #{
         \layout {
           \context {
             \Score
             \override BarNumber.break-visibility = #end-of-line-invisible
             barNumberVisibility = #(every-nth-bar-number-visible bar-numbers)
           }
         }
       #}
       (if (or (not bar-numbers)(eq? bar-numbers 0))
           #{
             \layout {
               \context {
                 \Score
                 \remove "Bar_number_engraver"
               }
             }
           #}
           #{\layout {}#})))

\layout {\bar-numbers-switch}


#(define fingering-layout
   (if (boolean? fingering)
       (if (not fingering)
           #{
             \layout {
               \context {
                 \Voice
                 \remove "Fingering_engraver"
                 \remove "New_fingering_engraver"
               }
             }
           #}
           (if TN #{
             \layout {
               \context {
                 \Voice
                 \consists "Fingering_engraver"
                 \consists "New_fingering_engraver"
               }
             }
               #} ))
       #{\layout {}#} ))

\layout {\fingering-layout}

#(define hide-tied-notes
   (if (not (defined? 'hide-tied-notes)) #f hide-tied-notes))

#(define hide-tied-notes-switch
   (if hide-tied-notes
       #{
         \layout {
           \context {
             \Score
             \hideTiedNotes
           }
         }
       #} #{\layout {}#}))

\layout {\hide-tied-notes-switch}


%-------------------------------------------------------------------------------
% Header
%-------------------------------------------------------------------------------

#(if (defined? 'paper-size) (set-default-paper-size paper-size)(set-default-paper-size "a4"))

#(if (defined? 'staff-size) (set-global-staff-size staff-size))
#(if (and (defined? 'tn-staff-size) TN) (set-global-staff-size tn-staff-size))

\header {
  #(if (defined? 'title) (ly:parser-define! 'title title))
  #(if (not (defined? 'subtitle)) (ly:parser-define! 'subtitle ""))
  #(if (not (defined? 'subsubtitle)) (ly:parser-define! 'subsubtitle ""))
  #(if (not (defined? 'title-space)) (ly:parser-define! 'title-space 0))
  #(if (not (defined? 'composer)) (ly:parser-define! 'composer " "))
  #(if (not (defined? 'composerII)) (ly:parser-define! 'composerII ""))
  #(if (not (defined? 'arranger)) (ly:parser-define! 'arranger ""))
  #(if (not (defined? 'arrangerII)) (ly:parser-define! 'arrangerII ""))
  #(if (not (defined? 'poet)) (ly:parser-define! 'poet ""))
  #(if (not (defined? 'year)) (ly:parser-define! 'year ""))
  #(if (not (defined? 'opus)) (ly:parser-define! 'opus ""))
  #(if (defined? 'piece) (ly:parser-define! 'piece piece))
  #(define composer #{ \markup \override #'(baseline-skip . 2.8 )
                       \right-column  { \vspace #title-space \composer \composerII \year \arranger \arrangerII \poet \opus } #})
  #(define subtitle subtitle)
  #(define subsubtitle subsubtitle)
  #(define tagline (if (defined? 'tagline) tagline LN-tagline))
}



%   title =    ""
%   subtitle = ""
%   composer = ""
%   year =     ""
%   title-space =  2

%   paper-size = "a4"
%   staff-size = 18

%   notation = "TN"
%   (same as TN = ##t)


%-------------------------------------------------------------------------------
% Paper
%-------------------------------------------------------------------------------

% Center page numbers at the bottom of the page
LN-pageNumbers = \paper {
  oddHeaderMarkup = \markup ""
  evenHeaderMarkup = \markup ""
  oddFooterMarkup = \markup {
    \vspace #2 \fill-line  {
      ""  \concat {
        \if \should-print-page-number {
          "- "  \fromproperty #'page:page-number-string " -"
        }
      } ""
    }
  }
  evenFooterMarkup = \markup {
    \vspace #2 \fill-line  {
      ""  \concat {
        \if \should-print-page-number {
          "- "  \fromproperty #'page:page-number-string " -"
        }
      } ""
    }
  }
}

% %-------------------------------------------------------------------------------
% %  pitch names (deutsch + movable solfegio)
% %-------------------------------------------------------------------------------
%
% %{
%
%   es   = flat
%   eses = double-flat
%   eh   = quarter-tone flat
%   eseh = three-quarter-tones flat
%
%   is   = sharp
%   isis = double-sharp
%   ih   = quarter-tone sharp
%   isih = three-quarter-tones sharp
%
%   English: c  d  e  f  g  a  bf b
%   German: c  d  e  f  g  a  b  h
%
% %}
%
custom-pitch-names = #`(

                         (ceses . ,(ly:make-pitch -1 0 DOUBLE-FLAT))
                         (ceseh . ,(ly:make-pitch -1 0 THREE-Q-FLAT))
                         (ces . ,(ly:make-pitch -1 0 FLAT))
                         (ceh . ,(ly:make-pitch -1 0 SEMI-FLAT))
                         (c . ,(ly:make-pitch -1 0 NATURAL))
                         (cih . ,(ly:make-pitch -1 0 SEMI-SHARP))
                         (cis . ,(ly:make-pitch -1 0 SHARP))
                         (cisih . ,(ly:make-pitch -1 0 THREE-Q-SHARP))
                         (cisis . ,(ly:make-pitch -1 0 DOUBLE-SHARP))

                         (deses . ,(ly:make-pitch -1 1 DOUBLE-FLAT))
                         (deseh . ,(ly:make-pitch -1 1 THREE-Q-FLAT))
                         (des . ,(ly:make-pitch -1 1 FLAT))
                         (deh . ,(ly:make-pitch -1 1 SEMI-FLAT))
                         (d . ,(ly:make-pitch -1 1 NATURAL))
                         (dih . ,(ly:make-pitch -1 1 SEMI-SHARP))
                         (dis . ,(ly:make-pitch -1 1 SHARP))
                         (disih . ,(ly:make-pitch -1 1 THREE-Q-SHARP))
                         (disis . ,(ly:make-pitch -1 1 DOUBLE-SHARP))

                         (eses . ,(ly:make-pitch -1 2 DOUBLE-FLAT))
                         (eseh . ,(ly:make-pitch -1 2 THREE-Q-FLAT))
                         (es . ,(ly:make-pitch -1 2 FLAT))
                         (eeh . ,(ly:make-pitch -1 2 SEMI-FLAT))
                         (e . ,(ly:make-pitch -1 2 NATURAL))
                         (eih . ,(ly:make-pitch -1 2 SEMI-SHARP))
                         (eis . ,(ly:make-pitch -1 2 SHARP))
                         (eisih . ,(ly:make-pitch -1 2 THREE-Q-SHARP))
                         (eisis . ,(ly:make-pitch -1 2 DOUBLE-SHARP))

                         (feses . ,(ly:make-pitch -1 3 DOUBLE-FLAT))
                         (feseh . ,(ly:make-pitch -1 3 THREE-Q-FLAT))
                         (fes . ,(ly:make-pitch -1 3 FLAT))
                         (feh . ,(ly:make-pitch -1 3 SEMI-FLAT))
                         (f . ,(ly:make-pitch -1 3 NATURAL))
                         (fih . ,(ly:make-pitch -1 3 SEMI-SHARP))
                         (fis . ,(ly:make-pitch -1 3 SHARP))
                         (fisih . ,(ly:make-pitch -1 3 THREE-Q-SHARP))
                         (fisis . ,(ly:make-pitch -1 3 DOUBLE-SHARP))

                         (geses . ,(ly:make-pitch -1 4 DOUBLE-FLAT))
                         (geseh . ,(ly:make-pitch -1 4 THREE-Q-FLAT))
                         (ges . ,(ly:make-pitch -1 4 FLAT))
                         (geh . ,(ly:make-pitch -1 4 SEMI-FLAT))
                         (g . ,(ly:make-pitch -1 4 NATURAL))
                         (gih . ,(ly:make-pitch -1 4 SEMI-SHARP))
                         (gis . ,(ly:make-pitch -1 4 SHARP))
                         (gisih . ,(ly:make-pitch -1 4 THREE-Q-SHARP))
                         (gisis . ,(ly:make-pitch -1 4 DOUBLE-SHARP))

                         (asas . ,(ly:make-pitch -1 5 DOUBLE-FLAT))
                         (asah . ,(ly:make-pitch -1 5 THREE-Q-FLAT))
                         (ases . ,(ly:make-pitch -1 5 DOUBLE-FLAT))   ;;non-standard name for asas
                         (aseh . ,(ly:make-pitch -1 5 THREE-Q-FLAT))
                         (as . ,(ly:make-pitch -1 5 FLAT))
                         (aeh . ,(ly:make-pitch -1 5 SEMI-FLAT))
                         (a . ,(ly:make-pitch -1 5 NATURAL))
                         (aih . ,(ly:make-pitch -1 5 SEMI-SHARP))
                         (ais . ,(ly:make-pitch -1 5 SHARP))
                         (aisih . ,(ly:make-pitch -1 5 THREE-Q-SHARP))
                         (aisis . ,(ly:make-pitch -1 5 DOUBLE-SHARP))

                         (heses . ,(ly:make-pitch -1 6 DOUBLE-FLAT))
                         (heseh . ,(ly:make-pitch -1 6 THREE-Q-FLAT))
                         (b . ,(ly:make-pitch -1 6 FLAT))
                         (beh . ,(ly:make-pitch -1 6 SEMI-FLAT))
                         (h . ,(ly:make-pitch -1 6 NATURAL))
                         (hih . ,(ly:make-pitch -1 6 SEMI-SHARP))
                         (his . ,(ly:make-pitch -1 6 SHARP))
                         (hisih . ,(ly:make-pitch -1 6 THREE-Q-SHARP))
                         (hisis . ,(ly:make-pitch -1 6 DOUBLE-SHARP))


                         (do . ,(ly:make-pitch -1 0 NATURAL))
                         (re . ,(ly:make-pitch -1 1 NATURAL))
                         (mi . ,(ly:make-pitch -1 2 NATURAL))
                         (fa . ,(ly:make-pitch -1 3 NATURAL))
                         (so . ,(ly:make-pitch -1 4 NATURAL))
                         (la . ,(ly:make-pitch -1 5 NATURAL))
                         (ti . ,(ly:make-pitch -1 6 NATURAL))

                         (di . ,(ly:make-pitch -1 0 SHARP))
                         (ri . ,(ly:make-pitch -1 1 SHARP))
                         (fi . ,(ly:make-pitch -1 3 SHARP))
                         (si . ,(ly:make-pitch -1 4 SHARP))
                         (li . ,(ly:make-pitch -1 5 SHARP))

                         (ra . ,(ly:make-pitch -1 1 FLAT))
                         (ma . ,(ly:make-pitch -1 2 FLAT))
                         (sa . ,(ly:make-pitch -1 4 FLAT))
                         (lo . ,(ly:make-pitch -1 5 FLAT))
                         (ta . ,(ly:make-pitch -1 6 FLAT))

                         (me . ,(ly:make-pitch -1 2 FLAT)) ;alternative flat names
                         (se . ,(ly:make-pitch -1 4 FLAT))
                         (le . ,(ly:make-pitch -1 5 FLAT))
                         (te . ,(ly:make-pitch -1 6 FLAT))
                         )

% #(ly:parser-set-note-names pitchnames)


note-names-LN =
#(define-void-function () ()
   #{ \language "deutsch" #}
   (if (check-ly-version <= '(2 19 0))
       (ly:parser-set-note-names custom-pitch-names)
       (ly:parser-set-note-names custom-pitch-names)))

note-names-default =
#(define-void-function () ()
   (if (check-ly-version <= '(2 19 0))
       (ly:parser-set-note-names pitchnames)
       (ly:parser-set-note-names pitchnames)))

#(define note-names
   (if (not (defined? 'note-names)) "deafult" note-names))

#(if (string= note-names "LN")
     (begin
      #{ \language "deutsch" #}
      (if (check-ly-version <= '(2 19 0))
          (ly:parser-set-note-names custom-pitch-names)
          (ly:parser-set-note-names custom-pitch-names))))


%-------------------------------------------------------------------------------
% Partial Engraving
%-------------------------------------------------------------------------------

#(define engrave-sections-check
   (if (not (defined? 'engrave-sections-check)) #f engrave-sections-check))

"pe-n" = 0
"pe-n-markup" = 0

partialEngraveTag =
#(if (defined? 'engrave-sections)
     (define-music-function () ()
       (set! pe-n (+ 1 pe-n))
       (set! pe-n-markup (number->string pe-n))
       (if (member pe-n engrave-sections)
           (begin
            (display "  Section " ) (display pe-n) (display " : engraving") (newline)
            (if engrave-sections-check
                #{ \color Score ""
                   <>^\markup \bold { "SECTION" \huge \box #pe-n-markup }#}
                #{ \set Score.skipTypesetting = ##f #}))
           (begin
            (display "  Section ") (display pe-n) (display " : NOT engraving") (newline)
            (if engrave-sections-check
                #{ \color Score "grey70"
                   <>^\markup \bold { "SECTION" \huge \box #pe-n-markup }#}
                #{  \set Score.skipTypesetting = ##t #})))))


peTag = #partialEngraveTag


%===============================================================================
% Testing
%===============================================================================

%-------------------------------------------------------------------------------
% Solfegio
%-------------------------------------------------------------------------------

% \new BracketLN
% \new StaffLN \with {\remove "Time_signature_engraver" }
% {
%   \relative do' {
%     \key do \major
%     do2 di re ri mi fa fi so si la li ti
%     do ti ta la lo so sa fa mi ma re ra do
%   }
% }
%

%-------------------------------------------------------------------------------

%
% \markup "Testing variable clef Y-position + change the level of stem flipping"
%
%
% \new BracketLN
% \new StaffLN {
%   \staff-III-up
%   \alignClef
%   \autoBeamOff
%
%   \clef alto
%   \time 4/4
%   b c'4\mf d' e' f' g' a' b' c'' d'' r r r2 r
%
%   \staff-III-Up
%   \clef bass-up
%
%
%   c,8 d, a, b, c\mf d e f
%
%
%
%
%   g8 a b c' r r r r \break
%
%   \staff-III-Down
%   \clef treble-down
%   c'' g'' c''' b' c'' d'' e'' f'' R1
%   r1 r2 r2
%
%   \staff-III-down
%   \clef alto
%
%
%   c'
%   r2
%   r1
%   r\breve
%   R1 \break
%
%   \staff-III-down
%   \clef alto
%
%   c8 d e f g a b c'
%   d' e' f' g' a' b' c'' b'32 a' g' f'
%   a8 g f e d c r c16 b,
%   a8 g f e d c b, a, \break
%
%   \staff-III-Up
%   \clef alto-up
%
%   c8 d e f g a b c' \noBreak
%   d' e' f' g' a' b' c'' b'32 a' g' f' \noBreak
%   a8 g f e d c r c16 b,
%   a8 g f e d c b, a, \bar "|."
% }
%
%






%===============================================================================
% Music examples for testing
%===============================================================================

% %-------------------------------------------------------------------------------
% % Noteheads test
% %-------------------------------------------------------------------------------
% %
% %
% notesQuaver = { c'8 d' e' f' g' a' b' c'' d'' e'' f'' g'' a'' b'' c''' }
% notesCrotchet = { c'4 d' e' f' g' a' b' c'' d'' e'' f'' g'' a'' b'' c''' }
% notesMinim = { c'2 d' e' f' g' a' b' c'' d'' e'' f'' g'' a'' b'' c''' }
% notesSemiBreve = { c'1 d' e' f' g' a' b' c'' d'' e'' f'' g'' a'' b'' c''' }
% notesBreve = { c'\breve d' e' f' g' a' b' c'' d'' e'' f'' g'' a'' b'' c''' }
%
% \new StaffTN {
%   \time 15/8
%   \override NoteHead.stencil = \crotchetWhiteNatural \notesQuaver
%   \override NoteHead.stencil = \crotchetWhiteSharp  \notesQuaver
%   \override NoteHead.stencil = \crotchetWhiteFlat \notesQuaver
%   \override NoteHead.stencil = \crotchetBlackNatural \notesQuaver
%   \override NoteHead.stencil = \crotchetBlackSharp \notesQuaver
%   \override NoteHead.stencil = \crotchetBlackFlat \notesQuaver
%   \time 15/4
%   \override NoteHead.stencil = \crotchetWhiteNatural \notesCrotchet
%   \override NoteHead.stencil = \crotchetWhiteSharp  \notesCrotchet
%   \override NoteHead.stencil = \crotchetWhiteFlat \notesCrotchet
%   \override NoteHead.stencil = \crotchetBlackNatural \notesCrotchet
%   \override NoteHead.stencil = \crotchetBlackSharp \notesCrotchet
%   \override NoteHead.stencil = \crotchetBlackFlat \notesCrotchet
%   \time 15/2
%   \override NoteHead.stencil = \minimWhiteNatural \notesMinim
%   \override NoteHead.stencil = \minimWhiteSharp \notesMinim
%   \override NoteHead.stencil = \minimWhiteFlat \notesMinim
%   \override NoteHead.stencil = \minimBlackNatural \notesMinim
%   \override NoteHead.stencil = \minimBlackSharp \notesMinim
%   \override NoteHead.stencil = \minimBlackFlat \notesMinim
%   \time 15/1
%   \override NoteHead.stencil = \semiBreveWhiteNatural \notesSemiBreve
%   \override NoteHead.stencil = \semiBreveWhiteSharp \notesSemiBreve
%   \override NoteHead.stencil = \semiBreveWhiteFlat \notesSemiBreve
%   \override NoteHead.stencil = \semiBreveBlackNatural \notesSemiBreve
%   \override NoteHead.stencil = \semiBreveBlackSharp \notesSemiBreve
%   \override NoteHead.stencil = \semiBreveBlackFlat \notesSemiBreve
%   \time 30/1
%   \override NoteHead.stencil = \breveWhiteNatural \notesBreve
%   \override NoteHead.stencil = \breveWhiteSharp \notesBreve
%   \override NoteHead.stencil = \breveWhiteFlat \notesBreve
%   \override NoteHead.stencil = \breveBlackNatural \notesBreve
%   \override NoteHead.stencil = \breveBlackSharp \notesBreve
%   \override NoteHead.stencil = \breveBlackFlat \notesBreve
% }

%
%-------------------------------------------------------------------------------
%
%
%
% \new BracketLN
% \new StaffLN {
%
%
%   \clef alto
%   c'1 d' e' f' g' a' b'
%   \staff-III-up
%   c''2 c''
%
%   \staff-III-down
%
%   c,4 d, e, f, g, a, b,
%   c d e f g a b
%   c'2_\markup "c'" d'4 e' f' g' a' b' c c c c \break
%
%   \clef treble-down
%   c'' d'' e'' f'' g'' a'' b''
%   c''' d''' e''' f''' g''' a''' b''' c''''
%
%
%   \hW c'''4 << {\hW d'''} \\ {\hB a''}>>  e'' f'' c'' as' \hW fis' e' d' c' d' e'
% }
%
%
% \new StaffLN  {
%   \staff-IV
%   \relative {
%     \clef alto
%
%
%
%
%     \stemUp
%     e gis e'gis
%     \stemNeutral
%     <d e fis gis b c d>2
%     as( ces as')
%     <c,, as,> b d e f
%
%     \staff-III-up
%
%     <d es> <fis gis> <des es f g b a cis> <a'' b  f g es des cis'>
%     <eis fisis> as e2 e4 e8 e a beses
%     c,4 cis d dis e f fis g gis a ais b
%     b a as ases ges f e \break
%
%     \staff-II
%
% %  \override Staff.NoteHead.before-line-breaking =
% %      #(customNoteHeadsNeutral 1 1 1)
%
% %     \revert Staff.NoteHead.before-line-breaking
% %      #(customNoteHeadsNeutral 1 1 1)
%
%     es d des
%     <c, d> <d e> <e f> <f g> <c cis> <c d> <c es> <c e>
%     ges'4 cis,2 fis1 e ges fis \testNH g gis4 a b as gis ais
%     <c,, c' c'>2 <c c' c'>4 c' es fes <e f g>1 <d e g> c\breve cis'
%   }
% }
%
% \new Staff {
%   \relative f' {
%   cis4 des fis ges
%
% \neutralNH-on
%
%   cis, des fis ges
%
% \neutralNH-off
%
%   cis, des fis ges
% }
% }
%
%
% % -------------------------------------------------------------------------------
% % Voices alignment & collision test
% % -------------------------------------------------------------------------------
%
%
%
% \new Bracket
% \new Staff {
%   \clef alto
%
%               \override Score.NoteColumn.ignore-collision = ##t
%   <<
%     \new Voice {
%
%       \voiceOne
%       d1 c'2 cisis4 <ges d> d c2 s2 ges r \break r
%       g4 c' e' r
%       c'2 a
%       c'1
%       c'\breve
%       \R r1
%
%       c'2 d' e' f' g' a' b' c''
%
%     }
%
%     \new Voice {
% %{       \override Staff.Stem.transparent = ##t%}
%       \voiceTwo
%       s1 ges4 e4 ges4 s ges s r r r2
%       r4 r r r
%       r2 r2
%       r1
%       r\breve
%       s1
%
%       r4 r r2 r
%       r2 r
%       r4 r
%       r2
%     }
%
%      \new Voice {
% %{       \override Staff.Stem.transparent = ##t%}
%       \voiceThree
%       ges1 d2 e4 ges4 s fis s s s r2
%       s4 s s s
%       s2 s2
%       s1
%       s\breve
%       s1
%
%       s4 s s2 s
%       s2 s
%       s4 s
%       s2
%     }
%
%   >>
% }
%
%
%
% \new Staff {
%   << {
%   e4 s4  e4 s d1 s1 d\breve
% }
%
% \\
%
% {
%  d1 c4  c4 } >>
% }
%
%
%
%
%
% %
% %custom noteheads with dots offset - test
%  \language "deutsch"
% %
%   "red" = { \once \override NoteHead.color = #red }
% %
% % {
% %   \relative {
% %     %\dotsDown
% %     %\neutralNH-on
% %     \time 18/4
% %     c,4. cis \red d dis e f \red fis ges g gis a \red ais b h
% %     c cis \red d dis e f fis ges g gis a ais b h
% %     %\neutralNH-off
% %     \red c cis d dis e f fis ges g gis a \red ais b h
% %     c cis \red d dis e f \red fis ges g gis a \red ais b h c
% %   }
% % }
%
% {
%   \relative {
%     %\neutralNH-on
%     %\staff-IV
%     \time 18/4
%     \dotsUp
%     <c, e g his e g c e g c e g c>2.-"dotsUp"
%     <d fis a d fis a d fis a d fis>
%     <b d f b d f b d f b d f>
%     \dotsDown
%     <c e g c e g c e g c e g c>2.-"dotsDown"
%     <d fis a d ges a d fis a d fis>
%     <b d f b d f b d f b d f>
%     \dotsNeutral
%     <c e g c e g c e g c e g c>2.-"dotsNeutral"
%     <d fis a d fis a d fis a d fis>
%     <b d f b d f b d f b d f>
%
%     c cis \red d dis e f fis ges g gis a ais b h
%     %\neutralNH-off
%     \red c cis d dis e f fis ges g gis a \red ais b h
%     c cis \red d dis e f \red fis ges g gis a \red ais b h c
%   }
% }
% \language "nederlands"
%
% gn = \once \override NoteHead.color = #green
% bn = \once \override NoteHead.color = #blue
% \relative f' {
%   \time 18/4
%   c,,4. cis \bn d dis e f \bn fis g gis a \bn ais b
%   c4. cis \bn d dis e f fis g gis a ais b \break
%   \bn c4. cis d dis e f fis g gis a \bn ais b
%   c4. cis \bn d dis e f \bn fis g gis a \bn ais b \break
%
%   % c4. d fis ges ais bes
%   % c d fis ges ais bes
%
%   <c,,,, e g>4. <cis f gis> \bn <d fis a> \bn <dis g ais>
%   <e gis b> <f a c> \bn <fis ais cis> \bn <g b d>
%   <gis c dis> <a cis e> \bn <ais d f> \bn <bes dis fis>
%
%   <c e g>4. <cis f gis> \bn <d fis a> \bn <dis g ais>
%   <e gis b> <f a c> \bn <fis ais cis> \bn <g b d>
%   <gis c dis> <a cis e> \bn <ais d f> \bn <b dis fis>
%
%   <c e g>4. <cis f gis> \bn <d fis a> \bn <dis g ais>
%   <e gis b> <f a c> \bn <fis ais cis> \bn <g b d>
%   <gis c dis> <a cis e> \bn <ais d f> \bn <b dis fis>
%
%   <c e g>4. <cis f gis> \bn <d fis a> \bn <dis g ais>
%   <e gis b> <f a c> \bn <fis ais cis> \bn <g b d>
%   <gis c dis> <a cis e> \bn <ais d f> \bn <b dis fis> \break
%
%    \bn <bes,, es> \bn <bes dis fis> \bn <bes e fis>
%   \bn <bes e> \bn <bes fis'> \bn <bes e fis bes> \bn <bes fis' bes>
%   \bn <bes e bes'> s4.*4 \break
%
% }
%
%

