---
name: persona-review
description: "Persona-based review panels for proposals, PRs, architecture decisions, product specs, budgets, go/no-go decisions, and any document that benefits from multi-stakeholder feedback. Use when the user asks for a 'review', 'panel review', 'persona review', 'red team', 'stress test this', 'what would [role] think', 'get feedback from the team', 'devil's advocate', or presents a document/proposal for critique. Also triggered by: reviewing architecture, evaluating a business case, assessing launch readiness, or any go/no-go decision."
metadata:
  {
    "openclaw":
      {
        "emoji": "🎭",
      },
  }
---

# Persona Review System

Run multi-stakeholder reviews using 9 deep professional personas that debate each other to surface blind spots, tensions, and risks.

## Quick Start

- **Single persona:** "Review this as Raj (Principal Engineer)"
- **Auto-select panel:** "Review this architecture doc" (system picks relevant personas)
- **Named panel:** "Get feedback from Nadia, Tom, and Raj"
- **Full board:** "Full board review of this proposal"
- **Tension review:** "Where would the team disagree on this?"

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

## Orchestration Protocol — 3-Round Debate

### Round 1: Independent Review

Spawn one parallel agent per selected persona. Each agent receives:
- The full document being reviewed
- Their persona file (loaded from `personas/[id].md`)
- These instructions:

```
You are [Name], [Role]. Read your persona file completely — internalize the mental model, review style, blind spots, and signature questions.

Review the following document entirely in character:
1. Lead with your First Question
2. Apply your signature questions — ask every one that's relevant
3. State your initial verdict: APPROVE / CONDITIONALLY APPROVE / BLOCK / ABSTAIN
4. List your top 3 concerns in priority order
5. Acknowledge your blind spots — what might you be missing given your known weaknesses?

Stay in character. Your tone, priorities, and concerns should be unmistakably yours.
```

### Round 2: Cross-Review Debate

After all Round 1 reviews are collected, spawn a second wave of parallel agents. Each persona receives:
- Their original review
- ALL other personas' Round 1 reviews
- These instructions:

```
You are [Name], [Role]. You've now seen how every other reviewer assessed this document.

Respond to the other reviews:
1. Challenge: Where do you disagree with another persona? Be specific — name them, quote their concern, and explain why you see it differently.
2. Concede: Where did another persona raise something you missed? Acknowledge it honestly.
3. Escalate: Did reading the other reviews surface a NEW concern you didn't see in Round 1?
4. Update your verdict if the debate changed your assessment.

This is a real debate. Don't be polite for the sake of it. Defend your position where you believe you're right, and concede where the evidence compels you.
```

### Round 3: Final Verdicts

Spawn a final wave. Each persona receives the Round 2 debate and produces:
- **Final verdict:** APPROVE / CONDITIONALLY APPROVE / BLOCK
- **Position change:** Did the debate change your verdict? If yes, explain what convinced you.
- **Conditions:** If conditionally approving, what must be true before you'd fully approve?
- **Non-negotiable:** The one thing that absolutely must be addressed regardless of verdict.

### Synthesis

After Round 3, the orchestrator (you, not a persona) produces:

```
## Panel Review Synthesis

### Document: [title]
### Panel: [list of personas and names]
### Context: [POC/MVP/Production/Bug Fix/Refactor]

### Verdict Summary
| Persona | R1 Verdict | R3 Final Verdict | Changed? |
|---------|-----------|------------------|----------|
| ... | ... | ... | ... |

### Consensus Points
[Things all personas agreed on]

### Key Tensions
[Specific disagreements that persisted through the debate, with both sides' reasoning]

### Unresolved Risks
[Concerns that were raised but not fully addressed]

### Conditions for Approval
[Aggregate list of conditions from all CONDITIONALLY APPROVE verdicts]

### Composite Recommendation
[Your synthesis: should this proceed, with what modifications?]
```

## Platform-Specific Implementation

### OpenClaw (sessions_spawn)

Use `sessions_spawn` for each round:
```
Round 1: Spawn N agents in parallel, each with persona + document
Round 2: After all Round 1 announce, spawn N agents with all reviews
Round 3: After Round 2, spawn final wave for verdicts
```

Each sub-agent announces back to the session. The orchestrator reads all announcements before proceeding to the next round.

### Claude Code (Agent tool)

Use the Agent tool with `subagent_type: "general-purpose"`:
```
Round 1: Launch N parallel Agent calls, each with persona + document
Round 2: Collect Round 1 results, launch N parallel agents with all reviews
Round 3: Collect Round 2 results, launch final parallel agents
```

### Sequential Fallback (no parallelism)

If neither parallel mechanism is available, run the review in a single context:
1. For each selected persona, read their file and write their Round 1 review in character
2. After all Round 1 reviews, revisit each persona with the full set of reviews (Round 2 debate)
3. Write final verdicts for each persona (Round 3)
4. Produce synthesis

This is slower but still enables the debate dynamic.

## Review Output Format (Per Persona, Per Round)

### Round 1 Template
```
## [Name] — [Role]
**First Question:** [Their signature opening question applied to this document]

**Assessment:**
[2-4 paragraphs of in-character review]

**Signature Questions Applied:**
- [Question]: [Finding]
- [Question]: [Finding]
...

**Initial Verdict:** [APPROVE / CONDITIONALLY APPROVE / BLOCK / ABSTAIN]

**Top 3 Concerns:**
1. [Most critical]
2. [Second]
3. [Third]

**Blind Spot Acknowledgment:** [What they might be missing]
```

### Round 2 Template
```
## [Name] — Round 2 Response

**Challenges:**
- Re: [Other Persona]'s point about [X]: [disagreement and reasoning]

**Concessions:**
- [Other Persona] raised [Y] which I missed because [blind spot reason]

**New Concerns:**
- After reading [Persona]'s review, I now also worry about [Z]

**Updated Verdict:** [same or changed, with explanation]
```

## Context Awareness

Before starting the review, identify the context and tell each persona:

| Context | Signal | Persona Adjustment |
|---------|--------|-------------------|
| POC/Spike | Experimental, time-boxed, learning-focused | All personas relax standards, focus on what was learned |
| MVP | First release, validating core hypothesis | Focus on core path quality, accept rough edges |
| Production | Full release, customer-facing | Full rigor from all personas |
| Bug Fix | Fixing existing issue | Focus on root cause, regression risk, blast radius |
| Refactor | Restructuring without behavior change | Focus on before/after equivalence, operational impact |

Include context in every agent prompt: "This is a [CONTEXT] review. Adjust your standards accordingly per your Context Awareness section."

## When to Suggest a Review

If a user presents a document, proposal, or plan and asks for feedback without explicitly requesting a persona review, suggest it:

"This looks like it could benefit from a multi-perspective review. Want me to run it through a persona panel? Based on the content, I'd recommend [personas] — they'd surface [what each would catch]."

Do not auto-invoke. Always ask first.
