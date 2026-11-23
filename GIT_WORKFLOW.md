# Git Workflow & Upstream Sync Guide

This guide explains how this repository is set up with GitHub, how remotes work, and how to keep your personal fork synced with the base course repository (`kalhauge/jpamb`).

---

## 1. Repository Architecture & Remotes

This repository uses a standard triangular fork setup:

```
            kalhauge/jpamb (upstream)
                   │
                   ▼ (git fetch upstream)
            Local Workspace
                   │
                   ▼ (git push origin)
   hasan75/jpamb_program_analysis_02242 (origin)
```

| Remote | URL | Role |
| :--- | :--- | :--- |
| **`origin`** | `git@github.com:hasan75/jpamb_program_analysis_02242.git` | Your personal fork on GitHub. You have write/push access here. |
| **`upstream`** | `git@github.com:kalhauge/jpamb.git` | The instructor's base repository. Read-only; used to fetch new tests, benchmarks, and updates. |

Verify your remotes at any time with:
```bash
git remote -v
```

---

## 2. Summary Cheatsheet (Quick Copy & Paste)

When the instructor updates `kalhauge/jpamb`, run these commands to update your local repository, your GitHub fork, and your active project branch:

```bash
# 1. Fetch updates from the instructor
git fetch upstream --tags

# 2. Update your local main
git checkout main
git merge upstream/main

# 3. Push updated main to your GitHub profile
git push origin main

# 4. Bring updates into your active feature branch
git checkout project/metamorphic-testing
git merge main
```

---

## 3. Detailed CLI Workflow

### A. Fetching Updates from Base Repo (`upstream`)
To see what changes the instructor added without affecting your local work:
```bash
git fetch upstream
```
To also fetch any new version tags (e.g., `v0.10.0`):
```bash
git fetch upstream --tags
```

### B. Fast-Forwarding `main`
Keep your local `main` identical to `upstream/main`:
```bash
git checkout main
git merge upstream/main
```
*(As long as you don't commit custom code directly to `main`, this will always be a clean, automatic fast-forward).*

### C. Updating Your Remote Fork (`origin/main`)
Keep your GitHub fork's `main` branch synchronized:
```bash
git push origin main
git push origin --tags
```

### D. Updating Your Feature Branch
To integrate new benchmarks, test cases, or bug fixes into your working branch:
```bash
git checkout project/metamorphic-testing
git merge main
```

If there are any merge conflicts, Git will mark them in the affected files. Review them, resolve the conflicts, and commit:
```bash
git add <resolved-files>
git commit -m "Merge updates from upstream into project/metamorphic-testing"
```

---

## 4. Alternative: Syncing via the GitHub Web UI

If you prefer using the GitHub website:

1. Open your fork in your browser: [https://github.com/hasan75/jpamb_program_analysis_02242](https://github.com/hasan75/jpamb_program_analysis_02242)
2. Below the repository description, click the **"Sync fork"** button.
3. Click **"Update branch"**. This merges the base repository's `main` branch into your fork's `main` branch on GitHub.
4. Pull the updated branch into your local machine:
   ```bash
   git checkout main
   git pull origin main
   ```
5. Merge `main` into your feature branch:
   ```bash
   git checkout project/metamorphic-testing
   git merge main
   ```

---

## 5. Daily Development & Pushing to Your Profile

### Saving and Pushing Your Work
When you make changes in your working branch (`project/metamorphic-testing`):

```bash
# 1. Check what has changed
git status

# 2. Stage your files
git add <files>

# 3. Commit your changes
git commit -m "Describe your changes"

# 4. Push to your GitHub profile (origin)
git push -u origin project/metamorphic-testing
```

### Creating New Feature Branches
Always create new branches from an up-to-date `main`:
```bash
git checkout main
git pull origin main
git checkout -b feature/my-new-analysis
```
Push the new branch to your profile:
```bash
git push -u origin feature/my-new-analysis
```

---

## 6. Helpful Status & Inspection Commands

| Command | Purpose |
| :--- | :--- |
| `git status` | Shows modified files, untracked files, and current branch |
| `git branch -vv` | Shows local branches and which remote branch they track |
| `git remote -v` | Shows configured remote URLs (`origin` and `upstream`) |
| `git log --graph --oneline --all -n 15` | Visual commit tree showing where `upstream`, `origin`, and local branches point |
