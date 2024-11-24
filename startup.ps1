

# Set micromamba root to .\.env
$env:MAMBA_ROOT_PREFIX=Join-Path -Path (Get-Location) -ChildPath ".env"

# If .\.env does not exist
if (-Not (Test-Path -Path ".env")) {
    
    if (-Not (Test-Path .\micromamba.exe)) {
      # Download micromamba (9.4 KB)
      curl.exe -L -o micromamba.exe "https://github.com/mamba-org/micromamba-releases/releases/latest/download/micromamba-win-64"
    }
    
    # Create .\.env
    New-Item -ItemType Directory -Path $env:MAMBA_ROOT_PREFIX | Out-Null
    
    # configure environment variables to enable micromamba workflow
    .\micromamba shell hook -s powershell | Out-String | Invoke-Expression
    
    # activate micromamba environment in .\.env
    micromamba activate
    
    # Install python (670 MB)
    micromamba install -y python=3.10
    
    micromamba config remove channels defaults
    
    micromamba deactivate
    
} else {
  # configure environment variables to enable micromamba workflow
  .\micromamba shell hook -s powershell | Out-String | Invoke-Expression
}

# activate micromamba environment in .\.env
micromamba activate

# Install other requirements
python -m pip install -r requirements.txt

micromamba install -y gh git

if ((gh auth status 2>&1) -match "You are not logged into any GitHub hosts\. To log in, run: gh auth login") {
    gh auth login --hostname github.com --git-protocol https --web
}

if (-Not (Test-Path -Path ".git")) {
  git init -b main
  git branch --set-upstream-to=origin/main main
}

function git-sync {
  param (
    [string]$Message
  )
  git add -A
  git commit -am $Message
  git push --all origin
}

function new-branch {
  param (
    [string]$BranchName
  )
  git branch --track $BranchName
  git checkout $BranchName
}

$GitHubUsername = (gh auth status | Select-String -Pattern "Logged in to github.com account (\S+)" | ForEach-Object { $_.Matches.Groups[1].Value }).Trim()
$RepoName = Split-Path -Leaf (Get-Location)
$Repos = gh repo list
if ($Repos -match $RepoName) {
  git remote add origin "https://github.com/$GitHubUsername/$RepoName.git" 2>$null
} else {
  gh repo create --public --source .
  git-sync "initial commit"
}

git pull

start powershell "jupyter lab"

'To commit all files and sync to github:'
'git-sync "message"'
'To create and move to a new branch:'
'new-branch newbranchname'
