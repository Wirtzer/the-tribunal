---
name: persona-review
description: "The Tribunal — lean persona-based review panels for proposals, PRs, architecture decisions, product specs, budgets, go/no-go decisions, and any document that benefits from multi-stakeholder feedback. Use when the user asks for a 'review', 'panel review', 'persona review', 'tribunal', 'red team', 'stress test this', 'what would [role] think', 'get feedback from the team', 'devil's advocate', or presents a document/proposal for critique. Also triggered by: reviewing architecture, evaluating a business case, assessing launch readiness, or any go/no-go decision."
metadata:
  {
    "openclaw":
      {
        "emoji": "🎭",
      },
  }
---

# Persona Review System

Run multi-stakeholder reviews using 9 deep professional personas that surface blind spots, tensions, and risks.

## Quick Start

- **Single persona:** "Review this as Raj (Principal Engineer)"
- **Auto-select panel:** "Review this architecture doc" (system picks relevant personas)
- **Named panel:** "Get feedback from Nadia, Tom, and Raj"
- **Full board:** "Full board review of this proposal"
- **Tension review:** "Where would the team disagree on this?"
- **Full tribunal:** "Full tribunal on this proposal" (maximum depth, 3-round debate)

## Persona Index

| ID | Name | Role | Core Lens | File |
|----|------|------|-----------|------|
| sdm | Nadia Okafor | Software Dev Manager | Capacity, timeline, delivery risk, rollback | personas/sdm.md |
| director-pm | Marcus Chen | Director of PM | Strategy, "why now", roadmap fit, market timing | personas/director-pm.md |
| qa | Tom Brennan | QA Manager | Failure modes, test coverage, blast radius, silent bugs | personas/qa.md |
| principal-engineer | Raj Chandrasekar | Principal Engineer | Architecture, data model, reversibility, scalability | personas/principal-engineer.md |
| marketing | Vanessa Torres | Marketing Director | Positioning, naming, GTM narrative, differentiation | personas/marketing.md |
| bi-manager | Elena Vasquez | BI Manager | Measurement, baselines, causal logic, instrumentation | personas/bi-manager.md |
| finance | Diana Kowalski | Finance / Controller | Fully-loaded cost, ROI, payback period, kill criteria | personas/finance.md |
| ops | James Thornton | Operations Director | Runbooks, on-call, monitoring, failure recovery, SPOF | personas/ops.md |
| ux | Priya Venkatesh | UX Director | User journey, all UI states, real testing, copy, accessibility | personas/ux.md |

## Smart Selection Protocol

Before spawning agents, analyze the document and select only the relevant personas. Never default to all 9.

**Step 1: Classify the document type**

| Document Type | Default Panel |
|--------------|---------------|
| Code / Architecture / PR | principal-engineer, qa, sdm, ops |
| Product Spec / Feature Brief | director-pm, ux, qa, principal-engineer |
| Budget / Business Case | finance, bi-manager, director-pm, ops |
| GTM / Launch Plan | marketing, ops, ux, bi-manager |
| Hiring / Team Plan | sdm, director-pm, finance |
| Data / Analytics Proposal | bi-manager, principal-engineer, finance |
| Full Board | All 9 (only when explicitly requested) |

**Step 2: Explain your selection.** Before spawning agents, tell the user which personas were selected and why. Example: "For this architecture proposal, I'm pulling in Raj (architecture quality), Tom (failure modes), Nadia (delivery feasibility), and James (operational readiness). Want to add or remove anyone?"

**Step 3: Allow override.** The user can add or remove personas from the suggested set.

## Context Awareness

Before starting the review, identify the context and communicate it to each agent.

| Context | Signal | Persona Adjustment |
|---------|--------|-------------------|
| POC/Spike | Experimental, time-boxed, learning-focused | All personas relax standards, focus on what was learned |
| MVP | First release, validating core hypothesis | Focus on core path quality, accept rough edges |
| Production | Full release, customer-facing | Full rigor from all personas |
| Bug Fix | Fixing existing issue | Focus on root cause, regression risk, blast radius |
| Refactor | Restructuring without behavior change | Focus on before/after equivalence, operational impact |

## The Lean Tribunal — Orchestration Protocol

The default review mode. Token-efficient: the orchestrator loads `personas/index.md` (~900 words of compact summaries) instead of full persona files (~2,200 tokens each).

Full persona files (`personas/[id].md`) are only loaded on demand when deeper context is needed for a specific angle.

### Phase 1: Scan (orchestrator only, no agents)

1. Load `personas/index.md`
2. Read the document under review
3. Identify which personas are relevant (use the routing table as a starting point, but reason about the specific content)
4. Identify which specific concerns from each persona apply to THIS document
5. Identify where tensions exist between selected personas on THIS document
6. Tell the user:
   - Which personas were selected and why
   - What tensions to expect between them
   - Allow override (add/remove personas before proceeding)

### Phase 2: Targeted Review (parallel agents)

Spawn 1 agent per selected persona. Each agent receives ONLY:
- The document under review
- Their specific section from `personas/index.md` (not the full persona file)
- 2-4 targeted review questions extracted by the orchestrator from that persona's concerns and signature questions, tailored to THIS document
- The context level (POC/MVP/Production/Bug Fix/Refactor)

Agent prompt template:

```
You are [Name], [Role].

Your lens: [lens from index]
Your first question: [first question from index]

Review the following document with these specific focus areas:
[2-4 targeted questions the orchestrator extracted]

Context: This is a [CONTEXT] review.

Produce:
1. Your first question applied to this document
2. Findings for each focus area (2-3 sentences each)
3. Verdict: APPROVE / CONDITIONALLY APPROVE / BLOCK
4. Top concerns (max 3)
5. What you might be missing (per your blind spots: [blind spots from index])
```

### Phase 3: Tension (conditional — only if real conflicts exist)

The orchestrator reads all Phase 2 reviews. Two paths:

**If personas disagree on something substantive:** spawn a focused debate.
- Only between the personas that actually disagree
- Only on the specific point of disagreement
- Each debater gets: the contested point, both positions, and instructions to argue their case in 2-3 sentences

**If no real tensions:** skip straight to Phase 4.

### Phase 4: Verdict

The orchestrator synthesizes all reviews (and any debate) into:

```
## Tribunal Review

### Document: [title]
### Panel: [personas]
### Context: [POC/MVP/Production/Bug Fix/Refactor]

### Verdict Summary
| Persona | Verdict | Key Concern |
|---------|---------|-------------|

### Consensus
[What all reviewers agreed on]

### Tensions
[Disagreements with both sides — only if Phase 3 ran]

### Conditions for Approval
[From all CONDITIONALLY APPROVE verdicts]

### Recommendation
[Proceed / Proceed with conditions / Do not proceed — with reasoning]
```

## Full Tribunal Mode (opt-in)

For high-stakes decisions where maximum depth justifies the extra token cost, users can request `--full` or say "full tribunal."

This runs the original 3-round debate:

1. **Round 1 — Independent Review:** Each agent loads their full persona file (`personas/[id].md`), reviews the document entirely in character, applies all signature questions, states a verdict, and acknowledges blind spots.
2. **Round 2 — Cross-Review Debate:** Each agent receives all Round 1 reviews and responds: challenge disagreements by name, concede missed points, escalate new concerns surfaced by reading others, update verdict if warranted.
3. **Round 3 — Final Verdicts:** Each agent produces a final verdict, notes any position change and what caused it, lists conditions for approval, and names their one non-negotiable.
4. **Synthesis:** The orchestrator produces a composite report with per-persona verdict tracking (R1 vs R3), consensus points, persistent tensions, unresolved risks, aggregate conditions, and a composite recommendation.

Use full tribunal for: production launches, irreversible architecture decisions, large budget approvals, security-sensitive changes.

## Single Persona Mode

When the user asks for a single persona's perspective, load the full persona file (`personas/[id].md`) for that one persona and review entirely in character. No orchestration overhead needed.

## Platform-Specific Implementation

### OpenClaw (sessions_spawn)

- **Phase 2:** Use `sessions_spawn` to launch N agents in parallel, each with their persona slice from `index.md` + targeted questions + the document.
- **Phase 3 (if needed):** Use `sessions_spawn` for the focused debate between disagreeing personas only.
- **Full Tribunal:** Use `sessions_spawn` for each of the 3 rounds. Each sub-agent announces back to the session. The orchestrator reads all announcements before proceeding to the next round.

### Claude Code (Agent tool)

- **Phase 2:** Launch N parallel Agent calls (`subagent_type: "general-purpose"`), each with their persona slice + targeted questions + the document.
- **Phase 3 (if needed):** Launch parallel Agent calls for the debating personas only.
- **Full Tribunal:** Launch N parallel Agent calls per round, collecting results between rounds.

### Sequential Fallback (no parallelism)

If neither parallel mechanism is available, the orchestrator does everything in one context:
1. Run Phase 1 scan inline
2. For each selected persona, write their targeted review in character using their `index.md` section
3. After all reviews, check for tensions and resolve them inline
4. Produce the final verdict synthesis

This is slower but still delivers multi-perspective coverage in a single pass.

## When to Suggest a Review

If a user presents a document, proposal, or plan and asks for feedback without explicitly requesting a persona review, suggest it:

"This looks like it could benefit from a multi-perspective review. Want me to run it through a persona panel? Based on the content, I'd recommend [personas] — they'd surface [what each would catch]."

Do not auto-invoke. Always ask first.
