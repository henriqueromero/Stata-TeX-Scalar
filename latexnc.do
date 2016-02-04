/* Created by Henrique Romero (hromero@ucsd.edu)
LateX new command for automatically referring to scalars
Use is latexnc "name you want for the latex shortcut" "stata local var containing scalar of interest" "tex file that you want to save commands to"
Need an empty tex file to save new commands to at the beginning of every project 
This can be accomplished by the following shell command
! echo > "file.tex"
Example: 
! echo > "/Users/Henrique/BITSS/annual2015/test.tex"
*/

/* Example:

Say you have a data set with a variable price in it 
sum price 
-Save mean price in the scalar "pricemean" with 2 decimals 
scalar pricemean=round(`r(mean)',.01')
-Run latexnc 
latexnc pricemean "/Users/Henrique/BITSS/annual2015/test.tex"
Then, in latex document you will call the tex file by using (anywhere before you want to use the shortcuts)
\input{"/Users/Henrique/BITSS/annual2015/test.tex"}
Then, you would call the scalar by using 
\pricemean
*/

cap program drop latexnc
program define latexnc
*Spot is the string with the name
local spot1="`1'"
*Spot2 is the actual value stored in the scalar
local spot2=`1'
local latexnc1 "\newcommand{\\`spot1'}{`spot2'}"
! echo "`latexnc1'" >> "`2'" 
end 

