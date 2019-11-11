## Git

    git diff mybranch..master -- path/to/file.ext
    git diff-tree --no-commit-id --name-only -r <commit_hash>
    git ls-files --others
    git ls-files --others --exclude-standard
    git grep "string/regexp" $(git rev-list --all)
    git grep "string" $(git show-ref --heads)
    git remote set-url --add --push [remote] [repourl]

    git submodule foreach git pull origin master
