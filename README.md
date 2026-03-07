# The Tribunal

9 expert personas that debate your proposals, code, and decisions from every angle. A token-efficient review system for Claude Code and OpenClaw.

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

Two modes, same personas:

### Lean Tribunal (default)
The orchestrator loads a compact persona index (~900 words total) and dispatches targeted review questions to parallel agents. Debates only spawn when real disagreements exist. ~15-25K tokens for a full review.

1. **Scan** — orchestrator selects personas and identifies concerns from the index
2. **Targeted Review** — parallel agents each get a compact persona summary + 2-4 tailored questions
3. **Tension** — focused debate only between disagreeing personas, only on contested points
4. **Verdict** — synthesis with consensus, tensions, conditions, and recommendation

### Full Tribunal (opt-in)
For high-stakes decisions. Loads complete persona files and runs a 3-round debate. ~100K+ tokens.

1. **Independent Review** — each persona reviews in full character with all signature questions
2. **Cross-Review Debate** — personas challenge, concede, and escalate after seeing each other's reviews
3. **Final Verdicts** — each persona gives their verdict, noting if the debate changed their position
4. **Synthesis** — consensus, persistent tensions, unresolved risks, composite recommendation

## Quick Start

### Claude Code
Copy or symlink this directory, then:
- `"Review this architecture doc"` — auto-selects relevant personas (lean mode)
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
