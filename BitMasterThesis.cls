% !Mode:: "TeX:UTF-8" 
% 以上一行不可删除，是为了确保WinEdit能够以UTF-8的格式打开本文件。

% 请注意，本文档的注释部分，如果在注释符”%“的后面加上一竖杆”|“，
% 则表示引用规范的内容。例如：” % | 学位论文的书脊用黑体三号 ......“

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{BitMasterThesis}
	[2015/01/04 BitMasterThesis document class]
\newif\ifCAST@typeinfo \CAST@typeinfotrue
\DeclareOption{notypeinfo}{\CAST@typeinfofalse}
\newif\ifCAST@dvips \CAST@dvipsfalse
\DeclareOption{dvips}{\CAST@dvipstrue}
\DeclareOption{dvipdfm}{\CAST@dvipsfalse}
\DeclareOption{pdftex}{\CAST@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions
\LoadClass[
a4paper,% A4页面 %
cs4size,% 设置小四字号为缺省字体大小 %
punct,% 对中文标点的位置(宽度)进行调整 %
fancyhdr,% 调用fancyhdr宏包 %
fntef,
UTF8
]{ctexbook}

%% 导入 bitmaster-xetex.cfg 文件
\AtEndOfPackage{\makeatletter\input{BitMasterThesis.cfg}\makeatother}

\usepackage[%
square,% 方括号 %
numbers,% 数字 %
sort&compress% 排序 %
]{natbib}% 参考文献格式的设置 %				

\usepackage[%
xetex,
bookmarksnumbered,%
CJKbookmarks,% 中文标签	 %
colorlinks=true,% 彩色链接 %
citecolor=blue,%
linkcolor=blue,%
urlcolor=blue,%
plainpages=false,%
pdfstartview=FitH
]{hyperref}% 设置超链接 %


\usepackage[%
paper=a4paper,%
top=3.5cm,% 上 3.5cm %
bottom=2.5cm,% 下 2.5cm %
left=2.7cm,% 左 2.7cm %
right=2.7cm,% 右 2.7cm %
headheight=1.0cm,% 页眉 2.5cm %
footskip=0.7cm% 页脚 1.8cm %
]{geometry} % 页面设置 %

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\baselineskip=22pt %行距 22 磅 %
\RequirePackage{setspace}



%% 设置章节格式
\CTEXsetup[number={\arabic{chapter}},name={第,章},
            nameformat={\bfseries\heiti\centering\zihao{3}},
            titleformat={\bfseries\heiti\zihao{3}},
            aftername={\quad}]{chapter}
\CTEXsetup[nameformat={\bfseries\heiti\zihao{4}},
            titleformat={\bfseries\heiti\zihao{4}}]{section}
\CTEXsetup[nameformat={\bfseries\heiti\zihao{-4}},
            titleformat={\bfseries\heiti\zihao{-4}}]{subsection}
\CTEXsetup[nameformat={\bfseries\zihao{-4}},
            titleformat={\bfseries\zihao{-4}}]{subsubsection}
\CTEXsetup[format={\Large\bfseries}]{section}
\CTEXsetup[beforeskip={10pt}]{chapter}


%% 用\textsf{titletoc}设定目录格式。
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \songti \zihao{4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2em]{\songti \zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4em]{\songti \zihao{-4}}
    {\thecontentslabel\quad}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
%\RequirePackage{ifpdf}

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

%% 复杂表格
%\RequirePackage{threeparttable}
%\RequirePackage{dcolumn}
%\RequirePackage{multirow}
%\RequirePackage{booktabs}
%\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

\usepackage{fontspec}
%\usepackage{times}
\usepackage{mathptmx}
%\RequirePackage{xltxtra} % \XeTeX Logo
\usepackage[T1]{fontenc}

% ccaption -- bicaption
\RequirePackage{ccaption}
\captiondelim{\ }
\captionnamefont{\songti\zihao{5}}
\captiontitlefont{\songti\zihao{5}}


%_ added by wei.jianwen@gmail.com
% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


% 定公式、图、表编号为"3-1"的形式，即分隔符由.变为短杠
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}



%_ CASTspace
\newcommand\CASTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\CAST@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\CASTfiledate{#1}%
  \def\CASTfileversion{#2}%
  \def\CASTfileinfo{#3}}%
\expandafter\ifx\csname ver@bitmaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_bitmaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@bitmaster-xetex.cls\endcsname}
\fi
\expandafter\CAST@getfileinfo\reserved@a\relax? ? \relax\relax
\def\CAST@underline[#1]#2{%
  \CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\CASTunderline{\@ifnextchar[\CAST@underline\CTEXunderline}

%%%%中文标题页的可用命令
\newcommand\classification[1]{\def\CAST@value@classification{#1}}
\newcommand\UDC[1]{\def\CAST@value@UDC{#1}}
\newcommand\serialnumber[1]{\def\CAST@value@serialnumber{#1}}
\newcommand\school[1]{\def\CAST@value@school{#1}}
\newcommand\degree[1]{\def\CAST@value@degree{#1}}
\renewcommand\title[2][\CAST@value@title]{%
  \def\CAST@value@title{#2}
  \def\CAST@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\CAST@value@author{#1}}
\newcommand\advisor[1]{\def\CAST@value@advisor{#1}}
\newcommand\major[1]{\def\CAST@value@major{#1}}
\newcommand\submitdate[1]{\def\CAST@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\CAST@value@defenddate{#1}}
\newcommand\institute[1]{\def\CAST@value@institute{#1}}
\newcommand\chairman[1]{\def\CAST@value@chairman{#1}}


%% 第一页和第二页
%_ “绘制”BIT中文标题页
\renewcommand\maketitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}  
  \begin{center}
    \vspace*{72mm}
       {\heiti \zihao{-2} \CAST@value@title}
    \vskip 45mm
    {\heiti \zihao{-2} \CAST@value@author}
     \vskip 8mm
    {\songti \zihao{4} \CAST@value@defenddate}
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifCAST@typeinfo
    \fi
    \cleardoublepage
  \fi
 
  \newpage
  \cleardoublepage
  \thispagestyle{empty}

%udc ltz
{
  {\heiti \zihao{5} \noindent \CAST@label@classification} \CAST@value@classification \\ 
  {\heiti \zihao{5} \CAST@label@UDC}  \CAST@value@UDC 
}
  
   \begin{center}

    \vskip \stretch{0.8}
       {\heiti\zihao{-2} \CAST@value@title}
    \vskip \stretch{1}

    {\fangsong\zihao{4}}      
    \def\tabcolsep{1pt}
    \def\arraystretch{1.2}

    {\heiti\zihao{-3}
     \begin{tabular}{l p{5mm} c}
      \CAST@label@author & & \CASTunderline[150pt]{\CAST@value@author}
    \\
      \CAST@label@institute & & \CASTunderline[150pt]{\CAST@value@institute}
    \\
      \CAST@label@advisor & & \CASTunderline[150pt]{\CAST@value@advisor}
    \\  
      \CAST@label@chairman & &  \CASTunderline[150pt]{\CAST@value@chairman}
    \\  
      \CAST@label@degree & &   \CASTunderline[150pt]{\CAST@value@degree}
    \\  
      \CAST@label@major & &    \CASTunderline[150pt]{\CAST@value@major}
    \\  
      \CAST@label@school & &    \CASTunderline[150pt]{\CAST@value@school}
    \\  
      \CAST@label@defenddate & &  \CASTunderline[150pt]{\CAST@value@defenddate}
    \end{tabular}}

  \end{center} 

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifCAST@typeinfo
    \fi
    \cleardoublepage
  \fi
}


% English Title Page
% 英文标题页可用命令
\newcommand\englishtitle[1]{\def\CAST@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\CAST@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\CAST@value@englishadvisor{#1}}
\newcommand\englishschool[1]{\def\CAST@value@englishschool{#1}}
\newcommand\englishinstitute[1]{\def\CAST@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\CAST@value@englishdate{#1}}
\newcommand\englishdegree[1]{\def\CAST@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\CAST@value@englishmajor{#1}}
\newcommand\englishchairman[1]{\def\CAST@value@englishchairman{#1}}

% "绘制"英文标题页
\newcommand\makeenglishtitle[1]{%
  \cleardoublepage
  \thispagestyle{empty}
  
   \begin{center}

  
   \vspace*{7em}
  
   {\zihao{-2}\textbf{\CAST@value@englishtitle}}
  
   \vskip \stretch{0.5}
		\def\arraystretch{1}
   {\zihao{-3}
     \begin{tabular}{lc}
      \CAST@label@englishauthor & \CASTunderline[220pt]{\CAST@value@englishauthor}
    \\
      \CAST@label@englishinstitute &  \CASTunderline[220pt]{\CAST@value@englishinstitute}
    \\
      \CAST@label@englishadvisor &  \CASTunderline[220pt]{\CAST@value@englishadvisor}
    \\  
      \CAST@label@englishchairman &   \CASTunderline[220pt]{\CAST@value@englishchairman}
    \\  
      \CAST@label@englishdegree &    \CASTunderline[220pt]{\CAST@value@englishdegree}
    \\  
      \CAST@label@englishmajor &     \CASTunderline[220pt]{\CAST@value@englishmajor}
    \\  
      \CAST@label@englishschool &     \CASTunderline[220pt]{\CAST@value@englishschool}
    \\  
      \CAST@label@englishdate &   \CASTunderline[220pt]{\CAST@value@englishdate}
    \end{tabular}}

  \end{center} 

  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
  \thispagestyle{empty}
   \cleardoublepage
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 书脊：
% |学位论文的书脊用黑体三号，上方写论文题目，下方写“北京理工大学”，
% |论文题目与“北京理工大学”间距2cm；													
% |论文题目距上边界、“北京理工大学”距下边界均为5cm。 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand \makeVerticalTitle{
   \cleardoublepage
   \thispagestyle{empty}
   \vspace*{4mm}
   \begin{center}
   {
    \heiti\zihao{3}
   \setstretch{0.8}   
   \begin{minipage}{1.9em}
        \CAST@value@title
        \vskip 20mm
        \CAST@value@school
   \end{minipage}
   }
   \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
  
}
% 原创性声明
\newcommand\makeDeclareOriginal{%
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{3mm}
  \begin{center}
  %{\bf\zihao{3} \CAST@value@school}\\
  {\bf\zihao{3} \CAST@label@original}
  \end{center}
  \vskip 10pt
  {\zihao{4}\CAST@label@originalcontent}
  \vskip 30pt
  \hspace{10em}\CAST@label@authorsign
  \hspace{7em}\CAST@label@originalDate

  \vskip 40mm

  \begin{center}
  %{\bf\zihao{3} \CAST@value@school}\\
  {\bf\zihao{3} \CAST@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{4} \CAST@label@authorizationcontent}
  \vskip 30pt
  
  \hspace{10em}\CAST@label@authorsign
  \hspace{7em}\CAST@label@originalDate\hfill  
  \vskip 15pt
  \hspace{10em}\CAST@label@Supervisorsign
  \hspace{7em}\CAST@label@originalDate
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
  
}


%_ 中文摘要
 \newenvironment{abstract}
 %{\chapter[\heiti 摘要]{\CAST@value@title\vskip 20pt\CAST@label@abstract}}
 % 不显示论文题目
 {
  \cleardoublepage
  \vspace*{3mm}
  \begin{center}
    { \heiti\zihao{3} \CAST@label@abstract}
  \end{center}
  
   %\chapter{\CAST@label@abstract}
 }
 {}
%下一页从偶数页开始
 \newcommand\beginatevenpage{
 \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
 } 
 %_ 中文关键词
 \newcommand\keywords[1]{%
   \vspace{2ex}\noindent{\bf \CAST@label@keywords} #1}

 %_ 英文摘要
 \newenvironment{englishabstract}
 {
  \clearpage
  \vspace*{3mm}
  \begin{center}
    { \bf\zihao{3} \CAST@label@englishabstract}
  \end{center}
%\chapter{\CAST@label@englishabstract}
 }
 {}

 % _英文摘要
 \newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \CAST@label@englishkeywords} #1}

%ltz add
%\RequirePackage{titletoc}
%\makeatletter
%\renewcommand\section{{\ziti{1}}}
%\makeatother
%_ 目录
\renewcommand\tableofcontents{%
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname}%目录里显示“目录”，否则\chapter*
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}

\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}

    
%\newenvironment{publications}[1]
%     {\chapter{\CAST@label@publications}%
%      \@mkboth{\MakeUppercase\CAST@label@publications}
%              {\MakeUppercase\CAST@label@publications}%
%      \list{\@biblabel{\@arabic\c@enumiv}}%
%           {\settowidth\labelwidth{\@biblabel{#1}}%
%            \leftmargin\labelwidth
%            \advance\leftmargin\labelsep
%            \@openbib@code
%            \usecounter{enumiv}%
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `publications' environment}}%
%      \endlist}


   
%\renewenvironment{thanks}
%  {\chapter{\CAST@label@thanks}}
%  {}
 

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{3}     % 目录深度 (part 对应 -1)
    
    

%% End of file `bitmaster-xetex.cls'.


