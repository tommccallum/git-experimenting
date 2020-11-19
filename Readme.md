# Git Experimenting

A public repository to practice forking and merging etc with students.

## How to use

Do not run this via a clone please!

Fork this project and then run the scripts so the main dev line does not get full of test commits.

## Useful aliases

Below are some useful aliases if you are playing about with git.

```
alias glog="git log --graph --full-history --all --color --pretty=format:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s\""
```

## Forking your own repository

This was an interesting find.  I wanted to fork this project to test it as a user would but under the same GitHub account.  I found [this](https://medium.com/@mikezrimsek/fork-your-own-github-repository-19ad4582b50a) article by Mike Zrimsek that pointed me to the right track.

```
mkdir git-experimenting-test
cd git-experimenting-test
git init                    # initialise git 
hub create                  # create new repo on GitHub
git remote add upstream https://github.com/tommccallum/git-experimenting
git pull upstream master    # update from source repo
git push origin master      # push changes to new repo
```