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
as a special case, then transformers already have the computational
architecture for formal reasoning built in. The question is not whether the
architecture supports logical inference — it does, by construction. The
question is whether the weights are trained to implement crisp logical rules
or soft statistical ones.

A transformer trained on mathematics or formal proofs is learning weights
that push the OR gates toward deterministic behavior. The same architecture
that does soft probabilistic inference over natural language is doing
something closer to logical deduction over formal notation. The architecture
is the same; the weight regime differs.

## Controlled vs. Learned Reasoning

This gives a precise account of the spectrum between "controlled" and
"learned" reasoning:

- **Fully controlled**: OR gate weights are fixed to be deterministic. The
  system implements exact logical deduction. No hallucination is possible
  because the factor potentials are specified, not learned. This is the
  QBBN in symbolic mode.

- **Fully learned**: OR gate weights are learned from data. The system
  implements soft probabilistic inference. Hallucination is possible when
  the learned weights diverge from the true posteriors. This is the standard
  LLM.

- **Hybrid**: some weights are fixed (known logical rules) and some are
  learned (uncertain statistical relationships). The system does principled
  inference that is partially grounded in formal logic and partially learned
  from data. This is the target architecture for reliable AI systems.

The transformer's BP structure supports all three modes. Current training
produces the fully learned mode. The grounding program is about moving
toward the hybrid mode.

## The Completeness Connection

The QBBN paper proves consistency and completeness with respect to the
first-order calculus: whatever is provable in first-order logic is provable
in the QBBN, and whatever the QBBN proves is consistent with first-order
logic. This means the QBBN — and by extension, a transformer with the right
weights — can in principle express any mathematical or scientific fact that
can be expressed in first-order logic.

This is a strong result. It means the architecture is not a limitation.
A transformer with grounded BP weights is not limited to pattern matching
over surface forms — it is capable of exact logical deduction over any
domain that can be expressed in first-order terms. The limitation of current
LLMs is not architectural; it is a matter of training and grounding.

## Fast vs. Slow Reasoning

The QBBN analysis connects directly to Kahneman's fast/slow distinction.
Fast reasoning is forward inference: causes propagate to effects in one
pass of BP. Slow reasoning requires reasoning by cases — exploring multiple
hypotheses, maintaining multiple belief states, backtracking. The number
of transformer layers bounds the depth of fast reasoning; slow reasoning
requires iteration or explicit search outside the model.

This gives a formal account of why LLMs are good at fast pattern-based
responses and struggle with multi-step deduction that requires maintaining
and revising hypotheses across many steps. It is not a fundamental
limitation of the BP architecture — it is a limitation of running a fixed
number of forward passes without an outer search loop.