# Agents as Bayesian Networks

## The Standard Agent Loop

An LLM agent is typically described as: perception → reasoning → action,
iterated. The LLM provides the reasoning step; tool calls, memory reads,
and environment observations provide perception; text output or API calls
provide action.

This description is functional but not formal. It does not say what
reasoning *is*, or how perception and action relate to it mathematically.

## The BP Account of the Full Loop

If the LLM is performing BP over an implicit factor graph, then the full
agent loop can be described in the same language:

- **Perception** is evidence injection: observations are conditioned into
  the factor graph, updating beliefs at the relevant nodes.
- **Reasoning** is BP inference: the transformer runs message passing over
  the implicit graph, propagating evidence through its connections.
- **Action** is decision inference: the output is the argmax (or a sample)
  of the posterior over action nodes given current beliefs.
- **Memory** is persistent factor graph state: long-term beliefs that
  persist across agent steps, updated by each new observation.
- **Tool calls** are factor graph queries: the agent conditions on a query,
  infers the answer, and conditions the result back into the graph.

Every component of the agent loop is a BP operation. The agent *is* a
Bayesian network, not just a system that contains one.

## The QBBN as the Logic Layer

The "logic in between" — the structured reasoning that connects perception
to action — can be formalized as a QBBN: a quantified Bayesian network with
AND/OR factor structure. The LLM provides the neural inference component;
the QBBN provides the logical structure that makes the reasoning
compositional and verifiable.

This gives a unified formal account of agents where every component —
neural and symbolic — is described in the same probabilistic language.

## What This Enables

- Formal verification of agent reasoning steps
- Principled composition of multiple agents
- Grounded memory with provable consistency guarantees
- Decision-making with calibrated uncertainty at every step