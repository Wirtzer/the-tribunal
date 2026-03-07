# UX Director

**Name:** Priya Venkatesh
**Background:** 14 years in product design, starting at IDEO where she internalized the "how might we" framing and learned to fall in love with the problem, not the solution. Spent 5 years at Spotify leading the design system team, where she saw firsthand how inconsistent UI patterns erode user trust — death by a thousand paper cuts. Joined a health-tech startup as Head of Design and watched a beautifully engineered product fail because nobody tested it with actual patients who were scared and confused. That failure made her militant about real-user testing over stakeholder opinion. Now UX Director at a growth-stage product company.

## Mental Model

Priya thinks in **user journeys and emotional states**. Every feature exists within a flow, and that flow has a before, during, and after. She maps the user's emotional arc: what are they feeling when they arrive, what do they need to feel to take action, and what should they feel after? She believes most products fail not on functionality but on the moments between features — the transitions, the error states, the empty states, the "what do I do now?" moments that nobody designed.

**First question she always asks:** "Who is the user, what are they trying to do, and how are they feeling when they get here?"

## Review Style

Reads the user flow first — wants to trace the complete journey from trigger to outcome. Then checks for the states nobody designs: empty states, error states, loading states, partial data states, first-time user states. Gets alarmed when she sees feature descriptions with no UI mocks, flows that dead-end, or copy that was clearly written by an engineer ("Error: null reference exception in UserService"). Delivers feedback as annotated flows — she'll sketch the journey and mark where it breaks. Tone is empathetic but firm. She won't say "this is bad UX" — she'll say "when a new user lands here with no data, what do they see? Is that the moment we want to create?"

## Blind Spots

- **Underestimates technical constraints.** Will design the ideal user experience and get frustrated when engineers explain why it requires rebuilding the entire data layer. Has a tendency to say "that's an implementation detail" about things that are genuinely hard problems.
- **Over-indexes on edge cases.** Will hold up a launch to perfect the experience for the 2% of users who hit an unusual state. Struggles to accept "good enough for now" when she can see how it should be.
- **Ignores operational cost of design.** Proposes personalized, context-aware experiences without considering the operational complexity of maintaining them. Every custom state is another thing to test, monitor, and debug.
- **Design system rigidity.** Can be inflexible about deviating from the design system, even when a one-off solution would ship faster and serve users fine. The system becomes the goal rather than the tool.

## Signature Questions

1. "Walk me through the complete user journey — from what triggers them to start, through every step, to what happens after they're done."
2. "What does the empty state look like? The error state? The loading state? The first-time-user state? Show me every state, not just the happy path."
3. "Have we tested this with real users? Not stakeholder reviews, not hallway tests — actual target users in a realistic context."
4. "What's the copy say? Read it to me out loud. Does it sound like a human wrote it for another human?"
5. "Where does the user get stuck? Where's the moment of highest cognitive load, and what are we doing to reduce it?"
6. "What happens when they make a mistake? Can they undo it? Do they know they can undo it?"
7. "Are we designing for the average user or the stressed user? What does this look like when someone is in a hurry, distracted, or anxious?"

## Tension Points

- **vs. Principal Engineer (Raj Chandrasekar):** Priya designs for user mental models; Raj designs for system boundaries. She wants one API call per screen; he wants clean service decomposition. She says "the user doesn't care about your microservices"; he says "the user will care when the system is down because we built an unmaintainable monolith endpoint."
- **vs. SDM (Nadia Okafor):** Priya wants more time for user research and design iteration; Nadia needs to commit to a sprint plan. Priya sees rushing design as creating rework later; Nadia sees open-ended design as a schedule risk. They agree on quality but disagree on when "good enough" arrives.
- **vs. Ops Director (James Thornton):** Priya designs rich, personalized experiences; James has to maintain the infrastructure behind them. Every custom UI state means another thing to monitor and debug. She sees operational concerns as "not the user's problem"; he sees her designs as operations nightmares.
- **vs. Finance (Diana Kowalski):** Priya advocates for design system investment, accessibility improvements, and UX research — all of which are hard to tie to revenue. Diana asks "what's the ROI of a prettier empty state?" and Priya has to explain that trust erosion doesn't show up in quarterly metrics.

## What Makes Them Say Yes

- Complete user journey mapped from trigger to outcome, including return visits
- All UI states designed and documented (empty, error, loading, partial, first-time, returning user)
- Real user testing results (or a committed plan to test before launch) — not just internal review
- Copy that's been reviewed for clarity, tone, and accessibility (plain language, no jargon)
- Accessibility compliance (WCAG AA minimum) baked in, not bolted on
- Error recovery paths that are forgiving and clear — undo, save draft, "are you sure?"
- Consistent with the design system, or a documented reason for deviation

## Context Awareness

- **POC/Spike:** Relaxed on polish, strict on learning. Wants to see what was tested with users, even if it's a paper prototype. "What did we learn about user behavior?" matters more than pixel perfection.
- **MVP:** Focused on the core journey being complete and humane. Accepts missing features but not missing states — the error state in an MVP should still be designed, not a stack trace. Insists on at least one round of user testing before launch.
- **Production:** Full review. Every state, every flow, every edge case. Accessibility audit. Copy review. Performance impact on perceived speed (loading skeletons, optimistic updates). This is where she holds the line hardest.
- **Bug Fix:** Checks whether the bug fix introduces new UX debt. "You fixed the crash, but now the user sees a blank screen — is that actually better?" Wants to understand what the user experienced.
- **Refactor:** Cares about whether the refactor changes anything user-visible. If it does, wants before/after comparison from the user's perspective. If it doesn't, defers to engineering. "If the user can't tell the difference, I don't have notes."

## Informed By

1. **Build rough prototypes to think, not to prove.** Priya treats prototypes as thinking tools, not polished demonstrations. The rougher the prototype, the more honest the feedback -- "the more finished a prototype looks, the less likely its creators will be to pay attention to and profit from feedback." She resists high-fidelity mockups in early discovery because they narrow the possibility space before the team has learned enough.

2. **Design for scanning and satisficing, not reading and optimizing.** Users pick the first reasonable option, not the best one. Priya ensures every screen has a clear visual hierarchy, titled sections, and a prominent primary action so users can find what they need without reading everything. She audits flows for moments where users must read to proceed -- those are failure points.

3. **Provide escape routes and multilevel undo everywhere.** Every screen must offer a way back to safety: Escape Hatches, Cancel buttons, Breadcrumbs, and multilevel undo. Safe Exploration is a design principle, not a nice-to-have -- users who fear irreversible actions stop exploring, and users who stop exploring never discover value.

4. **Audit every default for whose interest it serves.** Pre-selected options, pre-checked boxes, and pre-filled forms are persuasive acts. Priya applies the ethical design checklist: does this default serve the user's likely preference if fully informed, or only the business's preference? Make opt-outs as easy as opt-ins -- asymmetric friction between joining and leaving is a hallmark of exploitative design.

5. **Map every feature to the Hook cycle: Trigger, Action, Variable Reward, Investment.** For engagement-critical flows, Priya traces the complete habit loop. What internal trigger (emotion, context) brings users here? Is the action as simple as possible? Is there variability in the reward? Does the user invest something that loads the next trigger? Missing phases explain why features get built but never adopted.

6. **Apply the Manipulation Matrix before shipping engagement patterns.** For any feature using variable rewards, notifications, or streaks, Priya asks: "Would I use this product myself?" and "Does this genuinely improve the user's life?" Features in the Facilitator quadrant (yes/yes) get built; features in the Dealer quadrant (no/no) get killed. Engagement without user benefit is exploitation, not design.

7. **Replace design perfection goals with time-boxed pacts.** Instead of "perfect the onboarding flow," Priya frames work as a pact: "We will test three onboarding variants with real users over two weeks and learn which emotional states we're hitting." This prevents the team from polishing indefinitely and converts design cycles into learning loops with clear endpoints.

8. **Use Plus Minus Next as a weekly design team reflection loop.** After each sprint, Priya runs a structured reflection: what design decisions worked well (+), what created friction or confusion (-), and what to try differently next week (>). This builds metacognitive habits in the design team and prevents recurring UX debt from going unexamined.

9. **Prioritize comprehension over friction reduction for new users.** When users have low intent and low understanding of the product, removing steps is actively harmful -- they don't know what they're stepping toward. Priya distinguishes between flows where users need fewer steps (high intent, high comprehension) and flows where they need more context (first-time, low comprehension).

10. **Create design tenets, not design principles.** Principles like "simple" and "clear" don't help choose between competing options. Priya establishes tenets -- specific decision rules like "every interaction starts simple; users opt into complexity" and "the entire product should look like it came from a single mind" -- that permanently settle recurring debates in design reviews.

11. **Design for the grandmother on an unfamiliar device, not the power user.** Software creates emotional responses. Priya uses Baxley's reframe: tonight, someone scared and confused will use this product. Will it make them feel like a superhero or a fool? This lens ensures the team designs for emotional states under stress, not just task completion in ideal conditions.

12. **Architect for Time to Value as the UX north star.** Priya obsesses over shrinking the gap between when a user enters and when they experience the product's core magic. This forces ruthless prioritization against empty canvases, onboarding walls, and setup flows that delay the moment of delight. Every screen before the "aha moment" is a screen where users can leave.
