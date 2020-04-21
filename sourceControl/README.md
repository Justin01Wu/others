# Discuss Source control

1.	TortoiseSVN can add multiple commit together, TortoiseGIT can’t
 <img src="img\svn_merge_commits.png">
2.	SVN compare the content when it is merging, Git used hash to do merging, so it will get conflicts if a developer commits the same content in different branch, So you have to use cherry pick to merge. For SVN cherry pick is optional because it is the same content and won’t get conflicts. Git commit hash is different even if you commit the same content in a different branch because it also includes commit date in the hash.
3.	GIT still get tree conflict if the file is moved and renamed while another user changed the content, or deleted and edited
4.	Both Git and SVN has a powerful function to find who changed which line in what time in the BLAME function. It will trace back all kinds of merging process and find original changes , but Svn need to search the history on the server, take long, git search local history
<img src="img\svn_merge_commits.png"> 
5.	Git usually use pull request to merge branches. Svn save  merge info, will become slow after many merges, but it bring branch history into target, and can ignore the merged history if it has the same source, git merge finds difference, so history will get lost
6.	SVN can directly merge remote side code with uncommitted local changing, GIT will get unclean error if the changing is on the same file. GIT needs to stash it before do pull request
7.	Based on git feature, we should create as much branches as we can, every branch only handle one feature
8.	DevOps doesn’t have a good tool to solve conflict when it is merging branches. We have to use TortoiseGit and solve conflict in the local
9.	Rebase is correct command to merge trunk into a branch in GIT, it maybe have conflicts, you need to resolve them in the local, pull request did same thing, but will lost some history sometimes
10.	Rebase will automatically commit when it is done. You need push if it is good, you need hard remove local commits if it is not good 
11.	Sometimes you need a new pull request after rebase even you just did it before rebase, and that pull request maybe generate conflicts
<img src="img\git_rebase.png"> 
12.	When pull request from a branch into the trunk, it could not have a conflict if the branch already did rebase on it
13.	Sometimes rebase will get so many conflicts if you didn’t do it for a long time, then merging is the only choice: it added another branch’s changes as last commit in current branch: you lose commit history
14.	When you have a hot fix in the develop branch better to use cherry pick to merge to the cherry-pick branch. You will get conflicts if you commit it on both branches
15.	It seems Git can change old committing message with amend command, and SVN can’t
<img src="img\git_confuse.png"> 
16. Git can create local repo firstly, then link to remote repo: <img src="img\link_to_remote.png">
