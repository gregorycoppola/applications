# Agents as Bayesian Networks

## The Standard Agent Loop

An LLM agent is typically described as: perception → reasoning → action,
iterated. The LLM provides the reasoning step; tool calls, memory reads,
and environment observations provide perception; text output or API calls
provide action.

This description is functional but not formal. It does not say what
reasoning *is*, or how perception and action relate to it mathematically.

## The BP Vocabulary for the Agent Loop

The BP framework provides a formal vocabulary for describing each component
of the agent loop. This is not a proof that agents *are* Bayesian networks
in every mechanistic detail — it is a claim that the BP language maps
naturally onto agent components and may provide useful formal tools for
reasoning about them.

Under this interpretation:

- **Perception** can be described as evidence injection: observations
  condition the factor graph, updating beliefs at relevant nodes.
- **Reasoning** can be described as BP inference: the transformer runs
  message passing over its implicit graph, propagating evidence through
  learned connections.
- **Action** can be described as decision inference: the output is the
  argmax (or a sample) of the posterior over action nodes given current
  beliefs.
- **Memory** can be described as persistent factor graph state: long-term
  beliefs that persist across agent steps, updated by each new observation.
- **Tool calls** can be described as factor graph queries: the agent
  conditions on a query, infers the answer, and conditions the result
  back into the graph.

Whether these correspondences are exact or approximate depends on how
grounded the underlying factor graph is. For an ungrounded LLM, they are
interpretive. For a grounded transformer operating over a declared QBBN,
they become formal.

## The QBBN as the Logic Layer

The "logic in between" — the structured reasoning that connects perception
to action — can be formalized as a QBBN: a quantified Bayesian network with
AND/OR factor structure. The LLM provides the neural inference component;
the QBBN provides the logical structure that makes the reasoning
compositional and verifiable.

This suggests a hybrid architecture where every component — neural and
symbolic — is described in the same probabilistic language. Whether this
architecture can be built and scaled is an open research question.

## What This Framework Suggests

- Formal verification of agent reasoning steps may be possible in grounded
  settings
- Principled composition of multiple agents has a natural description as
  distributed BP
- Grounded memory with consistency guarantees becomes architecturally
  conceivable
- Decision-making with calibrated uncertainty at every step is a natural
  target

## Status of the Claims

| Claim | Status |
|---|---|
| BP vocabulary maps onto agent components | Mechanistic interpretation |
| LLM reasoning is BP inference | Empirical hypothesis |
| Grounded agent loop has formal BP account | Architectural proposal |
| QBBN provides verifiable logic layer | Architectural proposal |
| Formal verification of agent steps is possible | Speculative extension |