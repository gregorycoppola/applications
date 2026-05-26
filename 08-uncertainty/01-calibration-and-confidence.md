# Calibration, Confidence, and Uncertainty Propagation

## The Natural BP Application

One of the most direct applications of the BP framework is to uncertainty.
Belief propagation does not just compute point estimates — it computes
probability distributions over propositions. Every node in the factor graph
has a belief value in (0,1) representing the posterior probability that the
corresponding proposition is true given the evidence.

This means a transformer doing BP is not just producing answers — it is
maintaining calibrated uncertainty estimates over all the propositions in
its implicit factor graph. The question is whether current training
exploits this capacity.

## What Calibration Means in BP Terms

A well-calibrated BP system has the property that when it assigns
probability p to a proposition, that proposition is true approximately
p fraction of the time across a reference class of similar queries.
This is the standard definition of calibration, applied to the BP
posterior.

For a grounded transformer with a declared ontology, calibration is
formally measurable: compare the model's output beliefs to the true
posteriors computed from the declared knowledge base. For an ungrounded
transformer, calibration can only be measured empirically against held-out
data.

## Current LLMs Are Poorly Calibrated

Empirically, large language models are often overconfident: they assign
high probability to outputs even when the underlying evidence is weak or
ambiguous. This is consistent with the BP framing — an ungrounded model
with no verifier has no mechanism to check whether its confidence is
warranted.

In BP terms, overconfidence corresponds to OR gate weights that are too
extreme — the model has learned to produce near-certain outputs because
the training distribution rewards confident answers. The implicit factor
graph has been trained to minimize cross-entropy loss, which does not
directly penalize overconfidence.

## Uncertainty Propagation Through the Factor Graph

One of the most valuable properties of BP is that uncertainty propagates
correctly through the factor graph. If the evidence for a premise is weak,
the posterior over conclusions that depend on that premise is
correspondingly uncertain. This is the formal statement of "garbage in,
garbage out" — but quantified precisely.

For a transformer doing BP, this means:

- Uncertainty in early-layer beliefs propagates to later-layer conclusions
- A chain of weak inferences accumulates uncertainty across layers
- The final output belief reflects the combined uncertainty of all the
  premises it depends on

Current LLMs do not reliably exhibit this behavior. Confidence often
does not degrade appropriately as reasoning chains lengthen. This is
consistent with ungrounded training: the model has not learned to track
uncertainty provenance through its implicit factor graph.

## Calibration as a Training Target

The BP framework suggests a specific training objective for improving
calibration: directly penalize violations of the BP fixed-point equations
at each layer. If the model's beliefs at layer l+1 are inconsistent with
what BP would predict given the beliefs at layer l, penalize that
divergence.

This is a stronger target than standard calibration training, which
penalizes miscalibration only at the output. BP consistency training
would enforce calibrated uncertainty at every intermediate layer, which
would propagate to more reliable uncertainty at the output.

## Entropy and Decision Making

In a well-calibrated BP system, the entropy of the output belief is a
meaningful quantity: it measures genuine uncertainty about the proposition,
not just model confidence. High entropy means the evidence genuinely
underdetermines the answer; low entropy means the evidence strongly
supports one conclusion.

For agent decision-making, this matters directly. An agent that knows its
uncertainty — that can distinguish "I am confident this action leads to
the goal" from "I have no idea whether this action leads to the goal" —
can make better decisions: explore when uncertain, exploit when confident,
and ask for more evidence when the posterior entropy is high.

This is the formal foundation for uncertainty-aware agents. The BP
framework gives it a mechanistic account.

## Status of the Claims

| Claim | Status |
|---|---|
| BP computes calibrated posteriors by construction | Formal theorem |
| Transformers doing BP would be calibrated | Direct consequence |
| Current LLMs are poorly calibrated | Empirical observation |
| Poor calibration follows from ungrounded training | Mechanistic interpretation |
| BP consistency training would improve calibration | Architectural proposal |
| Uncertainty propagates through factor graph layers | Formal property of BP |
| Entropy is meaningful in a grounded BP system | Direct consequence |