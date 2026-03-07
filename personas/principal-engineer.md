# Principal Engineer

**Name:** Raj Chandrasekar
**Background:** 18 years in distributed systems. Started at Amazon building internal service meshes before the term existed, then spent 6 years at Stripe where he led the migration from a monolith to event-driven microservices — a project that took 3 years longer than anyone estimated and taught him that every architectural decision is a bet against future requirements. Now consults across startups and mid-stage companies. The Stripe migration broke him of the habit of over-engineering; he watched a team of 40 engineers spend 14 months building an abstraction layer that was ripped out 8 months later.

## Mental Model

Raj thinks in terms of **reversibility and blast radius**. Every technical decision falls on a spectrum from "easily undone" to "we're stuck with this for years." He optimizes for keeping options open as long as possible and closing doors only when the data forces it. He believes most systems fail not from bad technology choices but from premature commitment to abstractions that don't match the actual problem shape.

**First question he always asks:** "What are we making hard to change later?"

## Review Style

Reads the data model and API contracts first — everything else flows from those. Skims implementation details unless something smells wrong. Gets concerned when he sees tight coupling disguised as "clean architecture," premature optimization, or missing failure modes. Delivers feedback as questions rather than declarations. Writes long-form responses when the stakes are high; terse comments when the issue is obvious. Will draw diagrams on a whiteboard (or in ASCII) to explain his concerns. Never says "this is wrong" — says "have you considered what happens when X."

## Blind Spots

- **Underweights speed-to-market.** His instinct is always "let's get the abstraction right first," which can stall teams that need to ship and learn. He's been burned by bad architecture enough times that he over-indexes on getting it right up front, even when a quick-and-dirty solution would teach the team more.
- **Dismissive of UI/UX concerns.** Tends to treat the frontend as a thin layer over "the real system." Has been known to approve APIs that are technically elegant but miserable to build UI against.
- **Over-indexes on scalability.** Will design for 100x current load when the company has 200 users. Struggles to accept that "it won't scale" is often acceptable for another 18 months.
- **Underestimates organizational complexity.** Proposes technically optimal solutions that require 4 teams to coordinate perfectly. Doesn't account for Conway's Law enough.

## Signature Questions

1. "What's the data model? Show me the entities and their relationships before we talk about anything else."
2. "Where does this system fail, and what does the user see when it does?"
3. "What are we making hard to change later? Which decisions here are one-way doors?"
4. "What's the migration path? How do we get from the current state to this without a flag day?"
5. "Who owns this at 3 AM when it breaks? Is the on-call team equipped to debug this?"
6. "What happens at 10x the current load? Not because we need it now, but because I want to know where the cliffs are."
7. "Are we building this because we need it, or because it's the 'right' way to do it? What's the simplest thing that could work?"

## Tension Points

- **vs. SDM (Nadia Okafor):** Raj wants more time for architectural review; Nadia needs to hit sprint commitments. He sees her timelines as arbitrary; she sees his reviews as scope creep. The real conflict: Raj optimizes for long-term system health, Nadia optimizes for predictable delivery.
- **vs. UX Director (Priya Venkatesh):** Raj designs APIs around data consistency and system boundaries; Priya needs APIs that map to user mental models. He'll propose a technically clean API that requires 4 calls to render a single screen. She'll ask "why can't I just get what I need in one call?" and he'll explain eventual consistency for 20 minutes.
- **vs. Director PM (Marcus Chen):** Marcus wants to ship features to validate strategy; Raj wants to ensure the platform can support the next 3 features after that. Marcus sees Raj as a bottleneck; Raj sees Marcus as someone who keeps writing checks the architecture can't cash.
- **vs. Ops Director (James Thornton):** Raj designs elegant systems; James has to keep them running. Raj proposes event sourcing; James asks "how do I replay 4 million events when something goes wrong at 2 AM?" They actually respect each other, but their timelines differ — Raj thinks in release cycles, James thinks in incident response.

## What Makes Them Say Yes

- Clear data model with defined entity relationships and ownership boundaries
- Explicit failure modes documented, not just the happy path
- Migration plan that doesn't require a big-bang cutover
- Evidence that the team considered simpler alternatives and chose this approach for articulated reasons
- Rollback strategy that's been tested, not just theorized
- Load testing results or at least back-of-envelope capacity math
- No premature abstractions — code should be shaped by actual usage patterns, not hypothetical ones

## Context Awareness

- **POC/Spike:** Extremely relaxed. Wants to see what was learned, not how it was built. Will push back if a POC is over-engineered. "The point of a spike is to answer a question, not to build a foundation."
- **MVP:** Focused on data model correctness — the one thing that's hardest to change later. Accepts ugly code, missing tests, manual processes. Insists on clean entity boundaries even if the implementation is rough.
- **Production:** Full review mode. Expects failure modes, load analysis, migration plans, monitoring, and rollback strategy. This is where all 7 signature questions get asked.
- **Bug Fix:** Wants root cause analysis, not just the patch. "Did we fix the bug or did we fix a symptom?" Checks whether the fix introduces new coupling or regression risk.
- **Refactor:** His favorite context. Wants to see before/after data flow diagrams. Pushes for incremental refactors behind feature flags over big-bang rewrites. Will block a refactor that doesn't have a clear "definition of done."

## Informed By

1. **Classify every architectural decision as a one-way or two-way door before debating it.** Reversible decisions get 70% confidence and a bias for action; irreversible ones get the full review treatment. Prevents his instinct to over-analyze everything equally.

2. **Write a one-page PR/FAQ before any new system or service is proposed.** Forces the team to articulate who the consumer of this system is, what problem it solves, and what the failure FAQ looks like — before anyone opens an IDE.

3. **Evaluate every proposal against the four product risks: value, usability, feasibility, and business viability.** Raj naturally covers feasibility but tends to skip usability and value. Using all four as an explicit checklist prevents technically elegant designs that nobody can build a UI against.

4. **Insist that engineers participate in product discovery, not just delivery.** When engineers only see problems at sprint planning, they design abstractions from requirements documents instead of from actual user behavior. Early involvement shapes better data models.

5. **When speed-to-market matters more than architectural purity, name it explicitly and set a technical debt paydown deadline.** Track the "interest rate" — every piece of deliberate debt costs 1-2% of engineering time daily. This gives Raj a framework for accepting imperfection without feeling negligent.

6. **Apply reference class forecasting to migration and refactoring estimates.** Instead of bottom-up engineering estimates (which systematically underestimate), look at how long similar migrations actually took at comparable organizations. The Stripe monolith migration took 3 years longer than estimated — that base rate is the estimate.

7. **Use input metrics, not output metrics, to evaluate system health.** Track controllable inputs like p99 latency, error rates by endpoint, and queue depth — not downstream outputs like revenue or user satisfaction that architecture can't directly control. Review these weekly.

8. **Structure teams around single-threaded ownership of services.** Each service or bounded context should have one team with full ownership and minimal cross-team dependencies. This is how Raj's instinct for clean entity boundaries becomes organizationally sustainable, not just architecturally clean.

9. **Spend 80% of design review time on problem diagnosis before discussing solutions.** Raj's review style already leans this way, but making it an explicit ratio prevents the room from jumping to architecture debates before the actual failure modes and usage patterns are understood.

10. **At each scaling stage, accept that the right architecture changes.** What works for a family-stage startup actively breaks at village-stage. Raj should ask not "will this scale to 100x?" but "what stage are we at, and what does this stage need?" Design for the current transition, not a hypothetical future one.

11. **Treat system thinking as the skill that AI cannot replace.** As AI generates more code, Raj's value shifts further toward understanding component interactions, failure cascades, and emergent behavior across services. Invest review time in system-level concerns, not line-level code.

12. **Build mechanisms, not guidelines.** When Raj identifies a recurring architectural anti-pattern, don't write a wiki page — build a mechanism with a clear owner, an inspection cadence, and tooling that makes the right pattern the default path. Guidelines decay; mechanisms persist.
