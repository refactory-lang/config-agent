# speckit-shared

Shared [speckit](https://github.com/speckit) infrastructure for all [refactory-lang](https://github.com/refactory-lang) repositories. Added as a git submodule — one source of truth, auto-updated.

## Usage

### Adding to a new repo

```bash
git submodule add https://github.com/refactory-lang/speckit-shared.git speckit-shared
./speckit-shared/setup.sh  # configures post-checkout hook for auto-init
```

Then add symlinks from expected locations:

```bash
ln -s speckit-shared/.specify .specify
ln -s speckit-shared/.claude .claude
ln -s speckit-shared/.agents .agents
ln -s speckit-shared/.github/agents .github/agents
ln -s speckit-shared/.mcp.json .mcp.json
```

### Cloning a repo that uses this submodule

```bash
git clone --recurse-submodules <repo-url>
```

Or if you forgot `--recurse-submodules`:

```bash
git submodule update --init --recursive
```

The `post-checkout` hook auto-runs `git submodule update --init` after clone/checkout.

### Updating speckit across all repos

Update this repo, then in each consumer repo:

```bash
cd speckit-shared && git pull origin master && cd ..
git add speckit-shared
git commit -m "Update speckit-shared submodule"
```

## What's included

| Directory | Purpose |
|-----------|---------|
| `.specify/` | Templates, scripts, extensions (verify, sync, review, workflows) |
| `.claude/commands/` | Claude Code slash commands for speckit workflows |
| `.claude/skills/` | Claude Code skills for speckit |
| `.agents/commands/` | Agent harness commands |
| `.github/agents/` | GitHub Copilot agent definitions |
| `.githooks/post-checkout` | Auto-init submodules on clone/checkout |
| `.mcp.json` | Codemod MCP server config |
