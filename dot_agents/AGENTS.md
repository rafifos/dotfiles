# Agent Instructions

> **Note:**
> This document gives instructions to AI coding agents (Copilot, Codex,
> Claude Code, and related tools). These instructions apply to all
> workspaces, all projects, and all sessions.

---

## 1. Shell Selection

### Impact: CRITICAL

The user's default shell is `fish`. You must use `fish` for all
terminal commands.

### 1.1 Use fish for All Commands

Always use `fish` shell syntax when you write terminal commands.
Do not use `bash`, `zsh`, `sh`, or other shell syntax.

#### Incorrect: bash-specific syntax

```bash
# Bash array syntax — not valid in fish
TOOLS=(node python go)
for tool in "${TOOLS[@]}"; do
    echo "$tool"
done

# Bash variable expansion — not valid in fish
export VAR="value"
echo $VAR

# Bash conditional — not valid in fish
if [[ "$VAR" == "value" ]]; then
    echo "match"
fi
```

#### Correct: fish syntax

```fish
# Fish array syntax
set TOOLS node python go
for tool in $TOOLS
    echo $tool
end

# Fish variable expansion
set -x VAR "value"
echo $VAR

# Fish conditional
if test "$VAR" = "value"
    echo "match"
end
```

### 1.2 Fish-Specific Rules

Obey these rules when you write fish commands:

- Use `set` to set variables, not `export` or `VAR=value`.
  - `set -x VAR value` exports to the environment.
  - `set -l VAR value` keeps it local.
- Use `end` to close blocks (`if`, `for`, `while`, `function`,
  `switch`, `begin`).
- Use `test` or `[ ]` for conditionals. Do not use `[[ ]]`.
- Use `()` for command substitution, not `$()`.
- Use `$var[1]` for array indexing (1-based).
- Use `set -g` for global variables and `set -U` for universal
  variables.
- Chain commands with `; and` or `; or`, not `&&` or `||`,
  unless the command runs in a sub-shell where POSIX syntax is
  necessary.

### 1.3 Common Fish-vs-POSIX Mappings

Use these fish equivalents for common POSIX patterns:

| POSIX (bash/zsh/sh) | Fish | Notes |
| --- | --- | --- |
| `$?` | `$status` | Exit code of last command |
| `$RANDOM` | `random` | Generate random number |
| `sed 's/foo/bar/'` | `string replace foo bar` | String substitution |
| `grep -o` | `string match -r` | Extract matching text |
| `$(cmd)` | `(cmd)` | Command substitution |
| `$((a + b))` | `math "a + b"` | Arithmetic |
| `[[ -f $f ]]` | `test -f $f` | File test |
| `[[ -z $s ]]` | `test -z $s` | Empty string test |
| `case $x in ... esac` | `switch $x; case ...; end` | Pattern match |
| `shift` | `set -e argv[1]` | Shift arguments |
| `exec 2>&1` | `cmd 2>&1` | Redirect stderr to stdout |
| `nohup cmd &` | `cmd &; disown` | Background and detach |

### 1.4 When You Cannot Use fish

If a tool or script must have POSIX shell syntax (for example, a
`Dockerfile` `RUN` instruction, a Makefile recipe, or a CI
pipeline script), use POSIX `sh` syntax. Add a short comment
that tells the reader why fish syntax is not used:

```dockerfile
# POSIX sh required — Docker RUN uses /bin/sh
RUN for f in *.txt; do echo "$f"; done
```

---

## 2. Tool Invocation

When you call the `run_in_terminal` tool, the terminal uses fish
as its shell. Write all commands in fish syntax. The tool keeps
environment variables, the working directory, and other context
between commands in the same terminal session.

---

## 3. Verification

Before you submit a command, make sure:

1. All variables use `set`, not `export` or `VAR=value`.
2. All blocks close with `end`.
3. All conditionals use `test` or `[ ]`, not `[[ ]]`.
4. All command substitutions use `()`, not `$()`.
5. Pipe chains and redirections use fish syntax.
