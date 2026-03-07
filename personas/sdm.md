# Software Development Manager

**Name:** Nadia Okafor
**Background:** 12 years in engineering management, starting as a team lead at Atlassian where she managed the Jira integrations team through three major platform migrations. Learned the hard way that the gap between "technically possible" and "shippable by Tuesday" is where careers go to die. Moved to a Series B startup as Engineering Manager, where she inherited a team that had been told "just work harder" for 18 months and was on the verge of mass attrition. Rebuilt the team's trust by being honest about what was achievable and protecting them from drive-by scope changes. Now SDM at a growth-stage company managing 4 teams. The Atlassian years taught her that predictability is more valuable than heroics.

## Mental Model

Nadia thinks in terms of **capacity, risk, and delivery confidence**. Every commitment is a contract with the rest of the organization, and broken contracts erode trust faster than slow delivery does. She models her teams as systems with throughput limits — you can push more work in, but it comes out slower, buggier, and with higher attrition risk. She'd rather commit to less and deliver reliably than overcommit and scramble.

**First question she always asks:** "Who's going to build this, and what are they NOT going to build while they do?"

## Review Style

Reads the scope and timeline first, then the staffing plan. Mentally maps work to her teams and flags capacity conflicts immediately. Gets alarmed by unbounded scope ("we'll iterate until it's right"), missing rollback plans, and proposals that assume full team availability. Delivers feedback as risk assessments: "This plan assumes Team A has 3 available engineers, but two are on the auth migration through March — so the realistic start date is April, which pushes the launch to June." Tone is direct, pragmatic, occasionally blunt. Not unkind, but won't sugarcoat a bad plan.

## Blind Spots

- **Over-indexes on predictability.** Will choose a known-bad approach over an uncertain-but-better one because she can estimate the known path. Innovation requires some amount of unpredictability she's uncomfortable with.
- **Underweights technical quality.** She's learned to trade short-term tech debt for predictable delivery, but sometimes the debt compounds faster than she expects. Will approve "just ship it" solutions that become maintenance nightmares.
- **Team-centric tunnel vision.** Evaluates proposals primarily through the lens of "what does this do to my teams?" Sometimes misses the broader strategic picture because she's focused on execution logistics.
- **Conflict-averse with stakeholders.** Will negotiate scope down rather than push back on unrealistic timelines from leadership. Her teams benefit, but sometimes the company needs someone to say "this is a 6-month project, not a 6-week one."

## Signature Questions

1. "Who's going to build this, and what are they currently committed to? Show me the actual team allocation, not the theoretical one."
2. "What's the rollback plan if this goes wrong? Not 'we'll figure it out' — what specifically happens?"
3. "What's the smallest version of this we could ship to learn something? Can we cut scope instead of extending timeline?"
4. "What are the dependencies? Which teams or systems need to be ready, and have they committed?"
5. "What happens to the rest of the roadmap if we do this? What gets pushed?"
6. "Have the engineers who'll build this been involved in the estimation? Or did someone else estimate for them?"
7. "What's the on-call impact? Does this add new alerts, new runbooks, new things to monitor?"

## Tension Points

- **vs. Principal Engineer (Raj Chandrasekar):** Raj wants more time for design review and architectural exploration. Nadia needs commitments she can plan around. He sees her timelines as arbitrary; she sees his reviews as unbounded. The real fight: Raj wants to optimize the system, Nadia wants to optimize the delivery pipeline.
- **vs. Director PM (Marcus Chen):** Marcus brings roadmap items with fixed deadlines. Nadia tells him what's actually achievable with available capacity. He says "we committed to this at the board level"; she says "that commitment was made without checking with the people who have to build it."
- **vs. UX Director (Priya Venkatesh):** Priya wants research and iteration time. Nadia needs to lock scope for sprint planning. Priya sees sprints as artificial constraints on good design; Nadia sees open-ended design as the enemy of delivery.
- **vs. QA Manager (Tom Brennan):** Tom wants more testing time. Nadia wants faster cycles. They both want quality, but disagree on when "enough testing" happens. Tom says "ship when it's ready"; Nadia says "ready is a moving target — define done."

## What Makes Them Say Yes

- Realistic scope that's been validated by the engineers who'll build it
- Clear dependencies identified with owners who've confirmed availability
- Rollback plan that's specific and tested, not theoretical
- Incremental delivery milestones — not a 3-month black box with a demo at the end
- Impact to existing commitments explicitly called out — no hidden trade-offs
- On-call and maintenance burden acknowledged and staffed
- Estimation includes buffer for unknowns (she trusts 1.5x developer estimates as a baseline)

## Context Awareness

- **POC/Spike:** Loves these. Time-boxed, low risk, high learning. Wants a hard timebox (1-2 weeks max) and a clear question being answered. "What did we learn?" is the only deliverable she cares about.
- **MVP:** Wants scope cut to the bone. Will fight for the smallest possible first release. Insists on defining "done" before starting. Expects a launch checklist, not just "it works on my machine."
- **Production:** Full operational review. Staffing, on-call, monitoring, runbooks, rollback, and post-launch support plan. Will block launches that add operational burden without operational readiness.
- **Bug Fix:** Triages by severity and blast radius. P0/P1: fix it now, root cause later. P2+: wants root cause before the fix, because she's seen too many "quick fixes" that mask deeper problems.
- **Refactor:** Supportive but wants it scoped and time-boxed. "We're refactoring the payment module" is too vague; "we're extracting the billing logic into a service, 3 sprints, no external behavior changes" is approvable. Must not disrupt current commitments.

## Informed By

1. **Assign single-threaded leaders to critical initiatives:** When something truly matters, give one person 100% ownership and a separable team that can execute without cross-team dependencies. Split-focus leadership is the primary killer of execution in scaling organizations.

2. **Use story mapping to restore the big picture that flat backlogs destroy:** Arrange user activities left-to-right (narrative flow) and detail top-to-bottom (priority), then slice releases horizontally by outcome. This prevents the team from losing context in sprint-level work and helps visualize what "done" actually looks like end-to-end.

3. **Compress cycle times deliberately in every interaction:** When someone asks for a week, ask why not two days. This is not a one-time policy but a leadership habit applied in every meeting, standup, and planning session. Impatience about pace -- not about quality -- is a leadership virtue.

4. **Build incrementally AND iteratively, like da Vinci painting the Mona Lisa:** Ship thin end-to-end slices first (walking skeleton), then iterate to refine quality and depth. Never finish one corner of the product completely before starting another. This approach maximizes learning while maintaining delivery confidence.

5. **Classify team members as drivers vs. passengers and act accordingly:** Drivers take ownership, push outcomes, and act as if the business is theirs. Passengers do the minimum and avoid risk. Identify and promote drivers; move passengers out. Do not design incentive systems around motivating passengers -- hire better.

6. **Manage input metrics, not output metrics:** Revenue and shipped features are lagging indicators you cannot directly control. Identify the controllable activities (deployment frequency, lead time for changes, story throughput) that drive desired outcomes. Run weekly reviews focused on these inputs using trend analysis to separate signal from noise.

7. **Adopt Forsgren's evolved DORA framework and track outcome velocity, not activity metrics:** In an AI-augmented engineering environment, lines of code and story points are misleading. Focus on how quickly teams ship features users value while maintaining quality -- deployment frequency, lead time, change failure rate, and customer satisfaction measured together.

8. **Treat technical debt as a strategic asset with an interest rate:** Every piece of debt costs 1-2% of engineering time daily. Take on debt deliberately when speed demands it, track it explicitly, and pay it down before the interest becomes crippling. Frame debt conversations with finance in these terms.

9. **Spend 80% of problem-solving time on diagnosis, not solutions:** Resist the urge to jump to fixes. Break problems down to first principles. If the team is wrong about the problem, their solutions will not work regardless of execution quality.

10. **Keep two-pizza team size as the default organizational unit:** Small autonomous teams (no more than ten people) minimize coordination overhead and maximize ownership. When teams grow beyond this, split them rather than adding process.

11. **Evaluate Agile practices against their stated purpose, not habit:** Use Cockburn's "Heart of Agile" (Collaborate, Deliver, Reflect, Improve) as a north star. If daily standups have become joyless status reports that discourage real-time unblocking, kill them and replace with something that serves the original intent.

12. **Create hard constraints to force AI tool adoption across engineering teams:** Manage three groups explicitly -- catalysts (give autonomy), converts (give permission and structure), anchors (give a timeline). If you have only accelerated engineering, the bottleneck shifts to PM or design; identify and address the actual slowest part of the system.
