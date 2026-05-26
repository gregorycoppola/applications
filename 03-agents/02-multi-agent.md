# Multi-Agent Systems as Distributed BP

## The Problem with Multi-Agent Coordination

Current multi-agent systems coordinate through message passing — agents
send text to each other and update their behavior. This is described
functionally but has no formal account of what the coordination is
computing or whether it converges to a correct answer.

## Distributed BP as the Model

If each agent is performing BP over its local factor graph, then a
multi-agent system is a distributed BP computation over a larger global
factor graph. The agents are nodes in a higher-level factor graph. Their
messages to each other are belief messages between nodes.

This is exactly the structure of loopy belief propagation on a graph too
large to fit in a single model. The global inference problem is decomposed
into local subproblems, each handled by one agent, with coordination
happening through message passing between agents.

## Convergence and Correctness

Loopy BP does not always converge, but in practice it converges on most
graph structures that arise in real problems. The empirical result from the
loopy repository — 100% convergence across 500 trials on five loopy graph
structures, mean KL divergence below 0.0002 — suggests the gap between
theory and practice is small.

For multi-agent systems, this means: if the agents are running BP locally
and passing beliefs correctly, the system converges to approximately correct
global posteriors. Coordination is not magic — it is distributed inference.

## Implications for Agent Design

- Agent boundaries should align with factor graph structure: agents that
  share many factor connections should communicate more
- Message formats between agents should carry calibrated beliefs, not just
  text
- Convergence criteria for multi-agent reasoning can be defined formally
  in terms of belief stability across agents