# Multi-Agent Systems and Distributed Inference

## The Problem with Multi-Agent Coordination

Current multi-agent systems coordinate through message passing — agents
send text to each other and update their behavior. This is described
functionally but has no formal account of what the coordination is
computing or whether it converges to a correct answer.

## Distributed BP as a Conceptual Model

If each agent is performing BP over its local factor graph, then a
multi-agent system can be interpreted as a distributed inference computation
over a larger global factor graph. The agents are nodes in a higher-level
factor graph. Their messages to each other are, conceptually, belief
messages between nodes.

This resembles loopy belief propagation on a graph too large to fit in a
single model: the global inference problem is decomposed into local
subproblems, each handled by one agent, with coordination happening through
message passing between agents.

This is an interpretive framework, not a proven equivalence. Real LLM
agents are not calibrated BP nodes. Communication between agents is lossy
text, not exact belief messages. Prompts mutate beliefs in ways that are
not equivalent to clean factor graph updates. The convergence guarantees
from formal loopy BP do not transfer directly to multi-agent LLM systems.

## What the BP Lens Suggests

Even without exact equivalence, the distributed BP framing suggests useful
design principles:

- Agent boundaries may work better when they align with natural factor
  graph structure — agents that share many relevant factor connections
  should communicate more
- Message formats that carry structured belief-like information (confidence
  estimates, explicit uncertainty) may coordinate better than raw text
- Convergence criteria inspired by BP belief stability could inform
  stopping rules for multi-agent deliberation

These are architectural suggestions motivated by the framework, not
consequences of the formal theorem.

## What Would Be Required for a Formal Account

For the distributed BP interpretation to become a formal account rather
than an analogy, agents would need to:

- Maintain calibrated beliefs over a shared, declared factor graph
- Pass exact or approximately correct belief messages, not free-form text
- Update beliefs according to BP message passing rules
- Operate over a graph structure where loopy BP is known to converge

None of these conditions hold for current LLM multi-agent systems. The
distributed BP framing is useful for thinking about coordination design,
not for making convergence guarantees about existing systems.

## Status of the Claims

| Claim | Status |
|---|---|
| Multi-agent systems resemble distributed BP | Mechanistic interpretation |
| BP lens suggests useful design principles | Architectural proposal |
| Current LLM agents converge to correct posteriors | Not supported |
| Formal convergence requires calibrated agents | Direct consequence of BP theory |
| BP-inspired coordination protocols may help | Speculative hypothesis |