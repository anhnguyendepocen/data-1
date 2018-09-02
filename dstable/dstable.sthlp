{smcl}
{* 2018-09-02 Trenton D Mize}{...}
{title:Title}

{p2colset 5 16 16 1}{...}
{p2col:{cmd:dstable} {hline 2}}Tables of Descriptive Statistics - with 
	Unique Treatment of Continuous, Binary, and Nominal Variables {p_end}
{p2colreset}{...}


{title:General syntax}


{p 4 18 2}
{cmd:dstable} [{varlist}] {ifin} {cmd:,}
{opt filename( )} [options]
{p_end}

{marker overview}
{title:Overview}

{pstd}
{cmd:dstable} produces a descriptive (summary) statistics table. {cmd:dstable} 
treats continuous, binary, and nominal variables differently - providing 
statistics and labeled output most appropriate for the measurement level 
of the variable.

{pstd}
Factor syntax is required: binary and nominal variables should be entered 
into the variable list with the i. prefix.

{pstd}
{cmd:dstable} outputs the descriptive statistics table to Excel; it can 
easily be copied to Word without losing the formatting of the table.

{pstd}
{cmd:dstable} labels the rows of the table with the corresponding variable label. 
Categories of nominal variables are labeled with the value labels of the 
corresponding variable. Thus, the effectiveness of the default table depends on 
the effectivness of the labels in the data (see {help label} for details on 
adding variable and value labels to your data).


{title:Options}

{marker required}
{dlgtab:Required Option}

{p2colset 5 18 19 0}
{synopt:{opt file:name(string)}} is required. This names the Excel sheet that 
is saved with the descriptive statistics table. If the filename includes spaces, 
it must be enclosed in quotations; e.g. filename("file name has spaces")
{p_end}

{marker stats}
{dlgtab:Optional statistics to include in the table}

{p2colset 5 18 19 0}
{synopt:{opt stat:s(string)}} specifies which statistics should be included in 
the table. Each statistic is reported in a separate column of the table. The 
default is to report the mean (proportion for binary and nominal variables) and 
the standard deviation of continuous variables. Statistics can be requested in 
any order desired; columns of the table will be ordered based on the list specified 
in {bf:stats( )}. The following statistics are available:
{p_end}

{p2colset 10 23 22 12}{...}
{p2col :Stat Name}Description{p_end}
{p2line}
{p2col :{ul:{bf:mean}}}Mean of continuous variables; proportion of binary/nominal variables.{p_end}
{p2col :{ul:{bf:sd}}}Standard deviation (c).{p_end}
{p2col :{ul:{bf:count}}}Freqency for each category of a nominal variable.{p_end}
{p2col :{ul:{bf:var}}{bf:iance}}Variance (c).{p_end}
{p2col :{ul:{bf:med}}{bf:ian}}Median (c).{p_end}
{p2col :{ul:{bf:min}}}Minimum (c).{p_end}
{p2col :{ul:{bf:min}}}Maximum (c).{p_end}
{p2col :{ul:{bf:range}}}Range [max - min] (c). {p_end}
{p2col :{ul:{bf:iqr}}}Interquartile range [75th percentile - 25th percentile] (c).{p_end}
{p2col :{ul:{bf:cv}}}Coefficient of variation [sd/mean] (c).{p_end}
{p2col :{ul:{bf:semean}}}Standard error of mean (c).{p_end}
{p2col :{ul:{bf:skew}}{bf:ness}}Skewness (c).{p_end}
{p2col :{ul:{bf:kur}}{bf:tosis}}Kurtosis (c).{p_end}
{p2col :{ul:{bf:p1}}}1st percentile (c).{p_end}
{p2col :{ul:{bf:p5}}}5th percentile (c).{p_end}
{p2col :{ul:{bf:p10}}}10th percentile (c).{p_end}
{p2col :{ul:{bf:p25}}}25th percentile (c).{p_end}
{p2col :{ul:{bf:p50}}}50th percentile [same as {bf:median}] (c).{p_end}
{p2col :{ul:{bf:p75}}}75th percentile (c).{p_end}
{p2col :{ul:{bf:p90}}}90th percentile (c).{p_end}
{p2col :{ul:{bf:p95}}}95th percentile (c).{p_end}
{p2col :{ul:{bf:p99}}}99th percentile (c).{p_end}
{p2line}

(c) indicates this statistic is only reported for continuous variables.

{marker stats}
{dlgtab:Other options}

{p2colset 5 18 19 0}
{synopt:{opt nformat(string)}} changes the format for the statistics. 
The format follows that specified by {bf:putexcel} (see {help putexcel advanced}). 
The default is "#.00" which specifies two decimal places. To change this, for 
example to use three decimal places, specify "#.000"
{p_end}

{p2colset 5 18 19 0}
{synopt:{opt title(string)}} adds a title to the table. The default is to 
title the table "Table #: Descriptive Statistics (N = ##)" where the N size is 
calculated automatically based on the total number of observations that 
descriptive statistics were calculated for.
{p_end}

{p2colset 5 18 19 0}
{synopt:{opt font(string)}} changes the font of all numbers, labels, and titles 
in the table. The default is "Times New Roman"
{p_end}

{p2colset 5 18 19 0}
{synopt:{opt fonts:ize(#)}} changes the font size of all numbers, labels, and titles 
in the table. The default is 11.
{p_end}

{p2colset 5 18 19 0}
{synopt:{opt txtindent(#)}} changes how far the statistics are indented from 
the right edge of the column. All statistics are right-justified so that 
statistics align on the decimal point. The default is 1.
{p_end}

{p2colset 5 18 19 0}
{synopt:{opt sheet:name(string)}} adds a name to the individual Excel sheet 
where the table is saved. The default is to name the sheet "Descriptives Table"
{p_end}


{title:Examples}

{phang} sysuse nlsw88

{phang} dstable wage age i.race i.union i.collgrad tenure i.occupation hours, 
			filename("descriptives") {p_end}

{phang} dstable wage age i.race i.union i.collgrad tenure i.occupation hours, 
			filename("descriptives") stats(mean count sd min max iqr median) {p_end}

{phang} dstable wage age i.race i.union i.collgrad tenure i.occupation hours, 
			filename("descriptives") font("Helvetica") fontsize(13) {p_end}

{phang} dstable wage age i.race i.union i.collgrad tenure i.occupation hours, 
			filename("descriptives") nformat("#.000") {p_end}
			

{title:Comments}

{pstd} {cmd:dstable} makes the descriptive statistics table using Stata's 
{bf:putexcel} command. Because of some of the putexcel features used, 
version Stata 15.0 or newer is required to use {cmd:dstable}.

{pstd} Available statistics for continuous variables are those that can be 
calculated with tabstat (with the exception of {bf:q}; note also that 
while {bf:n} and {bf:count} are allowed they are only reported for binary and 
nominal variables). See {help tabstat} for more details.


{title:Authorship}

{pstd} dstable is written by Trenton D Mize (Department of Sociology, 
Purdue University) and Bianca Manago (Department of Sociology, Vanderbilt University). 
Questions can be sent to tmize@purdue.edu {p_end}
