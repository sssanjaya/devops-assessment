Basically, this is feature branch workflow

Usually:
- main: stable, direct to production
- develop: unstable, all features changes pushed/merged here
- feature: checkout from develop branch and push changes are merged back to develop
- release: Semi-stable, ready to release, bugfixes are included. Checkou from develop and push to
            develop and master.

When you want to add a feature or fix a bug, you first checkout a local branch from develop branch. You make changes locally and push them to a remote branch and merged to develop branch, not master branch. When all testing have passed and get green signal from qa team, you can make a merge request (gitlab way) or pull request (github way) to merge your branch into master branch. After the code review, your code will be merged and deployed.