%% Версия от 09.01.08
%% Стилевой файл для журнала "Алгебра и Анализ". Версия для авторов.
%%
%%% ====================================================================
%%% @LaTeX-file{
%%%   filename  = "a_a.cls",
%%%   date      = "09.01.2008",
%%%   author    = "Alexander Khrabrov",
%%%   abstract  = "LaTeX documentclass for the journal 'Algebra i Analiz'
%%%                based on AMS class 'spmj-l.cls'"
%%% }

\NeedsTeXFormat{LaTeX2e}% LaTeX 2.09 can't be used (nor non-LaTeX)
[1994/12/01]% LaTeX date must December 1994 or later
\ProvidesClass{a_a}
              [2007/10/03 v0.1 Algebra and Analysis Author Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions

\LoadClass[reqno]{amsart}[1999/11/24]

\RequirePackage{textcomp}
% для рисования правильного значка параграфа

\def\English{
\righthyphenmin=3
\def\prefacename{Preface}
\def\refname{References}
\def\abstractname{Abstract}
\def\bibname{Bibliography}
\def\chaptername{Chapter}
\def\appendixname{Appendix}
\def\contentsname{Contents}
\def\indexname{Index}
\def\figurename{Fig.}
\def\tablename{Table}
\def\partname{Part}
\def\pagename{Page}
\def\proofname{Proof}
\def\glossaryname{Glossary}
\@ifundefined{chapter}{}{\def\chaptername{Chapter}}
\def\keywordsname{Key words}
}

\frenchspacing
\righthyphenmin 2

\textwidth=370pt
\textheight=526pt

\renewcommand{\datename}{Поступило}
\def\@setdate{\vspace*{-\baselineskip}\vbox to -\baselineskip{\flushright{%\footnotesize
{\sffamily\datename\enskip\@date}}}}

\def\@setaddresses{\par
  \nobreak \begingroup
  \def\author##1{\nobreak\addvspace\bigskipamount}%
  \interlinepenalty\@M
  \def\address##1##2{\begingroup
    \par\addvspace\bigskipamount
    \@ifnotempty{##1}{(\ignorespaces##1\unskip) }%
    {\noindent\ignorespaces\normalfont\rmfamily##2}\par\endgroup}%
   \def\curraddr##1##2{}
  \def\email##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\noindent{\itshape E-mail:}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/\space
      \footnotesize\ttfamily##2\par}\endgroup}%
  \def\urladdr##1##2{\begingroup
    \@ifnotempty{##2}{\nobreak\indent{\itshape URL}%
      \@ifnotempty{##1}{, \ignorespaces##1\unskip}\/:\space
      \ttfamily##2\par}\endgroup}%
  \addresses
  \endgroup
}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

\renewenvironment{abstract}{%
  \ifx\maketitle\relax
    \ClassWarning{\@classname}{Abstract should precede
      \protect\maketitle\space in AMS documentclasses; reported}%
  \fi
  \global\setbox\abstractbox=\vtop \bgroup
    \normalfont\Small
    \list{}{\labelwidth\z@
      \leftmargin3pc \rightmargin\leftmargin
      \listparindent\normalparindent \itemindent\z@
      \parsep\z@ \@plus\p@
      \let\fullwidthdisplay\relax
    }%
     \item\unskip\ignorespaces%
}{%
  \endlist\egroup
  \ifx\@setabstract\relax \@setabstracta \fi
}

\renewcommand{\andify}{%
  \nxandlist{\unskip, }{\unskip, }{\unskip, }}

\def\@setauthors{%
  \begingroup
  \trivlist
  \centering\footnotesize \@topsep30\p@\relax
  \advance\@topsep by -\baselineskip
  \item\relax
  \andify\authors
  \def\\{\protect\linebreak}%
{\bfseries\copyright\enskip\MakeUppercase{\authors}}%
  \endtrivlist
  \endgroup
}

\def\@setcopyright{}

\def\ch@ngefonts{\let\tempfont=\scriptsize \let\scriptsize=\footnotesize}
\def\Ch@ngefonts{\let\scriptsize=\tempfont}
\let\@@evenhead=\@evenhead
\renewcommand{\@evenhead}{\raisebox{0pt}[\headheight][0pt]%
{\ch@ngefonts\vbox{\hbox to\textwidth{\strut \@@evenhead}\Ch@ngefonts\hrule}}}
\let\@@oddhead=\@oddhead
\renewcommand{\@oddhead}{\raisebox{0pt}[\headheight][0pt]%
{\ch@ngefonts\vbox{\hbox to\textwidth{\strut \@@oddhead}\Ch@ngefonts\hrule}}}

\def\originfo#1#2#3#4{\def\origvolume{#1}\def\origissue{#2}%
  \def\origmonth{#3}\def\origyear{#4}}
\originfo{00}% volume number
  {0}%        % issue number
  {Yyyy}%     % month
  {0000}%     % year

\def\publname{%
  \hbox{Алгебра и анализ}\hfill}
\def\russianvolinfo{%
  \hbox{Том \origvolume\ (\origyear), \No \origissue}}
\AtBeginDocument{%
  \def\@serieslogo{%
    \vbox to\headheight{%
      \parindent\z@ \parfillskip\z@ \fontsize{9}{9\p@}\selectfont
      \noindent\publname\linebreak
      \russianvolinfo
      \null\hfill
      \endgraf
      \vss
    }%
  }%
}

\def\@maketitle{%
  \normalfont\normalsize
  \let\@makefnmark\relax  \let\@thefnmark\relax
  \ifx\@empty\@keywords\else \@footnotetext{\@setkeywords}\fi
  \ifx\@empty\thankses\else \@footnotetext{%
    \def\par{\let\par\@par}\@setthanks}\fi
  \@mkboth{\@nx{\shortauthors}}{\@nx\shorttitle}%
  \global\topskip44\p@\relax % 5.5pc   "   "   "     "     "
  \ifx\@empty\@dedicatory
  \else
    \vtop{\flushright{\@dedicatory\@@par}%
      \global\dimen@i\prevdepth}\prevdepth\dimen@i
    \vskip6ex
  \fi
  \@settitle
  \ifx\@empty\authors \else \@setauthors \fi
  \@setabstract
  \normalsize
  \if@titlepage
    \newpage
  \else
    \dimen@34\p@ \advance\dimen@-\baselineskip
    \vskip\dimen@\relax
  \fi
} % end \@maketitle

\def\@setabstracta{%
  \ifvoid\abstractbox
  \else
    \skip@18\p@ \advance\skip@-\lastskip
    \advance\skip@-\baselineskip \vskip\skip@
    \box\abstractbox
    \prevdepth\z@ % because \abstractbox is a vtop
  \fi
}


\def\@setkeywords{%
  {\itshape \keywordsname:}\enspace \@keywords\@addpunct.}


\def\section{\@startsection{section}{1}%
  \z@{.7\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\large\sffamily\centering}}
\def\specialsection{\@startsection{section}{1}%
  \z@{\linespacing\@plus\linespacing}{.5\linespacing}%
  {\normalfont\large\sffamily\centering}}

\def\enddoc@text{\ifx\@empty\@translators \else\@settranslators\fi
  \ifx\@empty\@date \else\@setdate\fi
  \ifx\@empty\addresses \else\@setaddresses\fi
}

%    Miscellaneous information associated with translation.
%    [bnb, 2003/06/03]
\def\translnote#1{%
  \ifx\@empty\@translnotes \def\@translnotes{#1}%
  \else\g@addto@macro\@translnotes{\par\vspace{3\p@}#1}\fi}
\let\@translnotes=\@empty
\def\@settranslnotes{%
  \par\begingroup
    \addvspace{3\p@\@plus5\p@}%
    \flushright\normalfont\Small
    \@translnotes\par
  \endgroup}
\newcommand{\eo}[1]{\translnote{English original provided by #1}}
\newcommand{\rv}[1]{\translnote{Revised version provided by #1}}
\newcommand{\op}[1]{\translnote{Originally published in #1}}
\newcommand{\eb}[1]{\translnote{Edited by \uppercase{#1}}}


%  Various style differences between SPMJ and amsart.
%  [bnb, 2004/12/14]
%  Add section sign before section numbers; also in table of contents.
\def\@checksectlevel{\ifnum\@toclevel=\@ne \S\fi}
\def\@seccntformat#1{%
  \protect\textup{\protect\@secnumfont
    \protect\@checksectlevel
    \csname the#1\endcsname
    \protect\@secnumpunct
  }%
}
\renewcommand{\tocsection}[3]{%
  \indentlabel{\@ifnotempty{#2}{\ignorespaces#1 \S#2.\quad}}#3}
%  Subsection numbers bold.
\def\@secnumfont{%
    \ifnum\@toclevel=\tw@ \bfseries \fi
}
%  Omit page numbers from in-article contents.
\renewcommand{\addcontentsline}[3]{%
  \addtocontents{#1}{\protect\contentsline{#2}{#3}{}}}

%
% From russcorr
%
\newcommand*{\tg}{\mathop{\operator@font tg}\nolimits}
\newcommand*{\ctg}{\mathop{\operator@font ctg}\nolimits}
\newcommand*{\cosec}{\mathop{\operator@font cosec}\nolimits}
\newcommand*{\arctg}{\mathop{\operator@font arctg}\nolimits}
\newcommand*{\arcctg}{\mathop{\operator@font arcctg}\nolimits}
\newcommand*{\sh}{\mathop{\operator@font sh}\nolimits}
\newcommand*{\ch}{\mathop{\operator@font ch}\nolimits}
\newcommand*{\cth}{\mathop{\operator@font cth}\nolimits}
\@ifundefined{th}{}{%
 \PackageInfo{russcorr}{Command \string\th\space is being redefined}
}
\def\th{\mathop{\operator@font th}\nolimits}

\DeclareSymbolFont{AMSa}{U}{msa}{m}{n}
\DeclareSymbolFont{AMSb}{U}{msb}{m}{n}
\DeclareMathSymbol{\varkappa}{\mathord}{AMSb}{"7B}
\DeclareMathSymbol{\leqslant}{\mathrel}{AMSa}{"36}
\DeclareMathSymbol{\geqslant}{\mathrel}{AMSa}{"3E}

\def\contentsname{Оглавление}
\def\figurename{Рис.}
\def\partname{Часть}
\def\refname{Список литературы}
\def\bibname{Литература}
\def\tablename{Таблица}
\@ifundefined{chapter}{}{\def\chaptername{Глава}}
\def\proofname{Доказательство}
\def\appendixname{Приложение}
\def\keywordsname{Ключевые слова}


\def\@captionheadfont{\rmfamily}
\def\@captionfont{\normalfont}

%%%%%%%%%%%%%

% Кавычки-елочки
\chardef\llq=128
\chardef\rrq=129

\endinput
