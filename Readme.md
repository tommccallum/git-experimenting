# Git Experimenting

A public repository to practice forking and merging etc with students.

## How to use

Do not run this via a clone please!

**Fork** this project and then run the script commands to generate an example set of commits. You can modify this file to generate a different workload.

```
git clone <Your new fork>/git-experimenting
./bin/make-repo-contents.sh
```


## Git Tips

Don’t push your work until you’re happy with it

> "One of the cardinal rules of Git is that, since so much work is local within your clone, you have a great deal of freedom to rewrite your history locally. However, once you push your work, it is a different story entirely, and you should consider pushed work as final unless you have good reason to change it. In short, you should avoid pushing your work until you’re happy with it and ready to share it with the rest of the world." - https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History

> "[When rebasing] Don’t include any commit you’ve already pushed to a central server — doing so will confuse other developers by providing an alternate version of the same change." - https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History

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