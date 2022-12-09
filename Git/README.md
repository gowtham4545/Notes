#   GIT
### Git is a distributed version control system. It's shell (git bash) is built as a linux based command line tool.
---------------------------------------------------------------------------

## Mechanism

![text](./mechanism.png)

---------------------------------
## Codes
+ ### To check the status of repository

        git status
+ ### To initialize the folder into a git repository,

        git init
+ ### To stage all the files.

        git add .
        git add --a
        git add <filename>
+ ### To show all options for git.

        git
+ ### To remove file from staging area(rm -> remove).

        git rm --cached <filename>
+ ### To commit the stage with a message.

        git commit -m "message"
+ ### To fetch all previous logs.

        git log
+ ### To delete a git repository

        rm -rf .git
    <pre>rm -rf < foldername >   is the linux command to remove folders (-rf --> folder)</pre>
+ ### Linux basic commands:
    <pre>
    pwd   --> present working directory
    ls    --> list
    cd    --> change directory
    touch --> to create a file in the repo
    </pre>
+ ### To create a .gitignore file

        touch .gitignore

    <pre>
    .gitignore is a file in which the file names included in it get ignored by git.
    </pre>