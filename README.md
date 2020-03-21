
## How to Contribute
This is an Open Source project and we would be happy to see contributors who report bugs and file feature requests by submitting pull requests as well.This project adheres to the [Contributor Covenant](https://github.com/codingindia/travel-safe/blob/master/CONTRIBUTING.md). By participating, you are expected to uphold this code style. Please report issues here https://github.com/codingindia/travel-safe. While opening a new pull request or a new issue please adhere to [the pull request template](), [bug report template]() and [feature request template]().

### Branch Policy
We have the following branches
 * **development**
     All development goes on in this branch. If you're making a contribution,
     you are supposed to make a pull request to _development_.

     It is advisable to clone only the development branch using the following command:

    `git clone -b <branch> <remote_repo>`

    Example:

    `git clone -b my-branch git@github.com:user/myproject.git`

    Alternative (no public key setup needed):

    `git clone -b my-branch https://git@github.com/username/myproject.git`

    With Git 1.7.10 and later, add --single-branch to prevent fetching of all branches. Example, with development branch:

    `git clone -b development --single-branch https://github.com/username/travel-safe `

 * **master**
   This contains the stable code. After significant features/bugfixes are accumulated on development, we move it to master.
