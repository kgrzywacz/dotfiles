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

function feature_branch() {
	git co -b feature/ONDEV-$1/$(echo $2 | tr " " "_")
}

function formatit() {
	astyle --mode=java -A2 -xc -xU -p -xg -U -xb -j < $1 > $1-formatted
}

function is_dark_mode_on() {
	local is_dark_mode_on
	is_dark_mode_on=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
	if [[ "$is_dark_mode_on" == "Dark" ]]; then
		echo "true"
	else
		echo "false"
	fi
}

function update_iterm_profile() {
	local profile_file=~/Library/Application\ Support/iTerm2/DynamicProfiles/dynamic
	if [[ -f "$profile_file" ]]; then
		jq .Profiles[0]."\"Dynamic Profile Parent Name\""="\"$(automatic_profile_name)\"" \
			$profile_file > $profile_file.tmp \
			&& cp $profile_file.tmp $profile_file \
			&& rm $profile_file.tmp
	else
		create_dynamic_mode_iterm_profile > $profile_file
	fi
}

function create_dynamic_mode_iterm_profile() {
	jq -n \
	--arg guid $(uuidgen) \
	--arg parent_name $(automatic_profile_name) \
	'{"Profiles":[{"Name":"Dynamic mode","Guid":$guid,"Dynamic Profile Parent Name":$parent_name}]}'
}

function automatic_profile_name() {
	if [[ $(is_dark_mode_on) == "false" ]]; then
		echo "solarized-light"
	else
		echo "solarized-dark"
	fi
}
