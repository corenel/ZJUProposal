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
\LoadClass[UTF8,,a4paper,oneside,zihao=-4,linespread=1.6]{ctexart}
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
  \InputIfFileExists{Style/zjuproposal.cfg}{}{}
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
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************** Chinese Titlepage Items ***********************************
%%
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Titlepage ******************************
%%
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
