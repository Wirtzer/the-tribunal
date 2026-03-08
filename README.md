# The Tribunal

**Created by [Alex Wirtzer](https://github.com/Wirtzer)**

Every proposal has blind spots. Every architecture has hidden risks. Every business case has optimistic assumptions. The problem isn't that teams lack expertise. It's that no single perspective catches everything, and real cross-functional debate rarely happens before decisions are made.

The Tribunal puts 9 deeply-modeled expert personas in a room with your document. Each one carries battle-worn best practices and industry principles, not just a job title and a checklist. They have distinct professional backgrounds, mental models, blind spots, and signature questions built from real frameworks and hard-won judgment. They don't just review independently; they challenge each other. The SDM pushes back on the Principal Engineer's timeline. Finance questions the PM's revenue projections. QA asks the question nobody wants to hear. The result is the kind of rigorous, multi-angle stress test that usually only happens after something goes wrong.

Works with Claude Code and OpenClaw.

## Personas

| Persona | Name | Role | Core Lens |
|---------|------|------|-----------|
| [SDM](personas/sdm.md) | Nadia Okafor | Software Development Manager | Feasibility, team capacity, timeline, rollback plan |
| [Director PM](personas/director-pm.md) | Marcus Chen | Director of Product Management | Strategy, roadmap fit, stakeholder alignment, "why now" |
| [QA](personas/qa.md) | Tom Brennan | QA Manager | Edge cases, failure modes, test coverage, rollback tested |
| [Principal Engineer](personas/principal-engineer.md) | Raj Chandrasekar | Principal Engineer | Architecture, data model, scalability, reversibility |
| [Marketing](personas/marketing.md) | Vanessa Torres | Marketing Director | Positioning, differentiation, GTM narrative, naming |
| [BI Manager](personas/bi-manager.md) | Elena Vasquez | BI Manager | Measurement, instrumentation, baseline, causal logic |
| [Finance](personas/finance.md) | Diana Kowalski | Finance / Controller | Fully-loaded cost, ROI, payback period, opportunity cost |
| [Ops](personas/ops.md) | James Thornton | Operations Director | Post-launch reality, exception handling, runbooks, who gets paged |
| [UX](personas/ux.md) | Priya Venkatesh | UX Director | User journey, all UI states, real user testing, copy |

## How It Works

### Default Review
The orchestrator selects relevant personas, then spawns parallel agents — each loaded with their **full persona file** including deep expertise, mental models, and signature questions. If reviewers disagree, a focused debate round resolves the tension. One round of expert-depth review, debates only where they matter.

1. **Scan** — orchestrator selects personas using the compact index, identifies concerns and tensions
2. **Expert Review** — parallel agents each get their full persona file and review in character with all their expertise
3. **Tension** — focused debate only between disagreeing personas, only on contested points
4. **Verdict** — synthesis with consensus, tensions, conditions, and recommendation

### Full Tribunal (opt-in)
For the highest-stakes decisions. Adds two more rounds of cross-review debate where personas directly challenge each other, concede points, and issue final verdicts noting what changed their mind.

## Quick Start

### Claude Code
Copy or symlink this directory, then:
- `"Review this architecture doc"` — auto-selects relevant personas
- `"Run a review with Raj and Tom"` — specific personas
- `"Full tribunal on this proposal"` — maximum depth, 3-round debate

### OpenClaw
```bash
./install.sh
```
Then `/persona-review` or let the system auto-detect.

## Tension Map

The key conflicts that make reviews productive.

### Speed vs Quality
| Tension | Why |
|---------|-----|
| **SDM vs Principal Engineer** | Nadia needs predictable delivery; Raj needs architectural integrity. |
| **SDM vs QA** | Nadia wants to hit sprint commitments; Tom wants comprehensive test coverage. |
| **Director PM vs QA** | Marcus pushes faster cycles; Tom says you can iterate fast or safely, not both. |

### Innovation vs Stability
| Tension | Why |
|---------|-----|
| **Director PM vs Ops** | Marcus ships fast; James wants operational readiness before launch. |
| **Principal Engineer vs Ops** | Raj proposes novel architectures; James asks who debugs them at 2 AM. |
| **UX vs Ops** | Priya designs rich experiences; James has to keep the infrastructure running. |

### Revenue vs Cost
| Tension | Why |
|---------|-----|
| **Director PM vs Finance** | Marcus builds cases with conviction; Diana stress-tests with skepticism. |
| **Marketing vs Finance** | Vanessa wants brand budget; Diana wants every dollar measurable. |
| **SDM vs Finance** | Nadia asks for headcount; Diana asks for more output per head. |

### Data vs Intuition
| Tension | Why |
|---------|-----|
| **BI Manager vs Director PM** | Elena wants data; Marcus sometimes moves on strategic intuition. |
| **BI Manager vs Marketing** | Elena wants statistical evidence; Vanessa operates on qualitative signal. |

### User Experience vs Technical Reality
| Tension | Why |
|---------|-----|
| **UX vs Principal Engineer** | Priya designs for user mental models; Raj designs for system boundaries. |
| **UX vs SDM** | Priya wants more research time; Nadia needs locked scope for sprint planning. |

## Smart Selection

Not every review needs all 9. The system selects based on content:

| Document Type | Recommended Personas |
|--------------|---------------------|
| Code / Architecture | Principal Engineer, QA, SDM, Ops |
| Product Spec | Director PM, UX, QA, Principal Engineer |
| Budget / Business Case | Finance, BI Manager, Director PM, Ops |
| GTM / Launch Plan | Marketing, Ops, UX, BI Manager |
| Hiring / Team Plan | SDM, Director PM, Finance |
| Data / Analytics | BI Manager, Principal Engineer, Finance |
| Full Board | All 9 (explicit request only) |

## Installation

```bash
./install.sh
```

Or manually copy to:
- OpenClaw: `~/.openclaw/skills/persona-review/`
- Claude Code: `~/.claude/skills/persona-review/`

## Lessons Learned

_This section will be updated as the system is used in real reviews. Patterns, surprises, and refinements go here._
