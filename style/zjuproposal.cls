%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Huangrui Mo <huangrui.mo@gmail.com> 
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{zjuproposal}
  [2017/01/05 v1.0 zjuproposal
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Loadclass Infomation *********************************
%%
\LoadClass[UTF8,a4paper,oneside,zihao=-4,linespread=1.6]{ctexart}
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% color packages
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
%% geometry packages
\RequirePackage{geometry}
%% titletoc packages
\RequirePackage{titletoc}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{./style/zjuproposal.cfg}{}{}
  \makeatother
}

%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************
%%
%% page layout
\geometry{left=2.1cm,right=2.1cm,top=2.5cm,bottom=2.0cm,headheight=1.5cm,footskip=1.75cm}
\pagestyle{plain}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%%
%% Default latin fonts
\setmainfont{Times New Roman}
%% Toc format setting
\titlecontents{part}[0em]
{\zihao{-4} \CJKfontspec[AutoFakeBold = true]{STSong} \bfseries}
{\contentslabel{2em}}
{}
{\titlerule*{.}\contentspage}

\titlecontents{section}[2em]
{\zihao{5}}
{\contentslabel{2em}}
{}
{\titlerule*{.}\contentspage}

\titlecontents{subsection}[4em]
{\zihao{5}}
{\contentslabel{1em}}
{}
{\titlerule*{.}\contentspage}

%% CTeX configuration
\ctexset{
  contentsname=\hfill \zihao{2} \heiti \textbf{目~~录} \hfill \hfill,
  part={
    numbering=false,
    nameformat=\zihao{-4} \FakeBold,
    titleformat=\center \zihao{-2} \FakeBold,
    beforeskip=0pt,
    afterskip=0pt,
  },
  section={
    number=\chinese{section}、,
    format=\zihao{-3} \FakeBold,
    aftername=,
    beforeskip=0pt,
    afterskip=0pt,
  },
  subsection={
    number=\arabic{subsection}.,
    format=\zihao{4} \FakeBold,
    aftername=~~,
    beforeskip=0pt,
    afterskip=0pt
  }
}

%% pdfLieral XeCJK for FakeBold
% value > 0
\def\xeCJKembold{0.4}
% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}
% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol
% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}

%% AutoFakeBold
\newcommand\FakeBold[1]{{\CJKfontspec[AutoFakeBold = true]{STSong} \bfseries #1}}

%% underline
\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\ZJU@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\ZJUunderline{\@ifnextchar[\ZJU@underline\CJKunderline}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************** Chinese Titlepage Items ***********************************
%%
\renewcommand\title[2][\ZJU@value@title]{%
  \def\ZJU@value@title{#2}
  %\def\ZJU@value@titlemark{\MakeUppercase{#1}}}
  \def\ZJU@value@titlemark{#1}}
\def\@title{\ZJU@value@titlemark}
\renewcommand\author[1]{\def\ZJU@value@author{#1}}
\newcommand\authorid[1]{\def\ZJU@value@authorid{#1}}
\newcommand\advisor[1]{\def\ZJU@value@advisor{#1}}
\newcommand\advisortitle[1]{\def\ZJU@value@advisortitle{#1}}
\newcommand\degree[1]{\def\ZJU@value@degree{#1}}
\newcommand\degreetype[1]{\def\ZJU@value@degreetype{#1}}
\newcommand\major[1]{\def\ZJU@value@major{#1}}
\newcommand\institute[1]{\def\ZJU@value@institute{#1}}
\newcommand\chinesedate[1]{\def\ZJU@value@chinesedate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{-3}\bfseries
    \vspace{10mm}
    \begin{center}
      \includegraphics[width=60mm]{./style/logo/ZJDX.pdf}\par
      \vspace{4mm}
      {\songti \zihao{-1}\ZJU@label@thesis}
      \par
      \vspace{10mm}
      \includegraphics[width=60mm]{./style/logo/QSY.pdf}
    \end{center}
    \vspace{10mm}

    \def\tabcolsep{1pt}
    \def\arraystretch{1.2}
    %\hskip -15pt
    \begin{tabular}{lc}
      \ZJU@label@title & \ZJUunderline[295pt]{\ZJU@value@title}
    \\
      \ZJU@label@author & \ZJUunderline[132pt]{\ZJU@value@author}\ZJU@label@authorid\ZJUunderline[132pt]{\ZJU@value@authorid}
    \\
      \ZJU@label@advisor & \ZJUunderline[132pt]{\ZJU@value@advisor}\ZJU@label@advisortitle\ZJUunderline[132pt]{\ZJU@value@advisortitle}
    \\
      \ZJU@label@degree & \ZJUunderline[295pt]{\ZJU@value@degreetype\ZJU@value@degree}
    \\
      \ZJU@label@major &  \ZJUunderline[295pt]{\ZJU@value@major}
    \\
      \ZJU@label@institute & \ZJUunderline[295pt]{\ZJU@value@institute}
    \\
      \ZJU@label@date & \ZJUunderline[295pt]{\ZJU@value@chinesedate}
    \end{tabular}

    \vspace*{50pt}

    \ZJU@label@mark
  \end{center}
  \clearpage
}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
