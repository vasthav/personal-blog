#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
echo '[INFO] BUILDING PROJECT'
echo '[INFO] RUNNING COMMAND >>> hugo'
hugo -d '../vasthav.github.io/' -v --minify # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
echo '[INFO] CHANING DIRECTORY TO PUBLIC'
echo '[INFO] RUNNING COMMAND >>> cd public'
cd public

# Add changes to git.
echo '[INFO] Adding all files to Git'
echo '[INFO] RUNNING COMMAND >>> git add -A'
git add -A

# Commit changes.
msg="[INFO] rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi

echo '[INFO] GIT COMMITING'
echo '[INFO] RUNNING COMMAND >>> git commit -m "<message>"'
# git commit -m "$msg"

# Push source and build repos.
echo '[INFO] PUSHING GIT CHANGES'
echo '[INFO] RUNNING COMMAND >>> git push origin master'
# git push origin master

echo "[INFO] COPYING TO ../vasthav.github.io"
cd ..
cp -r public/* ../vasthav.github.io/
# echo $PWD

echo "[SUCCESS]"
