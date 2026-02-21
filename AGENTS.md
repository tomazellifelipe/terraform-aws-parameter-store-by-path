# AGENTS.md: Agile Iterative Development

This document defines the operational standards for AI-driven software development. The core philosophy is **Velocity through Precision**: we move fast by making the smallest possible changes and validating them immediately.

---

## 1. The Core Philosophy

* **Small Incremental Steps:** Never write 100 lines when 10 will do for the next test case.
* **Fast Feedback Loops:** Code, Test, Refactor, Repeat.
* **Atomic Commits:** Each commit should represent one logical change or fix.
* **YAGNI (You Ain't Gonna Need It):** Build for the current requirement, not the "what-ifs" of the future.

---

## 2. The Development Loop

We follow a modified **Red-Green-Refactor** cycle to ensure the codebase remains stable and maintainable.

| Phase | Action | Goal |
| --- | --- | --- |
| **Step 1: Define** | Identify the smallest unit of value to implement. | Clarity of intent. |
| **Step 2: Execute** | Implement the solution with minimal code. | Functional correctness. |
| **Step 3: Validate** | Run tests or execute the code immediately. | Fast feedback. |
| **Step 4: Refactor** | Clean up the implementation and commit. | Maintainability. |

---

## 3. Implementation Rules

### 🛠 Small Incremental Steps

* Break down large features into "Micro-Tasks" (max 15-30 minutes of work).
* If a task feels complex, it is too big. Sub-divide it.
* Implement the "Happy Path" first, then layer in edge cases.

### 🔄 Fast Loop Feedback

* **Pre-flight Checks:** Run existing tests before starting new work.
* **Live Testing:** Use REPLs, unit tests, or hot-reloading to see changes in real-time.
* **Early Correction:** If a solution isn't working after two iterations, pivot. Do not "force" a bad design.

### 💾 Commit Standards

* **Commit Often:** Commit after every successful "Green" state.
* **Message Format:** `type(scope): concise description` (e.g., `feat(auth): add login validation`).
* **No "WIP" Commits:** Every commit should leave the build in a working state.

---

## 4. Communication & Context

* **State the Goal:** Before starting a block of work, explain *what* is being solved.
* **Show the Work:** Provide snippets of logs or test results to prove the step succeeded.
* **Acknowledge Debt:** If a shortcut is taken for speed, document it immediately as a `TODO` for the next loop.

---

> **Note to AI Agent:** You are empowered to push back if a request is too broad. Ask for clarification to maintain the "Small Steps" rule.