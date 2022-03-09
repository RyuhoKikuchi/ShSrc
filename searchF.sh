#!/bin/zsh


#  for i in $(find ./ | grep \.js | grep -v "jquery"); do bat $i | pcre2grep -Mr 'function[\s\S]*?\n}\n'; echo "}\n"; done

# This file was meant to extract functions in all JS files in child directories
# This searching Algorithm needs better version
# Hint: quatation(including comments), json, return.... the list goes on

# The first for_loop statement is searching all Paths to the files
# li1 var is finding index for the beginning line of functions
# li2 is for the end of the function
# The second for_loop inside is extracting the code for the function using specified the numbers of lines


for x in $(find ./ | grep "\.js" | grep -v "jquery"); do
    li1=(${$(grep -n "function" $x | grep "(" | grep -v "//" | awk -F ":" '{print $1}')//\\n/ })
    li2=(${$(grep -n "}" $x | grep -v "    " | awk -F ":" '{print $1}')//\\n/ })
    echo "$x \n\n${li1[@]}\n${li2[@]}\n\n"
    for i in $(seq 1 ${#li1[@]}); do
        cat $x | sed -n "${li1[$i]},${li2[$i]}p" | bat -l JavaScript
    done
done
