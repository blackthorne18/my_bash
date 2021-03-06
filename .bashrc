uc=$(tput setaf 202);
dc=$(tput setaf 33);
hc=$(tput setaf 118);
white=$(tput setaf 15);
wc=$(tput setaf 180);
tc=$(tput setaf 248);


function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "${white}on ${hc}[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}


echo "${hc}Welcome Prajwal"
PS1="$(tput bold)${uc}\u ${white}in ${dc}\W \`parse_git_branch\`${white} at ${hc}\t${white}\n$ ${tc}";
export PS1;

if [ -f $HOME/.syntra/small ]; then
	. $HOME/.syntra/small
fi


if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

#\s - Name of the shell
#\# – Command number
#\u – User name
#\W – Current working directory (ie: Desktop/)
# $(command) executes the command and $() acts as a placeholder
# tput setaf <color code> and tput sgr0 resets everything
