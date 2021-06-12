\NeedsTeXFormat{LaTeX2e}% 必选项，class类都要写
\ProvidesClass{nuist}[2021/06/06 南京信息工程大学硕博大论文模板]% 对外提供的接口

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 载入预定义模板，在此基础上更改                                 
%%
%% a4paper：    A4 页面
%% twoside：    双面，指定当页码为奇数时出现在右边，为偶数时出现在左边
%% openright：  指定新的一章 \chapter 在奇数页（右侧）开始
%% fntef:       引入  CJKfntef 宏包，方便文字装饰
%% 字号：       只有 10pt 11pt 12pt 可选
%% scheme:      chinese 调整默认字号为五号字，并调整行距为1.3；汉化文档中
%%              的标题名字（如“图”、“表”、“目录”和“参考文献”）；在heading = true 
%%              的情况下，还会将章节标题的风格修改为中文样式
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,twoside,openright,fntef, heading=true,12pt,scheme=chinese]{ctexbook}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%         设置默认字体、行距
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 设置默认中文字体 
% 正文字体为宋体，粗体为黑体，斜体为楷体，粗斜体为隶书
\RequirePackage{xeCJK}
\setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi, BoldItalicFont=LiSu]{SimSun} 

% 设置默认英文字体 Times New Roman
\RequirePackage{times}
\setmainfont{Times New Roman} 

% 设置 1.5 倍行距
\RequirePackage{setspace}
\setstretch{1.5}
% 每个自然段之间增加 10% 的距离
\setlength{\parskip}{0.1\baselineskip}  



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                     
%%               页面尺寸    
%%                                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         

\RequirePackage{geometry}
\geometry{
	top=2.1cm,          % 上边距
	bottom=2.5cm,       % 下边距
	left=2.5cm,         % 左边距
	right=2.5cm,        % 右边距
	headsep=3mm ,       % 页眉线到正文距离
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%                    设置超链接
%%		CJKbookmarks=true       支持中文书签
%%		colorlinks=true         使用彩色链接
%%		linkcolor=blue          内部普通链接的颜色
%%		citecolor=blue		    引用标记颜色
%%		urlcolor=pink           url链接的颜色
%%		breaklinks=true         允许在链接处换行
%%		anchorcolor = black     anchor链接的颜色
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[dvipsnames, svgnames, x11names]{xcolor}
\RequirePackage[CJKbookmarks=true,colorlinks=true,linkcolor=black,citecolor=blue,urlcolor=cyan,breaklinks=true,anchorcolor=blue]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                     
%%            页眉页脚格式    
%%                                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

\RequirePackage{emptypage}
\RequirePackage{fancyhdr}
% 修改页眉格式
\renewcommand\chaptermark[1]{
	\markboth{\CTEXthechapter~#1}{\CTEXthechapter~#1}
}
% 使用fancy页面风格
\pagestyle{fancy}  
% 清空原有页眉页脚
\fancyhf{}  

% 偶数页页眉
\fancyhead[CE]{\zihao{-5} 南京信息工程大学硕士学位论文}
% 奇数页页眉为 第*章 章题目
\fancyhead[CO]{\zihao{-5} \leftmark}
% 页脚页码居中
\fancyfoot[CE,CO]{\thepage}  % 页码居中
% 页码使用阿拉伯数字
\pagenumbering{arabic}  

\fancypagestyle{plain}{ 
	\fancyhf{}
	% 奇数页页眉为 第*章 章题目
	\fancyhead[CO]{\leftmark}
	\fancyfoot[CO, CE]{\Roman{\thepage}}
	
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%                定制章节标题格式
%%
%% beforeskip:
%%       其绝对值表示标题到上文之间的距离。若是此距离为负数，
%%   则标题后面的第一个段落不缩进。此度量最好是一个可以被伸长
%%   和缩短的长度。另外标题总是另起一段的。因而parskip已被加
%%   入到标题与上下文的距离。
%% afterskip:
%%       其绝对值表示独立显示的标题到下文之间的垂直间距或者是
%%   段内显示的标题到下文之间的距离。此度量若是负的，则定义的
%%   标题是段内显示的。对于独立显示的标题，parskip也已被加进
%%   标题与下文的距离
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ctexset{
	contentsname = 目\quad 录,
	chapter = {
		format = \zihao{-3}\songti\bf\centering ,
		pagestyle = fancy,
		beforeskip = -20pt,
		afterskip = 10pt
	},
	section = {
		format = \zihao{4}\songti\bf,
		name = {},
		number = \thesection,
		aftername = \hspace{0.5em},
		beforeskip = 1em,
		afterskip = 0.5em
	},
	subsection = {
		format = \zihao{-4} \songti\bf,
		name = {},
		number = \thesubsection,
		aftername = \hspace{0.5em},
		beforeskip = 0.4em,
		afterskip = 0.2em,
	},
	subsubsection = {
		format = \zihao{-4} \songti,
		name ={},
		aftername = {\hspace{0.5em}},%{.\hspace{0.5em}},
		beforeskip = 0.1em,
		afterskip = 0.1em,
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%        设置公式环境（目前用不到多少，只引入包）
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{yhmath}
\RequirePackage{eucal}
% 字母字体
\RequirePackage{amssymb,mathrsfs}
\RequirePackage{hologo}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%            设置图表环境
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 表格所需宏包
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{tabularx}
\RequirePackage{booktabs}

% 图片所需宏包
\RequirePackage{graphicx}
\RequirePackage{subfig}

% 修改图标标签格式为 “章节号-图表号 图表名”
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}

% 修正float体三种边距
\RequirePackage{float}
\setlength{\floatsep}{0.8em plus 0.2em minus 0.3em}
\setlength{\textfloatsep}{0.6em plus 0.1em minus 0.4em}
\setlength{\intextsep}{1em}

% 修改浮动体标题的格式
\RequirePackage{caption}
\captionsetup{font=small,labelsep=quad,belowskip = 0bp, aboveskip = 0bp}
\captionsetup[figure]{position = bottom, ,aboveskip = 10pt}
\captionsetup[table]{position = top, aboveskip = 4pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%          设置参考文献格式
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[numbers, sort, compress,comma,square,super]{natbib}
\setlength{\bibsep}{0.5em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%            设置目录
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[subfigure, titles]{tocloft}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setcounter{tocdepth}{2}  % 目录的深度，2 表示到 subsection


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%        格式设置完成，现在开始设置封面和原创声明
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[absolute]{textpos}   % textblock
\RequirePackage{array}               % tabular
\RequirePackage{boldline}            % \hlineB{num} \clineB{c1-c2}{num}

% 封面题目使用
\IfFileExists{STZhongsong.ttf}{%
	% 使用华文中宋 ttf 文件
	\newCJKfontfamily\Zhongsong{STZhongsong.ttf}[AutoFakeBold=4] 
	% 普通粗细的华文中宋
	\newCJKfontfamily\ZhongsongNormal{STZhongsong.ttf}[AutoFakeBold=false] 
}{
	% 使用系统华文中宋
	\newCJKfontfamily\Zhongsong{STZhongsong}[AutoFakeBold=4] 
	% 普通粗细的华文中宋
	\newCJKfontfamily\ZhongsongNormal{STZhongsong}[AutoFakeBold=false] 
}                   

\RequirePackage{afterpage}
\RequirePackage{xkeyval}
\RequirePackage{ifthen}
\RequirePackage{calc}


% 自定义分散对齐命令，第一个参数是文字长度，第二个参数是内容
\newcommand{\justify}[2]{
	\begin{CJKfilltwosides}{#1}
		#2
	\end{CJKfilltwosides}
}


\newlength{\templenth}
\newcommand{\limitjustify}[1]{
	\settowidth{\templenth}{#1}
	\ifthenelse{
		\lengthtest{\templenth > 3em}
	}{
		\justify{\templenth}{#1}
	}{
		\justify{3em}{#1}
	}
}

\providecommand{\titlesep}{\\ \cline{2-2} &}
\providecommand{\keysepcn}{，}  % 中文关键字分隔符
\providecommand{\keysepen}{,~}  % 英文关键字分隔符    

    
             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%          \print 打印版本
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifisprint\isprintfalse
\providecommand{\print}{
	\isprinttrue
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%          \blind 盲审
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifblindtrial\blindtrialfalse
\providecommand{\blind}{
	\blindtrialtrue
}   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%   定义key,这里可以用\nuist@XXX调用保存的值
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\define@cmdkeys{nuist}[nuist@]{
	classification,  % 分类号
	secret,          % 保密等级
	studentno,       % 学号
	degree,          % 学历
	title,           % 中文标题
	name,            % 申请人姓名
	mentor,          % 指导老师
	mentorrank,      % 指导老师职称
	major,           % 学科名称
	research,        % 研究方向
	institute,       % 学院名称
	year,            % 提交时间，年
	month,           % 提交时间，月
	day,             % 提交时间，日
	keywordscn,      % 中文关键词
	keywordsen       % 英文关键词 
}[none]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%         设置key默认值
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setkeys{nuist}{
	% 分类号
	classification=TP399,  
	% 保密等级
	secret=~,         
	% 学号 
	studentno=00000000000,
	%学历
	degree=硕士, 
	% 标题      
	title=南京信息工程大学 \titlesep 毕业论文\LaTeX 模板,    
	% 申请人姓名       
	name=姓名,   
	% 指导老师         
	mentor=指导老师,  
	% 指导老师职称        
	mentorrank=职称,  
	% 学科名称    
	major=专业, 
	% 研究方向        
	research=研究方向,
	% 培养学院         
	institute=学院,
	% 提交时间，年       
	year=2021, 
	% 提交时间，月           
	month=6,
	% 提交时间，日          
	day=10,  
	% 中文关键词           
	keywordscn=\LaTeX\keysepcn 毕业论文模板\keysepcn 南京信息工程大学,
	% 英文关键词    
	keywordsen=\LaTeX\keysepen Thesis Template\keysepen Nuist
}
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%      提供外部调用，输入必须信息
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\providecommand{\information}[1]{\setkeys{nuist}{#1}}   
                     
\RequirePackage{multicol}
\RequirePackage{xstring}

% 加入封面和声明
\providecommand{\includefrontmatter}{
	\setlength{\TPHorizModule}{1cm}  % textblock horiz length reference
	\setlength{\TPVertModule}{1cm}   % textblock verti length reference
	
	\pagestyle{empty}   % 封面页面样式
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%%
	%%         封面 开始		     
	%%
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	% 如果是盲审
	\ifblindtrial  
	% 盲审论文封面
	\begin{titlepage}
		% 封面头
		\begin{center}
			\zihao{5}{\; \\ \; \\}
			
			% NUIST
			\noindent\centering\includegraphics{logo/nuist}
			
			% 黑体35号“硕士学位论文”
			\setstretch{1}
			\zihao{-0}{
				\justify{9em}{
					\noindent\centering\heiti{\nuist@degree 学位论文}
				}
			}
			
			\zihao{5}{~}
			
			
			\; \\
			% logo
			\noindent\centering\includegraphics[width = 3.46cm, height = 3.46cm]{logo/nuist_logo}
			\; \\
			\; \\
			
			\zihao{5}{~}
			
			% 中文标题
			\setstretch{1.5}  
			\heiti\zihao{-2}
			\begin{tabularx}{1\linewidth}{r>{\centering\arraybackslash}X}
				论文题目：& \nuist@title \\ \cline{2-2}
			\end{tabularx}
			
			\setstretch{1}
			\begin{textblock}{13.2}(3.3, 18.5)
				\zihao{5} 
				\heiti \zihao{-3}
				\renewcommand\arraystretch{1.5}
				\begin{tabular}{>{\raggedleft\arraybackslash}p{3.8cm}>{\centering\arraybackslash}p{7.5cm}}
					学\hspace{0.34em}科\hspace{0.33em}名\hspace{0.34em}称：   & \nuist@major \\ \clineB{2-2}{2}
					
					研\hspace{0.34em}究\hspace{0.33em}方\hspace{0.34em}向：   & \nuist@research \\ \clineB{2-2}{2}
					
					培\hspace{0.34em}养\hspace{0.33em}学\hspace{0.34em}院：   & \nuist@institute \\ \clineB{2-2}{2}
					
					提\hspace{0.34em}交\hspace{0.33em}时\hspace{0.34em}间：   & \nuist@year ~年 \nuist@month ~月 \nuist@day ~日 \\ \clineB{2-2}{2} 
				\end{tabular}
			\end{textblock}
			
			
			% 日期部分
			\vspace*{\fill}                                % 空白填充
			\songti{
				\zihao{-2}{
					\zhdigits{\nuist@year}~年~\zhdigits{\nuist@month}~月
				}
			}
			\zihao{5}{~} 
		\end{center}
		
	\end{titlepage}	
	\else
	% 正常论文封面    
	\begin{titlepage}
		% 封面头
		\begin{multicols}{2}
			\begin{flushleft}
				\zihao{-4}{
					\makebox[3em][s]{分类号}：\underline{
						\makebox[7em]{\nuist@classification}
					}
				}\par
				\zihao{-4}{
					\makebox[3em][s]{密级}：\underline{
						\makebox[7em]{\nuist@secret}
					}
				}
			\end{flushleft}
			
			\begin{flushright}
				\zihao{-4}{
					\makebox[4em][s]{单位代码}：\underline{
						\makebox[7em]{10300}
					}
				}\par
				\zihao{-4}{
					\makebox[4em][s]{学号}：\underline{
						\makebox[7em][c]{\nuist@studentno~}
					}
				}
			\end{flushright}
		\end{multicols}
		
		\begin{center}
			~\\
			
			% NUIST
			\noindent\centering\includegraphics{logo/nuist}
			
			% 黑体35号“硕士学位论文”
			\setstretch{1}
			\zihao{-0}{
				\justify{9em}{
					\noindent\centering\heiti{\nuist@degree 学位论文}
				}
			}
			
			\zihao{5}{~}
			
			
			\; \\
			% logo
			\noindent\centering\includegraphics[width = 3.46cm, height = 3.46cm]{logo/nuist_logo}
			\; \\
			\; \\
			
			\zihao{5}{~}
			
			% 中文标题
			\setstretch{1.5}  
			\heiti\zihao{-2}
			\begin{tabularx}{1\linewidth}{r>{\centering\arraybackslash}X}
				论文题目：& \nuist@title \\ \cline{2-2}
			\end{tabularx}
			
			\setstretch{1}
			\begin{textblock}{13.2}(3.3, 17)
				\zihao{5} 
				\heiti \zihao{-3}
				\renewcommand\arraystretch{1.5}
				\begin{tabular}{>{\raggedleft\arraybackslash}p{3.8cm}>{\centering\arraybackslash}p{7.5cm}}
					申请人姓名：  & \limitjustify{\nuist@name} \\ \clineB{2-2}{2}
					
					指\hspace{0.34em}导\hspace{0.33em}教\hspace{0.34em}师：   & \limitjustify{\nuist@mentor} \\ \clineB{2-2}{2} 
					
					学\hspace{0.34em}科\hspace{0.33em}名\hspace{0.34em}称：   & \nuist@major \\ \clineB{2-2}{2}
					
					研\hspace{0.34em}究\hspace{0.33em}方\hspace{0.34em}向：   & \nuist@research \\ \clineB{2-2}{2}
					
					培\hspace{0.34em}养\hspace{0.33em}学\hspace{0.34em}院：   & \nuist@institute \\ \clineB{2-2}{2}
					
					提\hspace{0.34em}交\hspace{0.33em}时\hspace{0.34em}间：   & \nuist@year ~年 \nuist@month ~月 \nuist@day ~日 \\ \clineB{2-2}{2} 
				\end{tabular}
			\end{textblock}
			
			
			% 日期部分
			\vspace*{\fill}                                % 空白填充
			\songti{
				\zihao{-2}{
					\zhdigits{\nuist@year}~年~\zhdigits{\nuist@month}~月
				}
			}
			\zihao{5}{~} 
		\end{center}
		
	\end{titlepage}
	\fi
	
	\ifisprint
		\cleardoublepage
	\else
		\clearpage
	\fi
	
	% 独创性声明与授权说明
	\linespread{2}
	\zihao{-4}
	
	% 独创性声明
	\begin{center}    
		\songti{\bf{\zihao{-2}{独创性声明}}}
	\end{center}
	
	\songti{\zihao{-4}{本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。本论文除了文中特别加以标注和致谢的内容外，不包含其他人或其他机构已经发表或撰写过的研究成果，也不包含为获得南京信息工程大学或其他教育机构的学位或证书而使用过的材料。其他同志对本研究所做的贡献均已在论文中作了声明并表示谢意。}}
	
	\zihao{-4}{~}
	
	\zihao{-4}{学位论文作者签名：\underline{\hbox to 30mm{}} \hspace{4em} 签字日期：\underline{\hbox to 30mm{}}}
	
	\zihao{-4}{~}
	
	% 授权
	\begin{center}    
		\songti{\bf{\zihao{-2}{关于论文使用授权的说明}}}
	\end{center}
	
	\songti{\zihao{-4}{南京信息工程大学、国家图书馆、中国学术期刊（光盘版）杂志社、中国科学技术信息研究所的《中国学位论文全文数据库》有权保留本人所送交学位论文的复印件和电子文档，可以采用影印、缩印或其他复制手段保存论文，并通过网络向社会提供信息服务。本人电子文档的内容和纸质论文的内容相一致。除在保密期内的保密论文外，允许论文被查阅和借阅，可以公布（包括刊登）论文的全部或部分内容。论文的公布（包括刊登）授权南京信息工程大学研究生院办理。}}
	
	\zihao{-4}{$\square$公开 \hspace{1.5em} $\square$保密（\underline{\hbox to 12mm{}}年\underline{\hbox to 12mm{}}月）~(保密的学位论文在解密后应遵守此协议)}
	
	\zihao{-4}{~}
	
	\zihao{-4}{学位论文作者签名：\underline{\hbox to 30mm{}} \hspace{4em} 签字日期：\underline{\hbox to 30mm{}}}
	
	\zihao{-4}{指\hspace{0.4em}导\hspace{0.4em}教\hspace{0.4em}师\hspace{0.4em}签\hspace{0.4em}名：\underline{\hbox to 30mm{}} \hspace{4em} 签字日期：\underline{\hbox to 30mm{}}}
	
	\ifisprint
		\cleardoublepage
	\else
		\clearpage
	\fi
	
	\restoregeometry  % 恢复导言区指定的页面布局
}                     
 
% 重定义mainmatter
\renewcommand\mainmatter{%
	\ifisprint
		\cleardoublepage
	\else
		\clearpage
	\fi
	
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{fancy}
}
    
\RequirePackage{titlesec,titletoc}

\renewcommand{\contentsname}{\zihao{-3}\songti\bf\centering{目 \hspace{1em} 录}}


% 提供目录 API
\providecommand{\content}{
	
	\afterpage{    
		% 重置页码计数器
		\setcounter{page}{1}
		% 定义页眉格式格式
		\pagestyle{plain}
		% 清空原有页眉页脚
		\fancyhf{}            	                          
		% 页眉无内容
		\fancyhead{}                                      
		% 不显示页眉线
		\renewcommand{\headrulewidth}{0pt} 
		% 页码底部居中               
		\fancyfoot[CO, CE]{\thepage}     
		% 页码使用大写罗马数字        	      
		\pagenumbering{Roman} 
		
		% 目录        
		\tocloftpagestyle{fancy}
		\tableofcontents
		
		\ifisprint
			\cleardoublepage
		\else
			\clearpage
		\fi
		
		\restoregeometry  % 恢复导言区指定的页面布局
	}
}         


% 提供摘要 API
\providecommand{\abstract}[2] {
	\afterpage{ 
		% 重置页码计数器
		\setcounter{page}{1}
		% 定义页眉格式格式
		\pagestyle{plain}
		% 清空原有页眉页脚
		\fancyhf{}            	                          
		% 页眉无内容
		\fancyhead{}                                      
		% 不显示页眉线
		\renewcommand{\headrulewidth}{0pt} 
		% 页码底部居中               
		\fancyfoot[CO, CE]{\thepage}     
		% 页码使用大写罗马数字        	      
		\pagenumbering{Roman}                     	      
		
		\phantomsection
		\addcontentsline{toc}{chapter}{摘 \hspace{1em} 要}
		\section*{\centering \heiti{\zihao{-3}{摘 \hspace{1em} 要}}}{
			#1
		}
	
		% 关键字部分
		\vspace{1em}
		\noindent {\heiti 关键词}： \nuist@keywordscn
	
		\clearpage
		
		\phantomsection
		\addcontentsline{toc}{chapter}{Abstract}
		\section*{\centering \bfseries{\zihao{-3}{Abstract}}}{
			#2
		}
	
		% 关键字部分
		\vspace{1em}
		\noindent {\bfseries Key~words:} \nuist@keywordsen
		
		\ifisprint
			\cleardoublepage
		\else
			\clearpage
		\fi
		
		\restoregeometry  % 恢复导言区指定的页面布局
	}
}

% 提供致谢 API
\providecommand{\addthanks}[1]{
	\ifblindtrial
		\cleardoublepage
	\else
		\cleardoublepage
		\phantomsection
		\fancyhead[CO]{\zihao{-5} 致谢}
		\addcontentsline{toc}{chapter}{致\hspace{1em}谢}
		\section*{\centering \bfseries{\zihao{-3}{致\hspace{1em}谢}}}{
			#1
		}
	\fi
}

% 提供参考文献 API
\providecommand{\addreference}{
	\cleardoublepage
	\phantomsection %这一个指令对于显示正确的页码很重要
	\fancyhead[CO]{\zihao{-5} 参考文献}  % 奇数页章节标题
	\addcontentsline{toc}{chapter}{参考文献}  % 向目录中添加条目，以章的名义
}
     
% 提供作者简介 API
\providecommand{\addresume}[1]{
	\cleardoublepage
	\phantomsection
	\fancyhead[CO]{\zihao{-5} 作者简介}
	\addcontentsline{toc}{chapter}{作者简介}
	\section*{\centering \bfseries{\zihao{-3}{作者简介}}}{
		#1
	}
}       

\providecommand{\sensitive}[1]{
	\ifblindtrial
		***
	\else
		#1
	\fi
}    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%         插入代码块的一些设置
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{listings}
\RequirePackage{color}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%         listings设置
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newfontfamily\consolas{Consolas}
\lstset{
	language = [LaTeX]{TeX},
	backgroundcolor = \color{yellow!2},    % 背景色：淡黄
	basicstyle = \zihao{-5}\consolas,           % 基本样式 + 小号字体
	rulesepcolor= \color{gray},             % 代码块边框颜色
	breaklines = true,                      % 代码过长则换行
%	numbers = left,                         % 行号在左侧显示
%	numberstyle = \small,                   % 行号字体
	keywordstyle = \color{blue},            % 关键字颜色
	commentstyle =\color{green!100},        % 注释颜色
	stringstyle = \color{red!100},          % 字符串颜色
	frame = shadowbox,                      % 用（带影子效果）方框框住代码块
	showspaces = false,                     % 不显示空格
	columns = fixed,                        % 字间距固定	
	morekeywords = {
		information,titlesep,keysepcn,keysepen,mainmatter,addreference,
		chapter,subsection,subsubsection,CJKunderdot,CJKunderline,CJKunderdblline,
		CJKsout,CJKxout,CJKunderwave,eqref,arraybackslash,multirow
	},                    % 自加新的关键字（必须前后都是空格）
	deletendkeywords = {compile}            % 删除内定关键字；删除错误标记的关键字用deletekeywords删！
}  

%% 下面内容实际使用前可以删除

\DeclareRobustCommand*\cmd[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\def\crcmd{\cmd{\char`\\}}
\DeclareRobustCommand*\env[1]{\texttt{#1}}
\DeclareRobustCommand*\pkg[1]{\textsf{#1}}
\DeclareRobustCommand*\cls[1]{\textsf{#1}}
\DeclareRobustCommand*\marg{\@ifstar\@marg\@margmeta}
\DeclareRobustCommand*\oarg{\@ifstar\@oarg\@oargmeta}
\DeclareRobustCommand*\Arg[1]{\@meta{#1}}
\def\@oarg#1{\textcolor{gray}{\texttt{[#1]}}}
\def\@oargmeta#1{\@oarg{\@meta{#1}}}
\def\@marg#1{\texttt{\{#1\}}}
\def\@margmeta#1{\@marg{\@meta{#1}}}
\def\@meta#1{$\m@th\langle$\textnormal{\textit{#1}}$\m@th\rangle$}

% Definitions
\def\lsym{$\mathsurround=0pt {}^\ell$}
\def\LSYM    #1{$#1$     & \texttt{\string#1}\lsym}

\def\SYM     #1{$#1$     & \texttt{\string#1}}
\def\BIGSYM  #1{$#1$     & $\displaystyle #1$ & \texttt{\string#1}}
\def\ACC   #1#2{$#1{#2}$ & \texttt{\string#1}\marg*{#2}}
\def\DEL     #1{$\big#1 \bigg#1$ & \texttt{\string#1}}

\def\AMSSYM  #1{$#1$     & \texttt{\string#1}}
% These symbols rely on `amsmath' package
\def\AMSM    #1{$#1$     & \textcolor{blue}{\texttt{\string#1}}}
\def\AMSACC#1#2{$#1{#2}$ & \textcolor{blue}{\texttt{\string#1}}\marg*{#2}}
\def\AMSBIG  #1{$#1$     & $\displaystyle #1$ & \textcolor{blue}{\texttt{\string#1}}}

\def\SC      #1{#1       & \texttt{\string#1}}

\def\demowidth#1{\rule{0.4pt}{1ex}\rule{#1}{1.2pt}\rule{0.4pt}{1ex}}

\newenvironment{symbols}[1]%
{\small\def\arraystretch{1.1}
	\begin{tabular}{@{}#1@{}}}%
	{\end{tabular}}


\DeclareMathOperator{\argh}{argh}
\DeclareMathOperator*{\nut}{Nut}

                     