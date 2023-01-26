# AWS CodeCommit
## Set up (Windows)
### Local machine Git
- Install Git
- Set up Git user name and email

```
git config --global user.name "koheikawata"
git config --global user.email "koheikawata@xxxxx.com"
```

### CodeCommit
- Create repository
  - Developer Tools > CodeCommit > Repositories > Create Repository
  - Set `Repository Name` and create
- Create IAM role
  - IAM > Users > Add users
    - Set `User name`
    - Check `Access key - Programmatic access`
    - `Attach existing policies directly`
    - Add `AWSCodeCommitPowerUser`
    - Create user and memorize `User name` and `Access key ID`
- Generate Git credential for HTTPS
  - IAM > Users > [created IAM user] > Security credentials tab > HTTPS Git credentials for AWS CodeCommit > Generate credentials
  - Memorize `Git credential user name` and `Git credential`
- Obtain Git URL
  - Developer Tools > CodeCommit > Repositories > [Repository name] > Clone URL > Clone HTTPS
  - Memorize the Repository URL (ex. `https://git-codecommit.[region].amazonaws.com/v1/repos/[Repository name]`)

### First commit
- Powershell
```
mkdir [Repository name]
cd [Repository name]
git init
New-Item README.md
git add .
git commit -m "Initial commit"
git add remote origin [Repository URL]
git branch -m main
git config --global credential.UseHttpPath true
git push --set-upstream origin main
```

- Being asked to enter `Git credential user name` and `Git credential`
