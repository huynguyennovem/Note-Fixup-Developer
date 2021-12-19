### Count LOC of git by user and date range
git log  --pretty=tformat: --numstat --author="huynguyennovem@gmail.com" --since="2021-11-01" | gawk '{ add += $1; subs += $2; loc += $1 + $2 } END { printf "added lines: %s removed lines: %s total lines: %s\n", add, subs, loc }' -

### Stash
- Save
>git stash
or
>git stash save "stash 1 : change litte bit"

- Get
>git stash apply stash@{0}

- revert stash:
>git stash pop

- Stash Theo file/folder:
>git stash push -m oidc_doing android/app data/ domain/lib/ lib/

- Move your stashes from one repo to another
```
git stash show -p stash@{0} > patch
cd /new/project/dir
git apply /old/project/dir/patchfile (if it failed, can try: git apply -3 /old/project/dir/patchfile)
git stash
```

### Config user
- Edit file .git/config from root of project

```
[user]
	name = Huy Nguyen
	email = huynguyennovem@gmail.com
	username = huynguyennovem
```

### Git squash:
1. Select revision need to squash (6394dc)
>git rebase --interactive 6394dc

>git rebase -i --root

- wrong on linux
>git rebase --interactive head~2

- correct on linux
>git rebase --interactive HEAD~2

- correct on all
>git rebase --interactive @~2

2. Change from pick -> squash or s:
```
pick 5ae70a9 first commit
pick 2424829 update code
pick 76f9271 update code
pick d895226 update code
pick ec03092 update code
pick 2fc8b0c update code, paging, playlist
=> 
pick 5ae70a9 first commit
s 2424829 update code
s 76f9271 update code
s d895226 update code
s ec03092 update code
s 2fc8b0c update code, paging, playlist
```

3. save file :wq

4. git push origin master -f

### Delete branch local and remote
- LOCAL:
>git branch -d ss_detail_image_counter

- REMOTE:
>git push origin --delete ss_detail_image_counter

### Checkout PR from forked user
```
git remote add imGok https://github.com/imGok/flutter-app.git
git remote set-url --push imGok no_push
git config credential.helper store
git fetch imGok
git checkout --track imGok/download_received_shares
```

### Fixup & rebase commit 
https://fle.github.io/git-tip-keep-your-branch-clean-with-fixup-and-autosquash.html 

- Fixup:
```
$ (dev) git add featureA
$ (dev) git commit -m "Feature A is done"
[dev fb2f677] Feature A is done
$ (dev) git add featureB
$ (dev) git commit -m "Feature B is done"
[dev 733e2ff] Feature B is done

$ (dev) git add featureA                # you've removed a pdb : shameful commit
$ (dev) git commit --fixup fb2f677
[dev c5069d5] fixup! Feature A is done
```

- Rebase fixup:

```
$ (dev) git log --oneline
c5069d5 fixup! Feature A is done
733e2ff Feature B is done
fb2f677 Feature A is done
ac5db87 Previous commit

$ (dev) git rebase -i --autosquash ac5db87
pick fb2f677 Feature A is done
fixup c5069d5 fixup! Feature A is done
fixup c9e138f fixup! Feature A is done
pick 733e2ff Feature B is done

$ (dev) Git push -f origin master
```

Result:
```
$ (dev) git log --oneline
ff4de2a Feature B is done
5478cee Feature A is done
ac5db87 Previous commit
```

### Add all file and dir 
>git add subdir 	#will add subdir and everything in it recursively.

For eg:
>git add domain

### undo last commit (keep local changes)
>git reset --soft HEAD~1

### undo last commit (reset local changes)
>git reset --hard HEAD^

>git push origin -f

### commit empty commit:
>git commit --allow-empty -m "I decided to run this"

### count commits:
>git rev-list HEAD --count

### Git checkout -b vs —track:
* git checkout -b mybranch origin/abranch will create mybranch and track origin/abranch
* git checkout --track origin/abranch will only create 'abranch', not a branch with a different name.


### Change base of branch: 
https://stackoverflow.com/questions/10853935/change-branch-base 
Eg: change base của enhance_biometric_authen (features_v2 -> master)

>git rebase --onto master features_v2 enhance_biometric_authen

### How to move to a fork after cloning
https://gist.github.com/jagregory/710671

1. Fork their repo on Github
2. In your local, add a new remote to your fork; then fetch it, and push your changes up to it

>git remote add my-fork git@github...my-fork.git

>git fetch my-fork

>git push my-fork

