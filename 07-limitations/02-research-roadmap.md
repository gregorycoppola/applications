# Research Roadmap

The BP interpretation of transformers is an active empirical program, not
a finished doctrine. This doc lists the open research directions that would
most advance or falsify the framework.

## Tier 1 — Most Directly Testable

These experiments follow directly from the formal predictions and could
be done with existing tools:

**Recover factor graphs from SAEs.**
Take a model with a trained SAE. For each boolean-AND head, project the
Q/K matrix onto the SAE feature basis. Check if the dominant component
corresponds to a monosemantic feature. Check if the V circuit routes from
a belief dimension to a scratch slot. If this succeeds for boolean-AND
heads, the routing half of the factor graph is legible.

**Test layer-wise belief convergence.**
Train a tiny transformer on a synthetic Bayes net with known ground-truth
posteriors. Measure how closely the residual stream at each layer matches
the BP belief after that many rounds of message passing. This would
directly test whether layers correspond to rounds of BP.

**Measure calibration by layer depth.**
Compare output calibration of models with different depths on reasoning
tasks that require multi-step inference. If deeper models are better
calibrated on longer chains, that supports the layers-as-BP-rounds account.

## Tier 2 — Requires New Infrastructure

These are important but need tooling that does not yet exist at scale:

**Complete SAE coverage of a production model.**
Current SAEs cover a fraction of residual stream capacity. A complete SAE
would make the full implicit factor graph legible. This is the single most
impactful infrastructure investment for the BP research program.

**Build and benchmark a grounded transformer + QBBN hybrid.**
A system where the transformer does neural BP and the QBBN provides the
logical grounding. Benchmark against standard LLMs on tasks that require
formal consistency: logical deduction, planning, multi-step arithmetic.

**Calibration benchmark for BP consistency.**
A benchmark that measures not just output calibration but layer-wise belief
consistency. Does uncertainty propagate correctly through the layers? Does
confidence degrade appropriately as reasoning chains lengthen?

## Tier 3 — Longer-Term Research Directions

**Learning grounded factor graphs from text.**
The QBBN requires logical forms that are not observed in text — they must
be learned as latent structure via expectation maximization. Scaling this
to large text corpora is the core unsolved problem for grounded language
understanding.

**Formal account of in-context learning as BP.**
The mechanistic account of why in-context learning works: each example
is an evidence injection into the factor graph, and the forward pass
computes the updated posterior. Make this precise and testable.

**Multi-agent BP convergence.**
Formal conditions under which a network of LLM agents running local BP
converges to correct global posteriors. When does it converge? How fast?
What graph structures cause failure?

## What Would Most Advance the Program

In order of expected impact:

1. The SAE factor graph recovery experiment — closes the loop between
   the formal theorem and trained models
2. Layer-wise convergence measurement — tests the layers-as-rounds claim
3. Grounded hybrid system benchmark — demonstrates the practical value
   of grounding

These three experiments together would either strongly confirm or
significantly revise the BP interpretation of transformers.