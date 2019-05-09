#!/bin/bash
# Set here as your github credentials
GITHUB_USER=
GITHUB_PASSWORD=
GITHUB_USERNAME=
# Set here as your bitbuckt credentials
BITBUCKET_USER=
BITBUCKET_PASSWORD=
BITBUCKET_USERNAME=
set -e
repos=$(bb list -u $BITBUCKET_USER -p $BITBUCKET_PASSWORD --private | grep $BITBUCKET_USERNAME | cut -d' ' -f3 | cut -d'/' -f2)
for repo in $repos; do
	echo
	echo "* Processing $repo..."
	echo
	git clone --bare git@bitbucket.org:$BITBUCKET_USERNAME/$repo.git
	cd $repo.git
	echo
	echo "* $repo cloned, creating new repository on github..."
	echo
	curl -u $GITHUB_USER:$GITHUB_PASSWORD https://api.github.com/user/repos -d "{\"name\": \"$repo\", \"private\": true}"
	echo
	echo "* mirroring $repo to github..."
	echo
	git push --mirror git@github.com:$GITHUB_USERNAME/$repo.git && \
	bb delete -u $BITBUCKET_USER -p $BITBUCKET_PASSWORD --owner $BITBUCKET_USERNAME $repo
	cd ..
done