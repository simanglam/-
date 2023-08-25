\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{NGPLB}[基於LaTeX Class: report and 交大論文格式]
\ProcessOptions\relax

\LoadClassWithOptions{report}
\PassOptionsToClass{\CurrentOption}{report}
\input{trans.def}
\RequirePackage[center]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[encoding=UTF8,style={Traditional}]{zhnumber}%Financial
\RequirePackage[]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xpatch}
\RequirePackage{tocloft}
\RequirePackage{xcolor}

\definecolor{structurecolor}{RGB}{60,113,183}
\definecolor{main}{RGB}{0,166,82}%
\definecolor{second}{RGB}{255,134,24}%
\definecolor{third}{RGB}{0,174,247}%

\geometry{top= 2cm,left=2cm,right=2cm,bottom=2cm}
\fancypagestyle{plain}{%
\fancyhf{}%
\cfoot{-\hskip1.5pt\thepage\hskip2pt-}
\renewcommand{\headrulewidth}{0pt}% Line at the header invisible
}
\pagestyle{plain}

%setfont
\usepackage[fontset=none]{ctex}
\setCJKmainfont[BoldFont = 原之味黑體 TW Bold]{原之味黑體 TW Normal}

%\RequirePackage{}
\xpatchcmd{\@chapter}{\addcontentsline{toc}{chapter}%
{\protect\numberline{\thechapter}#1}%
}{ 
\addcontentsline{toc}{chapter}%
{\protect\numberline{第\thechapter 章} #1}%
}{ }{ }
\xpatchcmd{\chapter}{\thispagestyle{plain}}{ }{ }{ }
\xpatchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{ }{ }{ }
\xpatchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{ }{ }{ }
\xpatchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{\vskip12pt}{}{}

\counterwithout{equation}{chapter}
\counterwithout{section}{chapter}
\counterwithin{subsection}{section}
\counterwithout{table}{chapter}
\counterwithout{figure}{chapter}

\newcommand{\xchaptertitle}{第\thechapter 章}
\newcommand{\xthepart}{第\@zhnum\c@part 部}
%重新定義標題的計數器
\renewcommand \thepart {第\@zhnum\c@part 部}
\renewcommand \thechapter {\@zhnum\c@chapter}
\renewcommand \thesection {第\@zhnum\c@section 條}
\renewcommand \thesubsection {\@zhnum\c@subsection 、}
\renewcommand \thefigure {\@arabic\c@chapter.\@arabic\c@figure }

\renewcommand{\partname}{\thispagestyle{empty}\color{structurecolor}}
\renewcommand{\chaptermark}[1]{\markboth{\xchaptertitle\, #1}{}}
%\titleformat{⟨command ⟩}[⟨shape ⟩]{⟨format ⟩}{⟨label ⟩}{⟨sep ⟩}{⟨before-code ⟩}[⟨after-code ⟩]
\titleformat{\part}{\thispagestyle{empty}\Huge\centering\bfseries\color{structurecolor}}{\noindent\thepart}{0em}{\\}
\titleformat{\chapter}{\bf\large}{\xchaptertitle}{.1em}{\hskip10pt}
\titleformat{\section}{\fontsize{10}{15}\selectfont}{\thesection}{.1em}{\hskip10pt}
\titleformat{\subsection}{\fontsize{10}{15}\normalsize}{\thesubsection}{.1em}{\hskip10pt}

\renewcommand{\cftfigpresnum}{圖}
\renewcommand{\cfttabpresnum}{圖}


%重新定義chapter後的空間
%\titlespacing*{⟨command⟩}{⟨left⟩}{⟨beforesep⟩}{⟨aftersep⟩}[⟨right⟩]
\titlespacing*{\chapter}{0pt}{0pt}{5pt}
\titlespacing*{\section}{20pt}{0pt}{5pt}
\titlespacing*{\subsection}{-5pt}{0pt}{5pt}

%定義目錄中的縮進
%\titlecontents{section}[left]{above}{before with label}{before without label}{filler and page}[after]
\titlecontents{part}[20mm]{ }{\contentslabel{50pt}}{\hspace{-50pt}}{\titlerule*[10pt]{.}\contentspage}[\vskip6pt{\pagebreak[3]}]
\titlecontents{chapter}[20mm]{ }{\contentslabel{50pt}}{\hspace{-50pt}}{\titlerule*[10pt]{.}\contentspage}[\vskip6pt{\pagebreak[1]}]
\titlecontents{section}[20mm]{ }{\contentslabel{36pt}}{\hspace{-36pt}}{\titlerule*[10pt]{.}\contentspage} [\vskip6pt{\pagebreak[1]}]
\titlecontents{subsection}[20mm]{ }{\contentslabel{36pt}}{\hspace*{-8mm}}{\titlerule*[10pt]{.}\contentspage}[\vskip6pt{\pagebreak[1]}]
\pagenumbering{arabic}

\RequirePackage{enumerate}
% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\AddEnumerateCounter{\chinese}{\chinese}{\quad}

\setlist[enumerate,1]{label=第\chinese* 章, leftmargin=!, labelwidth=!, labelindent = 0pt, format =\bf\large, first =\bf\large, align=left}
\setlist[enumerate,2]{label=第\chinese* 條, leftmargin=30pt, labelwidth=5pt, labelindent = 10pt, itemindent = -25pt, labelsep = 10pt, resume, first = \normalsize\normalfont, format =\normalsize\normalfont, align=left}
\setlist[enumerate,3]{label=\chinese* 、, leftmargin=30pt, labelwidth=5pt, labelindent = 10pt, itemindent = -25pt, labelsep = 10pt, align=right}
\setlist[enumerate,4]{label=\color{structurecolor}\Alph*.}
\setlength{\itemsep}{15pt}
\setlength{\parsep}{15pt}

% Redefined \maketitle command

\renewcommand{\maketitle}{
\begin{center}
\huge\bf\@title
\end{center}
}

\endinput