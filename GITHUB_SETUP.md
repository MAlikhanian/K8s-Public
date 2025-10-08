# GitHub Repository Setup Instructions

## Step 1: Create a New GitHub Repository

1. Go to [GitHub](https://github.com)
2. Click the **+** icon in the top-right corner
3. Select **New repository**
4. Fill in the repository details:
   - **Repository name**: `k8s-configs` (or your preferred name)
   - **Description**: "Kubernetes and Helm configuration files for various deployments"
   - **Visibility**: Choose Public or Private (recommend Private if it contains sensitive info)
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)
5. Click **Create repository**

## Step 2: Push Your Local Repository to GitHub

After creating the repository on GitHub, you'll see instructions. Use these commands:

### Option A: Using HTTPS

```bash
git remote add origin https://github.com/YOUR-USERNAME/k8s-configs.git
git branch -M main
git push -u origin main
```

### Option B: Using SSH (if you have SSH keys set up)

```bash
git remote add origin git@github.com:YOUR-USERNAME/k8s-configs.git
git branch -M main
git push -u origin main
```

**Replace `YOUR-USERNAME` with your actual GitHub username!**

## Step 3: Verify

After pushing, refresh your GitHub repository page and you should see:
- librechat.yaml
- README.md
- .gitignore

## Future Updates

To push future changes:

```bash
# Check status of files
git status

# Stage your changes
git add .

# Commit with a descriptive message
git commit -m "Your commit message here"

# Push to GitHub
git push
```

## Quick Reference Commands

```bash
# View current remote
git remote -v

# Check current branch
git branch

# View commit history
git log --oneline

# Pull latest changes from GitHub
git pull
```

## Security Reminder

⚠️ **NEVER commit sensitive information** like:
- API keys
- Passwords
- Secrets
- Private certificates

The `.gitignore` file is configured to prevent common secret files from being committed, but always double-check before pushing!
