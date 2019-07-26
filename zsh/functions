function cgrep {
	grep -iR $1 *
}

function gcsf() {
	if [[ $# > 0 ]]; then
		dir=$1
		srcdir=$1
	else
		dir=$0:a:h
		srcdir=$dir/src
	fi;
	propfile=$BUILD_PROP_DIR/${dir##*\/}.properties
	if [[ -f "$propfile" ]]; then
		print $propfile already exists, do you want to overwrite it\?
			read overwrite
	fi;
	if [[ overwrite = "yes" || overwrite = "y" || ! -f "$propfile"  ]]; then
		rm $propfile > /dev/null
		print Username:
		read usr
		print Password:
		read psw
		print Security token:
		read stoken
		print test or login defaults to test
		read sfsrv
		echo sf.username = $usr | tee -a $propfile > /dev/null
		echo sf.password = $psw$stoken | tee -a $propfile > /dev/null
		if [[ $sfsrv = "login" ]]; then
			echo sf.serverurl = https://login.salesforce.com | tee -a $propfile > /dev/null
		else
			echo sf.serverurl = https://test.salesforce.com | tee -a $propfile > /dev/null
		fi;
	fi;
	git clone https://github.com/onrunning/on-sf.git $srcdir
	ln -s $BUILD_PROP_DIR/${dir##*\/}.properties $srcdir/build.properties
	ln -s $BUILD_XML $srcdir/build.xml
}

function g() {
	if [[ $# > 0 ]]; then
		git $@;
	else
		git status;
	fi;
}

function focus() {
	if [[ $# > 0 ]]; then
		open "focus://focus?minutes=$1";
	else
		open focus://toggle;
	fi;
}

function auto_set_profile_based_on_time () {
	localTime=`date +"%H"`
	if [ "$localTime" -gt 8 ] && [ "$localTime" -lt 20 ]; then
		set_iterm2_profile solarized_light
	else
		set_iterm2_profile solarized_dark
	fi
}

function antify {
	if [[ $# > 0 ]]; then
		ln -s ~/dev//salesforce/.settings/$1.properties ~/dev//salesforce/$1/build.properties
		ln -s ~/dev//ant/sf-ant/build.xml ~/dev//salesforce/$1/build.xml
	else
		echo You need to provide which project you would like to antify.
	fi
}

function apexSwitchProject {
	local CURRENT_PROJECT="current"
	if [[ $1 = $CURRENT_PROJECT ]] then
		echo You can\'t switch to current project
	elif [[ -n $1 && -e ~/dev/salesforce/.settings/$1.properties ]]; then
		cp -f ~/dev/salesforce/.settings/$1.properties ~/dev/salesforce/.settings/current.properties
	elsE
		echo Provide valid project name.
	fi
}

fbr() {
	git fetch
	local branches branch
	branches=$(git branch -a) &&
		branch=$(echo "$branches" | fzf +s +m -e) &&
	git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

function f() {
	vim $(fzf)
}
