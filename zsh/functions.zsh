function cgrep {
	grep -iR $1 *
}

function g() {
	if [[ $# > 0 ]]; then
		git $@;
	else
		git status;
	fi;
}

function antify {
	if [[ $# > 0 ]]; then
		ln -s ~/dev//salesforce/.settings/$1.properties ~/dev//salesforce/$1/build.properties
		ln -s ~/dev//ant/sf-ant/build.xml ~/dev//salesforce/$1/build.xml
	else
		echo You need to provide which project you would like to antify.
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
