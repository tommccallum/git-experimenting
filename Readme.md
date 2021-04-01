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

## Typical local dev team workflow

* Assumes that you have a central master repository that you are developing.
* Assumes you are building for a local machine installation.
* Assumes you do not want to develop branches on the main repository.
* Assumes main branch is called main (not master).
 
1. You can either use the BitBucket/GitHub fork or do the following [Reference](https://stackoverflow.com/questions/4728432/git-forking-without-github):

```
# clone wanted repository
git clone https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

# cd into created folder
cd ORIGINAL_REPOSITORY

# add your remote repository as origin
git remote add origin https://github.com/my_user/my_repository.git

# add original repository as upstream
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

# when want to pull from upstream just
git pull upstream main

```

2. Create a branch on your local repository with an appropriate name.  Are you using a naming convention for branches?

```
# if the branch does not exist you can do the following to create and switch branches
git checkout -b NEW_BRANCH
```

3. Check out your lovely new branch

```
# to list local branches
git branch 

# to list remote branches
git branch -r

# to list all branches 
git branch -a
```

4. You can delete a local branch without any fuss.

```
# switch to main branch without trying to create one
git checkout main
# delete branch
git branch -d NEW_BRANCH
```

5. Make your add, commit, pushes as usual.

When you want to join your code with the original repository:

1. Make sure your repo is up to date

```
git pull upstream main
```

2. Run all tests again and fix any bugs.


3. Clean up your commits

```
git rebase -i master
```

This will open up your editor and you need to mark each commit as PACK or SQUASH.  You want to end up with 1 commit for the entire editing process of the branch.

**TIP:** pack the first commit and squash others.

When you close the editor it will open again and ask you to add your commit message.  Comment out the old commit messages and then add a single comment that highlights the why this change as a whole occurrs.

4. Issue pull request

Either do this via your git service like GitHub or Bitbucket, or

```
# when want to create upstream pull-request just
# https://git-scm.com/docs/git-request-pull
# commit-hash - from where to start pull request
git request-pull commit-hash git@github.com:my_user/my_repository.git
```

## Typical cloud dev team workflow

You can follow the local dev team workflow but you need to care about services.  You will most likely need to duplicate services in your own account away from the team services that is running your main pipeline.

1. Use Infrastructure as code to allow services to be created with the minimum of fuss, although this does involve more learning and may not be easily achieved depending on the infrastructure.

2. Manually setup a second set of services that you need.

Generally this is why we split frontend/backend/micro-services to minimise the amount of duplication.  e.g. for backend you could mock out any database responses for instance to save having to replicate the database for unit tests.