# GIT

Git is a distributed version control system that tracks versions of files. It's shell (git bash) is built as a linux based command line tool.

----------------------------------

## Mechanism

![text](https://phoenixnap.com/kb/wp-content/uploads/2021/09/git-workflow.png)

----------------------------------

## Commands

+ To check the status of repository

```bash
git status
```

+ To initialize the folder into a git repository

```bash
git init
```

+ To stage all the files

```bash
git add .
git add --a
git add <filename>
```

+ To show all options for git

```bash
git -h
```

+ To remove file from staging area(rm -> remove)

```bash
git rm --cached <filename>
```

+ To commit the stage with a message

```bash
git commit -m "message"
```

+ To fetch all previous logs

```bash
git log
```

+ To delete a git repository

```bash
rm -rf .git
```

+ Linux basic commands

<pre>
pwd   --> present working directory
ls    --> list
cd    --> change directory
touch --> to create a file in the repo
</pre>

<pre>
.gitignore is a file in which the file names included in it get ignored by git. It ignores blank
folders by default.
</pre>

```gitignore
*.txt # ignores all files with this extension/name
/folder # ignores all folderes and subfolders of this name
```

+ Clone a remote repository

```bash
git clone <link>
```

+ Compare different stages

```bash
# between working directory and staged area
git diff 

# between staged area and commit
git diff --staged
```

+ To commit the files without staging (skipping staging)

```bash
git commit -a -m "message"
```

+ Rename a file

```bash
git mv <filename> <newname>
```

+ Restore the edited version

```bash
git checkout -- <filename>

# For restoring all files
git checkout -f

# For restoring from staged area
git restore --staged -- <filename>
```

+ git generate patch/changes

    ```bash
    git diff > changes.patch
    ```

+ apply the diff

    ```bash
    git apply changes.patch
    ```

### Remote

It is the remote repository where your files are stored with git. (Like github or gitlab)

```bash
# view remote repo name
git remote

# Add the remote repo link to local
git remote add <name> <url>

# View push and pull commands
git remote -v

# Push changes
git push -u <remote_name> <branch>

# Pull changes
git pull
```

### Config

+ Create alias / shortcut

    ```bash
    git config --global alias.<shortcut> <value>
    ```

  + Eg:

    ```bash
    git config --global user.username gowtham4545
    ```

### Branch

+ List braches

    ```bash
    git branch
    ```

+ Create Branch

    ```bash
    git checkout -b <branch_name>
    ```

+ switch branches

    ```bash
    git checkout <branch_name>
    ```

+ Merge branch to master

    ```bash
    git merge <branch_name>
    ```

+ Delete branch

    ```bash
    git branch -d <name>
    ```

### Reverting

+ Revert the commits

    ```bash
    git revert [commit_id]
    ```

    <i>The git revert command reverts a particular commit, i.e., undoes the commit you made to remove the changes from the master branch.

    <b>Note: </b>The git revert command doesn't remove the commit from commit history. It only adds a new commit specifying that it has reverted the specified commit.</i>

    ```bash
    git reset
    ```

    *The git reset command permanently takes you back to a certain point in development. All the files and changes added after that point in time are unstaged if you want to re-add them.*
