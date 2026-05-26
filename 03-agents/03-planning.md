# Planning as Inference in a Bayesian Network

## Planning and MDPs

Planning is the problem of selecting actions to achieve goals. The standard
formal model is the Markov Decision Process: a set of states S, actions A,
transition probabilities P(s' | s, a), a reward function R(s, a), and a
discount factor. The goal is to find a policy π(a | s) that maximizes
expected cumulative reward.

MDPs can be represented as dynamic Bayesian networks. States are random
variables. Transition probabilities are factor potentials. The value
function V(s) — the expected future reward from state s under the optimal
policy — is a quantity computed by inference in this network. Policy
evaluation is inference; policy improvement is optimization over the
inferred value function.

## BP and the Bellman Equation

Belief propagation over a dynamic Bayesian network representation of an
MDP is closely related to policy evaluation. Each round of BP propagates
value estimates one step further into the future, analogously to dynamic
programming. The Bellman equation:

    V(s) = max_a [ R(s,a) + γ Σ_{s'} P(s'|s,a) V(s') ]

can be interpreted as a message passing update: the value at state s is
computed from the values of its neighbors (successor states), weighted by
transition probabilities.

Under this interpretation, a transformer running BP over an MDP factor
graph could be seen as computing value estimates iteratively across layers,
with each layer corresponding to one step of policy evaluation and a
transformer with L layers performing L-step lookahead. This is a
mechanistic interpretation, not a proven equivalence for arbitrary trained
transformers.

## What LLMs May Already Be Doing

When an LLM reasons about future states in a chain-of-thought, it is
plausibly approximating this process. The implicit factor graph encodes
learned transition-like relationships between states of the world. The
attention mechanism routes information about current state to relevant
factors. The FFN updates value-like estimates.

One interpretation of why chain-of-thought helps planning: it provides
more effective rounds of inference by externalizing intermediate estimates
into the context window, where they can be attended to in subsequent
forward passes. The context window functions as explicit working memory
for the inference process.

This is consistent with the BP interpretation but not uniquely predicted
by it — other accounts of chain-of-thought could produce similar
predictions.

## The Limitation of Ungrounded Planning

Current LLMs plan over an ungrounded implicit factor graph. The states and
transitions are learned statistical associations, not a formally declared
MDP. This means:

- The state space is not explicitly enumerated
- Transition probabilities are not calibrated
- The value function is not provably correct
- The policy cannot be formally verified

The result is the pattern observed empirically: LLMs can do short-horizon
planning well but fail on long-horizon problems requiring precise state
tracking, because the implicit factor graph is not structured to maintain
exact state across many steps.

## Grounded Planning

A grounded planning system would combine:

- A formally declared state space (QBBN propositions over world states)
- Learned or specified transition probabilities (OR gate weights)
- A BP inference engine (the transformer)
- A verifier that checks plan correctness against the declared MDP

The transformer provides the inference capacity. The QBBN provides the
logical structure. The verifier provides the correctness guarantee. Whether
this architecture can be built and scaled is an open research question.

## Planning is Simpler Than General Reasoning

The QBBN analysis suggests that planning is a restricted form of logical
inference. Full theorem proving requires reasoning by cases with assumption
changes. Planning is forward inference plus selection over action choices:
propagate value estimates forward and select the action with highest
expected value.

This suggests planning does not require the full power of general reasoning
— a useful observation for system design, though the practical implications
depend on how well the grounding problem can be solved.

## Status of the Claims

| Claim | Status |
|---|---|
| MDPs can be represented as dynamic Bayes nets | Established (standard formalism) |
| Bellman equation resembles BP message passing | Mechanistic interpretation |
| Transformers doing BP perform L-step lookahead | Mechanistic interpretation |
| Chain-of-thought provides more rounds of inference | Empirical hypothesis |
| Ungrounded LLMs fail at long-horizon planning | Empirical observation |
| Grounded transformer + QBBN enables verified planning | Architectural proposal |
| Planning is simpler than general theorem proving | QBBN theoretical result |