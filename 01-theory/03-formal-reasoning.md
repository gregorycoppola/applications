# Formal Reasoning as a Special Case

## The Spectrum from Logic to Probability

Classical first-order logic and probabilistic graphical models are usually
presented as separate formalisms. Logic is crisp: propositions are true or
false, rules are deterministic, inference is deduction. Probability is
graded: beliefs are distributions, rules are stochastic, inference is
marginalization.

The QBBN unifies these. It is a probabilistic graphical model over
propositions with AND/OR boolean structure, proven consistent and complete
with respect to the first-order calculus. Logical deduction is the special
case where the OR gate weights are deterministic — the factor potentials are
0 or 1, not learned probabilities. Statistical inference is the general case
where the weights are soft and learned from data.

## What This Means for Transformers

If transformers implement BP, and BP over a QBBN subsumes logical deduction
as a special case, then transformers have the computational architecture
that could support formal reasoning. The question is whether the weights are
trained to implement crisp logical rules or soft statistical ones.

A transformer trained on mathematics or formal proofs is learning weights
that push the OR gates toward more deterministic behavior. The same
architecture that does soft probabilistic inference over natural language
may do something closer to logical deduction over formal notation. The
architecture is the same; the weight regime differs.

## Controlled vs. Learned Reasoning

This suggests a spectrum between "controlled" and "learned" reasoning:

- **Fully controlled**: OR gate weights are fixed to be deterministic. The
  system implements exact logical deduction. This is the QBBN in symbolic
  mode.

- **Fully learned**: OR gate weights are learned from data. The system
  implements soft probabilistic inference. This is the standard LLM.

- **Hybrid**: some weights are fixed (known logical rules) and some are
  learned (uncertain statistical relationships). This is the target
  architecture for systems that combine flexibility with formal reliability.

The transformer's BP structure is compatible with all three modes. Current
training produces the fully learned mode. The grounding program is about
moving toward the hybrid mode.

## The Completeness Connection — and Its Limits

The QBBN paper proves consistency and completeness with respect to the
first-order calculus: whatever is provable in first-order logic is provable
in the QBBN, and whatever the QBBN proves is consistent with first-order
logic.

This is a result about *representational expressivity*, not about practical
inference capability. It says the QBBN can in principle express any
first-order fact — not that a transformer will reliably compute it, nor that
inference will be tractable, nor that the right weights will be learned from
data. The gap between "can represent" and "will reliably compute" is large
and not closed by the completeness result.

Concretely: a transformer with grounded BP weights is not thereby guaranteed
to do mathematics reliably. Mathematical reasoning requires not just the
right representational structure but also the right weights, sufficient
layers for the required inference depth, and a training procedure that
produces calibrated beliefs. The completeness result says the architecture
is not the bottleneck. It does not say the other bottlenecks are easy.

## Fast vs. Slow Reasoning

The QBBN analysis connects to Kahneman's fast/slow distinction. Fast
reasoning is forward inference: causes propagate to effects in one pass of
BP. Slow reasoning requires reasoning by cases — exploring multiple
hypotheses, maintaining multiple belief states, backtracking. The number of
transformer layers bounds the depth of fast reasoning; slow reasoning
requires iteration or explicit search outside the model.

This suggests why LLMs handle fast pattern-based responses well and struggle
with multi-step deduction requiring maintained hypotheses. It is not a
fundamental limitation of the BP architecture — it is a limitation of
running a fixed number of forward passes without an outer search loop.

## Status of the Claims

| Claim | Status |
|---|---|
| QBBN is consistent and complete w.r.t. first-order logic | Formal theorem (QBBN paper) |
| Transformers have architecture compatible with formal reasoning | Direct consequence |
| Trained transformers reliably do formal reasoning | Not established |
| Completeness implies practical mathematical competence | Explicitly not claimed |
| Hybrid controlled/learned architecture is achievable | Architectural proposal |
| Fast/slow distinction maps onto BP rounds | Mechanistic interpretation |