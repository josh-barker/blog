+++
title = "Git Memory"
date = "2020-05-23"
author = "Josh"
tags = ["collaboration", "git"]
+++

# Git Practices

This is a summary of some common things you might need to look up, or things I might forget.

## Branches

I like to use short lived branches and I'm the one who's responsible for it. I'd suggest you do the same.

It helps reduce potential issues when someone needs to re-write git history in a branch.

But be warned. replacing git history is dangerous. It can cause others confusion.

The general idea is that you shouldn't replace a commit that has been pushed remotely.

Branch protection policies are great to stop me and you from doing dumb things, like replacing another persons work.

## Useful things

### Editing the current commit

```bash
# make your changes

git add . # or stage your specific changes
git commit --amend # This will **replace** your existing commit locally
# This will **replace** the commit remotely, but it will error if someone else has pushed
git push --force-with-lease
```

### Editing previous commit(s)

Say you want to edit your last 3 commits, you would run:

```bash
git rebase HEAD~3
```

This will show something like this:
Change "pick" to "edit" or "e" for each commit you want to change.

```bash
pick f7f3f6d Change my name a bit
pick 310154e Update README formatting and add blame
pick a5f4a0d Add cat-file

# Rebase 710f0f8..a5f4a0d onto 710f0f8
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

Now, make your changes

```bash
git add . # or stage your specific changes

git commit --amend
git rebase --continue

git push --force-with-lease

```

See <https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History> for more details


### Squashing commits

Say you want to edit your last 3 commits, you would run:

```bash
git rebase HEAD~3
```

This will show something like this:
Change "pick" to "squash" or "s" to combine the commits to the previous commit.
Save and quit.

```bash
pick a7f3f6d chore: update docs
squash b10154e Update README formatting and add blame
squash c5f4a0d Add cat-file

# Rebase a7f3f6d..c5f4a0d onto a7f3f6d
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted.
#
# Note that empty commits are commented out
```

Git will now prompt you again to update the commit message.
Update as you want, save and quit.

```bash
git rebase --continue

git push --force-with-lease
```
