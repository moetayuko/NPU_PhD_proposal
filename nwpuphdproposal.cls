\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nwpuphdproposal}[2014/08/16 Example LaTeX class]
\PassOptionsToPackage{AutoFakeBold}{xeCJK}
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,fontset=windows,zihao=-4]{ctexart}

\RequirePackage{fancybox}
\setlength{\fboxrule}{1.5pt}
\setlength{\fboxsep}{5pt}
\fancypage{\fbox}{}

\RequirePackage[top=2.2cm, bottom=\dimexpr 2.2cm+2\fboxrule+2\fboxsep, left=2.4cm, right=\dimexpr 2.4cm+2\fboxrule+2\fboxsep]{geometry}

\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\cfoot{\zihao{-5} -\ \thepage\ -}
\pagestyle{fancyplain}

\RequirePackage{amssymb}
\RequirePackage{xstring}

\setmainfont{Times New Roman}

\ctexset{
	section = {
	  name = {,、},
	  number = \chinese{section},
	  format = \zihao{-4}\heiti,
	  aftername={ },
	  beforeskip=1ex plus .2ex minus .2ex,
	  afterskip=1ex plus .2ex
	 },
	subsection = {
			format = \zihao{-4}\heiti,
		},
}

\RequirePackage{marvosym}

\newcommand{\hruleinbox}{\par\noindent\hspace{-\fboxsep}%
	\rule{\dimexpr\linewidth+2\fboxsep}{0.5pt}\par}

\NewDocumentCommand{\secdesc}{sm}{%
	\begingroup
	\ctexset{
		subsection = {
				name = {,.},
				number = \arabic{subsection},
				format = \kaishu,
				aftername={},
				beforeskip=1ex plus .2ex minus .2ex,
				afterskip=1ex plus .2ex
			},
	}
	\IfBooleanTF{#1}{\subsection*{#2}}{\subsection{#2}}
	\endgroup
}

\newenvironment{nomargin}[1][vh]{%
	\par\noindent%
	\begin{minipage}{\dimexpr\linewidth+2\fboxsep}%
		\IfSubStr{#1}{v}{\vspace*{-\fboxsep}}{}%
		\IfSubStr{#1}{h}{\hspace*{-\fboxsep}}{}%
		\ignorespaces%
		}{%
	\end{minipage}%
}

\usepackage{tabularray}

\newif\ifnwpu@review
\nwpu@reviewfalse
\DeclareOption{review}{\nwpu@reviewtrue}
\ProcessOptions\relax

\newcommand{\nwpu@school}{***}
\newcommand{\nwpu@uid}{***}
\newcommand{\nwpu@advisor}{***}

\ifnwpu@review
\newcommand{\school}[1]{}
\newcommand{\studentnumber}[1]{}
\newcommand{\advisor}[1]{}
\newcommand{\nwpu@author}{***}
\else
\newcommand{\school}[1]{\renewcommand{\nwpu@school}{#1}}
\newcommand{\studentnumber}[1]{\renewcommand{\nwpu@uid}{#1}}
\newcommand{\advisor}[1]{\renewcommand{\nwpu@advisor}{#1}}
\newcommand{\nwpu@author}{\@author}
\fi

\newcommand{\nwpu@major}{}
\newcommand{\major}[1]{\renewcommand{\nwpu@major}{#1}}

\newcommand{\nwpu@chs@schoolname}{西北工业大学}
\newcommand{\nwpu@chs@doctitle}{研究生学位论文开题报告表}

\newcommand{\make@nwpu@title}{                              % 设置中文标题页
	\thisfancypage{}{}
	\thispagestyle{empty}                                       % 清空页面格式
	\newlength{\chstitle@hwidtha}                               % 大标题宽度
	\settowidth{\chstitle@hwidtha}{\bfseries\kaishu\zihao{1}\nwpu@chs@schoolname}%
	\newlength{\chstitle@hwidthb}                               % 小标题宽度
	\settowidth{\chstitle@hwidthb}{\bfseries\kaishu\zihao{1}\nwpu@chs@doctitle}   %
	\newlength{\coverpage@detailwidth}                          % 具体信息对齐宽度
	\settowidth{\coverpage@detailwidth}{\kaishu\zihao{-3} 学科、专业}
	\begin{titlepage}                                           %
		\linespread{1} \songti \zihao{5} \par                   % 1 倍行距
		\vspace*{6\baselineskip}                                 % => 1 * 21pt * 1.5
		\begin{center}                                          %
			\makebox[1.41667\chstitle@hwidtha][s]{\bfseries\kaishu\zihao{1}\nwpu@chs@schoolname} \par
			\vspace*{2cm}                                       %
			\makebox[\chstitle@hwidthb][s]{\bfseries\kaishu\zihao{1}\nwpu@chs@doctitle} \par
			\vspace*{3cm}
			{\zihao{4}\kaishu 攻读学位级别：\quad$\surd$ 博士\hspace{3em}$\Box$ 硕士}\par
			\vspace*{1.8cm}
			\begin{tblr}{
					hline{2-Z}={2}{solid},
					rows={rowsep=7pt},
					column{1}={
							font=\zihao{-3}\kaishu,
							cmd=\makebox[\coverpage@detailwidth][s]
						},
					column{2}={l,m,\dimexpr 7.03cm-12pt}, % 12pt=\leftsep+\rightsep
				}
				学院    & \nwpu@school  \\
				姓名    & \nwpu@author      \\
				学号    & \nwpu@uid     \\
				学科、专业 & \nwpu@major   \\
				指导教师  & \nwpu@advisor \\
				填表日期  & \@date
			\end{tblr}
			\par\vspace*{4cm}
			{\kaishu\zihao{-3}西北工业大学研究生院}
		\end{center}                                            %
	\end{titlepage}
}

\RequirePackage{enumitem}

\newcommand{\make@nwpu@requirement}{                              % 设置中文标题页
	\thisfancypage{}{}
	\thispagestyle{empty}                                       % 清空页面格式
	\begin{titlepage}                                           %
		\linespread{1.5}\kaishu\zihao{4}
		\begin{center}
			\zihao{-2}\textbf{研究生学位论文开题报告的要求}
		\end{center}
		\vspace*{\baselineskip}
		\begin{enumerate}[label = \chinese*、]
			\item 硕士生的开题报告内容应包括文献综述、选题意义、研究内容、研究方案，论文工作量的估计、工作条件，预期达到的水平，存在的问题及拟采取的解决措施。
			\item 博士生的开题报告内容应包括文献综述、选题背景及其意义、研究内容、研究特色、工作难点、预期成果及其可能的创新点。
			\item 正式开题之前，研究生应在广泛阅读中、外文资料的基础上，深入了解拟选课题的国内外研究动态，把握所选课题的目的、意义和预期结果，明确课题工作的设想、方法和研究路径。
			\item 博士生在规定的时间内，写出开题报告初稿，经指导教师审阅同意后，进行开题报告的送审。开题报告评审未通过者，修后重新送审，若第二次送审仍通不过者，则按有关规定终止学籍。
			\item 不能按期申请开题评议者，应及时向学院提出延期申请。
			\item 本表若不够填写时，可另加附页。
		\end{enumerate}
	\end{titlepage}
}

\def\@maketitle{%
	\make@nwpu@title
	\make@nwpu@requirement
}

\RequirePackage[style=gb7714-2015,backend=biber]{biblatex}

\renewcommand*{\mkbibnamegiven}[1]{%
	\ifitemannotation{highlight}
	{\textbf{#1}}
	{#1}}

\renewcommand*{\mkbibnamefamily}[1]{%
	\ifitemannotation{highlight}
	{\textbf{#1}}
	{#1}}

% vim: ts=2 sw=2 expandtab
