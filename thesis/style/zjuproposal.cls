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
{\zihao{5} \songti \bfseries}
{\contentslabel{2em}}
{}
{\titlerule*{.}\contentspage}

\titlecontents{section}[2em]
{\zihao{5} \songti}
{\contentslabel{1em}}
{}
{\titlerule*{.}\contentspage}

\titlecontents{subsection}[4em]
{\zihao{5} \songti}
{\contentslabel{1.5em}}
{}
{\titlerule*{.}\contentspage}

\titlecontents{subsubsection}[6em]
{\zihao{5} \songti}
{\contentslabel{2.5em}}
{}
{\titlerule*{.}\contentspage}

%% CTeX configuration
\ctexset{
  contentsname=\hfill \zihao{3} \FakeBold{目录} \hfill,
  figurename=\FakeBold{图},
  tablename=\FakeBold{表},
  bibname=\nobreak,
  part={
    numbering=false,
    nameformat=\zihao{-4} \FakeBold,
    titleformat=\zihao{3} \FakeBold,
    beforeskip=0pt,
    afterskip=0pt,
  },
  section={
    % number=\chinese{section}、,
    number=\arabic{section},
    format=\zihao{-3} \FakeBold,
    aftername=~,
    beforeskip=0pt,
    afterskip=0pt,
  },
  subsection={
    % number=\arabic{subsection}.,
    format=\zihao{4} \FakeBold,
    aftername=~,
    beforeskip=0pt,
    afterskip=0pt
  },
  subsubsection={
    % number=\arabic{subsection}.\arabic{subsubsection}.,
    format=\zihao{-4} \FakeBold,
    aftername=~,
    beforeskip=0pt,
    afterskip=0pt
  },
  paragraph={
    format=\zihao{-4} \FakeBold,
    beforeskip=0pt,
    afterskip=0pt,
    indent=2em,
  },
  subparagraph={
    format=\zihao{-4} \FakeBold,
    beforeskip=0pt,
    afterskip=0pt,
    indent=4em,
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
\newcites{fin}{~}

%% 采用IEEEtran参考文献样式，
%% 针对要求进行修改
\bibliographystylefin{./style/gbt7714-2005}

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
\newcommand\remark[1]{\def\ZJU@value@remark{#1}}
\newcommand\result[1]{\def\ZJU@value@result{#1}}
\newcommand\acknowledgement[1]{\def\ZJU@value@acknowledgement{#1}}
\newcommand\cnabstract[1]{\def\ZJU@value@cnabstract{#1}}
\newcommand\cnkeywords[1]{\def\ZJU@value@cnkeywords{#1}}
\newcommand\enabstract[1]{\def\ZJU@value@enabstract{#1}}
\newcommand\enkeywords[1]{\def\ZJU@value@enkeywords{#1}}
%\newcommand\chinesedate[1]{\def\ZJU@value@chinesedate{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \zihao{3}
    \vspace*{5mm}
    \begin{center}
      \includegraphics[width=100mm]{./style/logo/ZJDX.pdf}\par
      \vspace{22.5mm}
      {\zihao{-1} \bfseries \ZJU@label@project}
      \par
      \vspace{8mm}
      {\zihao{-1} \bfseries \ZJU@label@proposal}
      \par
      % \vspace{8mm}
      % \includegraphics[width=30.9mm]{./style/logo/QSY.pdf}
    \end{center} 
    \vspace{32mm}

    \def\tabcolsep{1pt}
    \def\arraystretch{1.2}
    \hskip 15pt
    \begin{tabular}{lc}
      \fangsong
      \FakeBold{\zihao{3} \ZJU@label@title} & \ZJUunderline[270pt]{\zihao{4} \FakeBold{\ZJU@value@title}} \vspace{8mm} \\
      \FakeBold{\zihao{3} \ZJU@label@author} & \ZJUunderline[270pt]{\zihao{4} \FakeBold{\ZJU@value@author}} \\
      \FakeBold{\zihao{3} \ZJU@label@grademajor} &  \ZJUunderline[270pt]{\zihao{4} \FakeBold{\ZJU@value@grademajor}} \\
      \FakeBold{\zihao{3} \ZJU@label@advisor} & \ZJUunderline[270pt]{\zihao{4} \FakeBold{\ZJU@value@advisor}} \\
      \FakeBold{\zihao{3} \ZJU@label@college} & \ZJUunderline[270pt]{\zihao{4} \FakeBold{\ZJU@value@college}} \\
      %\ZJU@label@date & \ZJUunderline[295pt]{\ZJU@value@chinesedate}
    \end{tabular}

    \vspace*{50pt}
  \end{center}

  \clearpage
}

\newcommand\makecommitment{%
  \newpage
  \begingroup
    \zihao{4}
    \vspace*{5mm}
    \begin{center}
      {\zihao{3} \heiti 浙江大学本科生毕业论文诚信承诺书}
      \par
    \end{center}
    \par
    \vspace*{2mm}
    \begin{enumerate}[itemindent=3.5em, leftmargin=2em, rightmargin=2em]
      \item 本人郑重地承诺所呈交的毕业论文，是在指导教师的指导下严格按照学校和学院有关规定完成的。
      \item 本人在毕业论文中引用他人的观点和参考资料均加以注释和说明。
      \item 本人承诺在毕业论文选题和研究内容过程中没有抄袭他人研究成果和伪造相关数据等行为。
      \item 在毕业论文中对侵犯任何方面知识产权的行为，由本人承担相应的法律责任。
    \end{enumerate}
    \vspace*{\fill}
    \begin{flushright}
      作者专业班级 \ZJUunderline[100pt]{} 学号 \ZJUunderline[100pt]{} \par
      作者签名 \ZJUunderline[100pt]{}
    \end{flushright}
  \endgroup

  \clearpage
}

\newcommand\makeacknowledgement{%
  \newpage
  \begingroup
    \zihao{-4}
    \begin{center}
      \zihao{3} \FakeBold{致谢} \par
    \end{center}
    \par
    \ZJU@value@acknowledgement \par
  \endgroup

  \clearpage
}

\newcommand\makeabstract{%
  \newpage
  \begingroup
    \zihao{-4}
    \begin{center}
      \zihao{3} \FakeBold{摘要} \par
    \end{center}
    \par
    \ZJU@value@cnabstract \par
    \begin{flushleft}
      关键词：\ZJU@value@cnkeywords \par
    \end{flushleft}

    \vspace*{22.5mm}
    
    \begin{center}
      \zihao{3} \FakeBold{Abstract}
    \end{center}
    \par
    \ZJU@value@enabstract \par
    \begin{flushleft}
      Keywords: \ZJU@value@enkeywords \par
    \end{flushleft}
  \endgroup

  \clearpage
}
%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
