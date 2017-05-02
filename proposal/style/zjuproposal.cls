%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Yusu Pan <xxdsox@gmail.com> 
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
\LoadClass[UTF8,a4paper,twoside,zihao=-4,linespread=1.6]{ctexart}
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
% bold font in equations
\RequirePackage{bm}
% case in euqations
\RequirePackage{cases}
% footnote
\RequirePackage{pifont}
% firgure
\RequirePackage{graphicx}
% set format of captions
\RequirePackage{caption}
% no recommend for subfig
\RequirePackage{subcaption}
% caption of bio lang
\RequirePackage{bicaption}
% tabs for table
\RequirePackage{booktabs}
% long table
\RequirePackage{longtable}
% dependence foir longtable
\RequirePackage{tabu}
% underline
\RequirePackage{ulem}
% utilities for table
\RequirePackage{array}
% hyperref 宏包可根据交叉引用生成超链接，同时生成 PDF 文档的书签。
\RequirePackage[hypertexnames=false]{hyperref}
% 参考文献正文上标样式设置
\RequirePackage[sort&compress,numbers]{natbib}
% hypernat 可以让hyperref 和natbib 混合使用，但它需要放在这两者之后。
\RequirePackage{hypernat}
% 修复图表超链接不准的问题
\RequirePackage[all]{hypcap}
% footmisc 宏包提供了对脚注样式的控制功能。
% stable参数主要使脚注\footnote可以用在章节命令中；
% perpage
\RequirePackage[stable,perpage]{footmisc}
% Multiple bib
\RequirePackage[resetlabels]{multibib}
% Set space in reference
\RequirePackage{setspace}
% Set format of itemize
\RequirePackage{enumitem}
% Miltiple columns
\RequirePackage{multicol}
% Page numbers in footer
\RequirePackage{fancyhdr}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{./style/zjuproposal.cfg}{}{}
  \makeatother
}
\AtEndOfClass{
  \hypersetup{
    unicode,
    % hyperfootnotes=false,
      pdfstartview=FitH,
      CJKbookmarks=true,
      bookmarksnumbered=true,
      bookmarksopen=true,
      % colorlinks=true,    % 链接颜色默认关闭，hidelink打开。
      % citecolor=blue,
      % linkcolor=blue,
      % anchorcolor=blue,
      % urlcolor=blue,
      hidelinks,      % 隐藏超链接的颜色和边框。
      % draft,        % 草稿模式，提高编译速度，需要时注释掉就可以了。
  }
}
\AtBeginDocument{
  \hypersetup{%
    pdftitle={\ZJU@value@title},%
    pdfauthor={\ZJU@value@author},%
    pdfkeywords={},%
    pdfcreator={LaTeX with hyperref package, using ZJU LaTeX Proposal Template
     for Undergraduate}
  }
}
\urlstyle{same}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************
%%
%% page layout
\geometry{left=2.1cm,right=2.1cm,top=2.5cm,bottom=2.0cm,headheight=1.5cm,footskip=1.00cm}
\pagestyle{fancy}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%%
%% Default latin fonts
\setmainfont{Times New Roman}
%% Toc format setting
\titlecontents{part}[0em]
{\zihao{-4} \songti}
{\contentslabel{2em}}
{}
{\titlerule*{.}\contentspage}

\titlecontents{chapter}[0em]
{\zihao{-4} \songti}
{\contentslabel{2em}}
{}
{}

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
  contentsname=\hfill \zihao{2} \heiti \textbf{目~~录} \hfill,
  figurename=\FakeBold{图},
  tablename=\FakeBold{表},
  bibname=\nobreak,
  part={
    numbering=false,
    nameformat=\zihao{-4} \songti \FakeBold,
    titleformat=\center \songti \zihao{-2} \FakeBold,
    beforeskip=0pt,
    afterskip=0pt,
  },
  section={
    number=\chinese{section}、,
    format=\zihao{-3} \songti \FakeBold,
    aftername=,
    beforeskip=0pt,
    afterskip=0pt,
  },
  subsection={
    number=\arabic{subsection}.,
    format=\zihao{4} \songti \FakeBold,
    aftername=~~,
    beforeskip=0pt,
    afterskip=0pt
  },
  subsubsection={
    number=\arabic{subsection}.\arabic{subsubsection}.,
    format=\zihao{-4} \FakeBold,
    aftername=~~,
    beforeskip=0pt,
    afterskip=0pt
  },
  paragraph={
    format=\zihao{-4} \FakeBold,
    beforeskip=0pt,
    afterskip=0pt,
    indent=2em,
  }
}


%%%%% --------------------------------------------------------------------------------
%%
%%%%************************** FakeBold Settings *************************************
%%

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
\font\sn="SimSun"
\def\embolden#1{%
\special{pdf: literal direct 0.5 w 2 Tr}%
#1%
\special{pdf: literal direct 0 w 0 Tr}%
}
%\newcommand\FakeBold[1]{{\CJKfontspec[AutoFakeBold = false]{STSong} \bfseries #1}}
\newcommand\FakeBold[1]{{\embolden{#1}}}

%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Citing Settings **************************************
%%

% ---------- 参考文献样式 ----------
% Create cites command
\newcites{rev}{~}
\newcites{pro}{~}
\newcites{tra}{~}

%% 采用IEEEtran参考文献样式，
%% 针对要求进行修改
\bibliographystylerev{./style/IEEEtran_modified}
\bibliographystylepro{./style/IEEEtran_modified}
\bibliographystyletra{./style/IEEEtran_modified}

%% natbib宏包命令，参考文献上标设置。
\setcitestyle{super,square,comma}

%% 重新定义 \ref 命令，使其前面自动加一个 ``~''。因为hyperref 宏包会通过 \AtBegin-
%% Document 修改 \ref 的定义，因此我们对 \ref 的修改也必须使用\AtBeginDocument 命
%% 令进行。同时我们需要修改 \eqref，使其括号前后不出现空隙。参考自njuthesis胡海星。
\AtBeginDocument{%
  \let\oldref\ref%
  \renewcommand*{\ref}[1]{\thinspace\oldref{#1}}%
  \renewcommand*{\eqref}[1]{(\oldref{#1})}
}

%%%%% --------------------------------------------------------------------------------
%%
%%%%************************* Floating Settings **************************************
%%

%% Figure directory
\graphicspath{%
  {./figure/}%
}

% workaround for figure in multicols
\newenvironment{Figure}
  {\par\medskip\noindent\minipage{\linewidth}}
  {\endminipage\par\medskip}

% ---------- 浮动体相关定义 ----------
% 设置浮动环境标题的字体大小。根据学位论文格式要求，插图和表格标题字体需要比正文
% 字体略小。
\renewcommand\figureautorefname{图}
\renewcommand\tableautorefname{表}
\renewcommand\equationautorefname{公式}
\DeclareCaptionFont{fakebf}{}
\captionsetup{%
  format=hang,
  labelsep=quad,    % 去掉图表号后的冒号。图序与图名文字之间空一个汉字宽度。
  skip=10pt,      % 标题与图表之间空10pt距离。
  font={small,fakebf},     % 标题字体比正文小一号，这里取small。
  % width=0.75\textwidth  % 标题最大宽度为0.75倍正文宽度。
%TODO:width影响bi-second居中
  }

% 根据学位论文格式要求，表格的标题必须位于表格上方，插图的标题必须位于插图下方。
\captionsetup[table]{position=above}
\captionsetup[figure]{position=below}

%% 以下为设置浮动对象和文字之间的距离。
% 版心顶部或者版心底部浮动体之间的垂直距离，默认为12pt plus 2pt minus 2pt。
\setlength{\floatsep}{10bp \@plus2pt \@minus1pt}

% 文本行之间浮动体（使用h位置选项）与上下文之间的距离，默认为12pt plus 2pt minus
% 2pt。
\setlength{\intextsep}{12bp \@plus2pt \@minus1pt}

% 版心顶部或底部的浮动体与文本之间的距离，默认为12pt plus 2pt minus 2pt。
\setlength{\textfloatsep}{12bp \@plus2pt \@minus1pt}

% 浮动页中，版心顶部的浮动体与版心顶边之间的距离，默认为0pt plus 1fil。
\setlength{\@fptop}{0bp \@plus1.0fil}

% 浮动页中浮动体直接的距离，默认为8pt plus 2fil。
\setlength{\@fpsep}{8bp \@plus2.0fil}

% 浮动页中，版心底部的浮动体与版心底边之间的距离，默认为0pt plus 1fil。
\setlength{\@fpbot}{0bp \@plus1.0fil}

%% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页
%% 面，也可以防止在很大空白的浮动页上放置很小的图形。
% 默认情况下，LaTeX要求每页的文字至少占据 20%，否则该页就只单独放置一个浮动环境。
% 而这通常不是我们想要的。我们将这个要求降低到 5%。
\renewcommand{\textfraction}{0.05}

% 在一文本页中，被置于版心顶部的所有浮动体的高度与版心高度的最大比值，默认为0.7，
% 这里修改为0.9，任何造成高度超过版心高度90% 的浮动体都被将阻止置于当前版心顶部。
\renewcommand{\topfraction}{0.9}

% 同上，只不过变成了版心底部，默认为0.3.
\renewcommand{\bottomfraction}{0.8}

% 在任意一个“浮动页”中，所有的浮动体高度与版心的高度的最小比值，默认为 0.5，这里
% 设置成0.85。因此，浮动页中空白与版心的比值不会超过1-\floatpagefraction。
\renewcommand{\floatpagefraction}{0.85}

%%%%% --------------------------------------------------------------------------------
%%
%%%%************************** Footer Settings ***************************************
%%
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead{}
  \fancyfoot{}
  \fancyfoot[RO, LE]{\thepage}}
  \renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyhead{}
\fancyfoot{}
\fancyfoot[RO, LE]{\thepage}
\renewcommand{\headrulewidth}{0pt}


%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Misc *********************************************
%%

%% underline
\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\ZJU@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\ZJUunderline{\@ifnextchar[\ZJU@underline\CJKunderline}

%% itemize line space setting
\setlist[itemize]{noitemsep, topsep=0pt}
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
\newcommand\advisor[1]{\def\ZJU@value@advisor{#1}}
\newcommand\grademajor[1]{\def\ZJU@value@grademajor{#1}}
\newcommand\college[1]{\def\ZJU@value@college{#1}}
\newcommand\advisorreview[1]{\def\ZJU@value@advisorreview{#1}}
\newcommand\reviewerremark[1]{\def\ZJU@value@reviewerremark{#1}}
\newcommand\result[1]{\def\ZJU@value@result{#1}}
\newcommand\advisorsignature[1]{\def\ZJU@value@advisorsignature{#1}}
\newcommand\reviewersignature[1]{\def\ZJU@value@reviewersignature{#1}}
\newcommand\advisorsigndate[1]{\def\ZJU@value@advisorsigndate{#1}}
\newcommand\reviewersigndate[1]{\def\ZJU@value@reviewersigndate{#1}}
%\newcommand\chinesedate[1]{\def\ZJU@value@chinesedate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{3}\bfseries
    \vspace*{18mm}
    \begin{center}
      \includegraphics[width=100mm]{./style/logo/ZJDX.pdf}\par
      \vspace{16mm}
      {\zihao{-1} \bfseries \ZJU@label@project}
      \par
      \vspace{14mm}
      {\zihao{-1} \bfseries \ZJU@label@proposal}
      \par
      \vspace{18mm}
      \includegraphics[width=30.9mm]{./style/logo/QSY.pdf}
    \end{center} 
    \vspace{24mm}

    \def\tabcolsep{1pt}
    \def\arraystretch{1.2}
    \hskip 15pt
    \begin{tabular}{lc}
      %\ZJU@label@title & \ZJUunderline[295pt]{\ZJU@value@title} \\
      \ZJU@label@author & \ZJUunderline[220pt]{\ZJU@value@author} \\
      \ZJU@label@advisor & \ZJUunderline[220pt]{\ZJU@value@advisor} \\
      \ZJU@label@grademajor &  \ZJUunderline[220pt]{\ZJU@value@grademajor} \\
      \ZJU@label@college & \ZJUunderline[220pt]{\ZJU@value@college} \\
      %\ZJU@label@date & \ZJUunderline[295pt]{\ZJU@value@chinesedate}
    \end{tabular}

    \vspace*{50pt}
  \end{center}
  

  \clearpage
}

\newcommand\makereview{%
  \cleardoublepage
  \thispagestyle{empty}

  \newpage
  \begingroup
    \zihao{4} \fangsong
    \FakeBold{一、\ZJU@label@title：\ZJUunderline[295pt]{\ZJU@value@title}} \par
    \FakeBold{二、指导教师对文献综述和开题报告的具体内容要求：} \par
    \ZJU@value@advisorreview
    \par
    \vspace*{\fill}
    \begin{flushright}
      \FakeBold{指导教师（签名）}\ZJUunderline[100pt]{\ZJU@value@advisorsignature} \par
      \FakeBold{\ZJU@value@advisorsigndate}
    \end{flushright}
  \endgroup

  \clearpage
}

\newcommand\makeresult{%
  \cleardoublepage
  \thispagestyle{empty}

  \begingroup
    \zihao{4} \fangsong
    \begin{center}
        {\zihao{-2} \FakeBold{毕业设计文献综述和开题报告考核}}
    \end{center}
    \par
    \FakeBold{一、对文献综述、外文翻译和开题报告评语及成绩评定：}
    \par
    {\zihao{3} \FakeBold{评语：}}
    \par
    \ZJU@value@reviewerremark \par
    \vspace{30mm}
    {\zihao{3} \FakeBold{成绩：}}
    \par
    \ZJU@value@result \par
    \vspace*{\fill}
    \begin{flushright}
      \FakeBold{开题报告答辩小组负责人（签名）}\ZJUunderline[100pt]{\ZJU@value@reviewersignature} \par
      \FakeBold{\ZJU@value@reviewersigndate}
    \end{flushright}
  \endgroup

  \clearpage
}

\newcommand\makeorinialpaper{%
  \cleardoublepage
  \thispagestyle{empty}

  \addcontentsline{toc}{part}{\protect\numberline{}\FakeBold{附：原稿}}%
  \begin{flushleft}
    {\zihao{-2} \FakeBold{附：原稿}}
  \end{flushleft}

  \clearpage
}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
