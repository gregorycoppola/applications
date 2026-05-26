# Planning as Inference in a Bayesian Network

## Planning and MDPs

Planning is the problem of selecting actions to achieve goals. The standard
formal model is the Markov Decision Process: a set of states S, actions A,
transition probabilities P(s' | s, a), a reward function R(s, a), and a
discount factor. The goal is to find a policy π(a | s) that maximizes
expected cumulative reward.

MDPs are Bayesian networks. States are random variables. Transition
probabilities are factor potentials. The value function V(s) — the expected
future reward from state s under the optimal policy — is a marginal
posterior in this network. Policy evaluation is inference; policy improvement
is optimization over the inferred value function.

## BP as Policy Evaluation

Belief propagation over the MDP factor graph is policy evaluation. Each
round of BP propagates value estimates one step further into the future —
exactly the structure of dynamic programming. The Bellman equation:

    V(s) = max_a [ R(s,a) + γ Σ_{s'} P(s'|s,a) V(s') ]

is a message passing update: the value at state s is computed from the
values of its neighbors (successor states), weighted by transition
probabilities.

A transformer running BP over an MDP factor graph is computing value
estimates iteratively across layers. Each layer is one step of policy
evaluation. A transformer with L layers can perform L-step lookahead.

## What LLMs Are Already Doing

When an LLM "plans" by reasoning about future states in a chain-of-thought,
it is approximating this process. The implicit factor graph encodes learned
transition-like relationships between states of the world. The attention
mechanism routes information about current state to the relevant transition
factors. The FFN updates value estimates.

This is why chain-of-thought helps planning: it gives the model more
effective "rounds of BP" by externalizing intermediate value estimates into
the context window, where they can be attended to in subsequent forward
passes. The context window becomes explicit working memory for the MDP
inference.

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
logical structure. The verifier provides the correctness guarantee.

This is the architecture that resolves LeCun's critique that LLMs do not
plan properly. The critique is correct for ungrounded LLMs. It does not
apply to a transformer operating over a grounded MDP factor graph with a
declared state space and verified transitions.

## Planning is Simpler Than General Reasoning

The QBBN analysis shows that planning is a restricted form of logical
inference. Full theorem proving requires reasoning by cases with assumption
changes — the slow, exponential part of logical deduction. Planning is
forward inference plus ∨-elimination over action choices: you propagate
value estimates forward and select the action with highest expected value.

This means planning does not require the full power of general reasoning.
A transformer with enough layers to do multi-step lookahead, operating over
a grounded MDP factor graph, can plan correctly without solving the general
theorem-proving problem. The architecture is sufficient; the question is
grounding.