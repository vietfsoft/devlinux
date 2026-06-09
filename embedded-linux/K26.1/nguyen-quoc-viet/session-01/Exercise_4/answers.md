# Exercise 4 — Shell Variable Scope

## Step 1 — Regular variable in current shell

```bash
MY_NAME="Quan"
echo $MY_NAME        # Output: Quan
```

**Result:** `Quan` is printed.

The variable `MY_NAME` exists in the current shell's memory and is visible within the same shell session.

---

## Step 2 — Child shell cannot see regular variable

```bash
bash
echo $MY_NAME        # Output: (empty)
exit
```

**Result:** Nothing is printed (empty line).

A regular variable is **local to the shell that created it**. When a child shell is spawned with `bash`, it does not inherit variables from the parent unless they are exported. The child shell starts with its own environment and has no knowledge of `MY_NAME`.

---

## Step 3 — Exported variable is visible in child shell

```bash
export MY_NAME="Quan"
bash
echo $MY_NAME        # Output: Quan
exit
```

**Result:** `Quan` is printed inside the child shell.

Using `export` marks the variable as an **environment variable**, which is passed to all child processes spawned from the current shell. When `bash` creates a new child shell, it copies the parent's exported environment, so `MY_NAME` is available.

---

## Step 4 — Child shell changes do not affect parent shell

```bash
bash
MY_NAME="Alice"
echo $MY_NAME        # Output: Alice  (inside child shell)
exit
echo $MY_NAME        # Output: Quan   (back in parent shell)
```

**Result:**
- Inside the child shell: `Alice`
- Back in the parent shell: `Quan`

Each shell process has its own **separate copy** of the environment. When the child shell modifies `MY_NAME`, it only changes its own local copy — the parent's copy remains unchanged. Changes in a child process are never propagated back to the parent.

---

## Summary

| Concept | Explanation |
|---|---|
| Regular variable | Visible only in the shell where it was created |
| Exported variable | Copied into the environment of all child processes |
| Child shell modification | Affects only the child's own copy, never the parent |

The key principle: **environment inheritance is one-way** — parent to child only. A child process receives a copy of the parent's environment at the time of creation; any subsequent changes (in either direction) are independent.
