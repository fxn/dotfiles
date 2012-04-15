# I committed something by error and want to undo it without a revert patch and keeping the working
# directory as it is. For example I added some hunks selectively and then did a commit -a by error.
git reset HEAD^

# I want to undo everything local, all commits and all changes to files.
git reset origin/master --hard

# Check what you are about to push, remove -p to not include diffs.
git log -p origin/master..master

# I have done some changes, they are not added/commited, and I want to undo everything.
git checkout -- .

# I want to know when a certain file was deleted.
git log --diff-filter=D -- path/to/file

# working with a fork
git remote add rails git://github.com/rails/rails.git
git fetch rails
git rebase rails/master

# publish a local branch to the origin remote
git push origin newfeature

# defaults
git config --global push.default matching
git config --global user.name "Xavier Noria"
git config --global user.email "fxn@hashref.com"
git config --global push.default upstream
git config --global color.ui auto
git config --global color.diff.whitespace "red reverse"
git config --global merge.tool opendiff

# gitignore
echo .idea > ~/.gitignore
git config --global core.excludesfile ~/.gitignore

# abort a cherry-pick
git reset --merge

# merge docrails
git rev-parse HEAD  # => S1 (before merging)
git rev-parse HEAD  # => S2 (after merging)
git rev-list S1..S2 # to get a list of the new commits

# Prune remotes that were deleted in origin
git remote prune origin

# List all merged branches
git checkout stable
git branch -a --merged

# Then, for each local branch you can
git branch -d name_of_local_branch

# ...and for each remote branch
git push origin :name_of_remote_branch

# Sergio's alias
alias git-atpc='git branch --merged | grep -v "^*" | xargs git branch -d'

# index file corrupt
rm -f .git/index
git reset

# tagging
git tag v1.0
git push origin v1.0

# merge pull request at repo, branch name
git pull https://fxn@github.com/gregolsen/rails.git extended_beginning_of_week

# git bisect
git bisect start
git bisect good v2.6.18
git bisect bad master
git bisect good/bad
and when the culprit is found
git bisect reset

# which commit deleted some particular file?
git log --diff-filter=D -- lib/tasks/metadata.rake

# Track a remote branch.
git checkout -t origin/3-1-stable
git checkout --track -b <local branch> <remote>/<tracked branch>
