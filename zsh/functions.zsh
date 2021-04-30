function cgrep {
	grep -iR $1 *
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

function getSecret {
	az keyvault secret show --vault-name ON-Keys-DEV -n $1 | jq '.value'
}
function selectSubscription() {
	currentSubscription = $(az account show | jq '.name' -r)
	subscriptions=($(az account list | jq '.[] | .name' -r))
	select sub in "${subscriptions[@]}"
	do
		$(az account set --subscription $sub)
		break;
	done
}

function getLocalSettings() {
	initialSubscription=$(az account show | jq '.name' -r)
	subscriptions=($(az account list | jq '.[] | .name' -r))
	select sub in "${subscriptions[@]}"
	do
		$(az account set --subscription $sub)
		break;
	done

	if [ -z "$1" ]
	then
		functionNameArray=($(az functionapp list | jq '.[] | .name' -r | sort -f));
		select item in "${functionNameArray[@]}"
		do
			functionAppName=$item;
			break;
		done
	else
			functionAppName=$1
	fi

	func azure functionapp fetch-app-settings "$functionAppName" && func settings decrypt;
	cp local.settings.json local.settings.json.backup;

	secretNameArray=($(jq '.Values | .[] | strings | if startswith("@") then . else empty end' -r local.settings.json));

	for i in "${secretNameArray[@]}";
	do
		keyvaultName=$(echo "$i" | awk -F/ '{ print $3 }' | awk -F. '{ print $1}');
		secretName=$(echo "$i" | awk -F/ '{ print $5 }');
		newSecret=$(az keyvault secret show --vault-name "$keyvaultName" -n "$secretName" | jq '.value' -r);
		cp local.settings.json local.settings.json.temp;
		jq --arg oldVal "$i" --arg newVal "$newSecret" '.Values[] |= if . == $oldVal then .=$newVal else . end' local.settings.json.temp > local.settings.json;
	done
	rm local.settings.json.temp;
	$(az account set --subscription $initialSubscription)
}
