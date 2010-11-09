\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pbarticle}[2010/02/03 Paul's custom article class]
\PassOptionsToClass{a4paper}{article}
\LoadClass{article}

\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\headerfont\LARGE\bfseries \@title \normalfont \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}

\setlength\abovecaptionskip{0\p@}
\setlength\belowcaptionskip{10\p@}

\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra}
\usepackage{sectsty}
\usepackage[none]{hyphenat}
\usepackage[british]{babel}
\usepackage[nodayofweek]{datetime}
\usepackage[numbers]{natbib}
\bibliographystyle{plainnat}

\newcommand{\headerfont}{\normalfont}
\newcommand{\setheaderfont}[1]{
  \renewcommand{\headerfont}{\fontspec{#1}}
  \sectionfont{\headerfont}
  \subsectionfont{\headerfont}
  \subsubsectionfont{\headerfont}}

\defaultfontfeatures{Mapping=tex-text,Ligatures={Common},Numbers=OldStyle}
\linespread{1.3}
\sloppy
\RequirePackage[xetex]{hyperref}

\newcommand{\todo}[1]{%
  \textbf{TODO: #1}}
\newcommand{\domain}[1]{%
  \nohyphens{\texttt{#1}}}
\newcommand{\fauxheader}[1]{%
  \headerfont{\textbf{#1}}}

\endinput
