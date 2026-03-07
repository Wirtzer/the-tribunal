# Persona Review System

A deep persona-based review system that brings 9 distinct professional perspectives to any document, proposal, PR, or architecture decision. Works in both [OpenClaw](https://github.com/nickclaw/openclaw) and Claude Code.

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

The system selects relevant personas based on what you're reviewing, spawns parallel agents (one per persona), and runs a 3-round debate:

1. **Round 1 - Independent Review:** Each persona reviews the document through their unique lens
2. **Round 2 - Cross-Review Debate:** Personas see each other's reviews and respond — challenging, agreeing, raising new concerns
3. **Round 3 - Final Verdicts:** Each persona gives their verdict, noting if the debate changed their position
4. **Synthesis:** Combined summary with consensus points, unresolved tensions, and a composite recommendation

## Quick Start

### Claude Code
Copy or symlink this directory, then in any project:
- `"Review this architecture doc"` - auto-selects relevant personas
- `"Run a persona review with Raj and Tom"` - specific personas
- `"Full board review"` - all 9 personas

### OpenClaw
Install as a skill:
```bash
./install.sh
```
Then invoke via `/persona-review` or let the system auto-detect when a review is appropriate.

## Tension Map

These are the key conflicts that make the debate productive. Each persona has a worldview that systematically conflicts with others.

### Speed vs Quality
| Tension | Why |
|---------|-----|
| **SDM vs Principal Engineer** | Nadia needs predictable delivery; Raj needs architectural integrity. She sees his reviews as scope creep; he sees her timelines as technical debt factories. |
| **SDM vs QA** | Nadia wants to hit sprint commitments; Tom wants comprehensive test coverage. She measures quality in ship dates; he measures it in confidence levels. |
| **Director PM vs QA** | Marcus pushes faster iteration cycles; Tom says you can iterate fast or safely, not both. Marcus sees Tom as a bottleneck; Tom sees Marcus as someone who's never explained a data breach to customers. |

### Innovation vs Stability
| Tension | Why |
|---------|-----|
| **Director PM vs Ops** | Marcus ships features fast; James wants operational readiness before launch. Marcus is excited about launch day; James worries about day 31. |
| **Principal Engineer vs Ops** | Raj proposes novel architectures; James asks who on the on-call rotation can debug them. Raj designs systems; James keeps them alive. |
| **UX vs Ops** | Priya designs rich, personalized experiences; James has to maintain the infrastructure. Every custom UI state is another thing to cache, invalidate, and debug. |

### Revenue vs Cost
| Tension | Why |
|---------|-----|
| **Director PM vs Finance** | Marcus builds business cases with conviction; Diana stress-tests them with skepticism. He's incentivized to launch; she's incentivized to make sure investments return. |
| **Marketing vs Finance** | Vanessa wants brand budget with fuzzy attribution; Diana wants every dollar measurable. Vanessa says brand is a moat; Diana says show her the moat in the P&L. |
| **SDM vs Finance** | Nadia asks for headcount; Diana asks for more output per head. They agree on data but interpret it differently. |

### Data vs Intuition
| Tension | Why |
|---------|-----|
| **BI Manager vs Director PM** | Elena wants data-backed decisions; Marcus sometimes moves on strategic intuition. She says "then you're guessing"; he says "waiting for data means missing the window." |
| **BI Manager vs Marketing** | Elena wants statistical evidence; Vanessa operates on qualitative signal. Elena says "12 customers is a dinner party, not a sample size." |

### User Experience vs Technical Reality
| Tension | Why |
|---------|-----|
| **UX vs Principal Engineer** | Priya designs for user mental models; Raj designs for system boundaries. She wants one API call per screen; he wants clean service decomposition. |
| **UX vs SDM** | Priya wants more time for research and iteration; Nadia needs locked scope for sprint planning. They agree on quality, disagree on when "good enough" arrives. |

## Smart Selection

Not every review needs all 9 personas. The system selects based on content:

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
# Symlink into both OpenClaw and Claude Code skill directories
./install.sh
```

Or manually copy to:
- OpenClaw: `~/.openclaw/skills/persona-review/`
- Claude Code: `~/.claude/skills/persona-review/`

## Lessons Learned

_This section will be updated as the system is used in real reviews. Patterns, surprises, and refinements go here._
