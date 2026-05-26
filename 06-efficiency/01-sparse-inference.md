# Sparse Inference and Pruning

## The Factor Graph is Sparse

A full transformer forward pass runs attention over all token pairs and
FFN over all hidden units. But the implicit factor graph is sparse: each
node has only a few neighbors, and most conditional relationships are zero
or near-zero.

If you can identify the sparse factor graph structure — which SAE features
actually matter for a given inference task, which AND connections are active,
which OR gates are relevant — you can skip the rest. This is structured
pruning with a theoretical justification.

## Task-Specific Factor Graphs

Different tasks activate different subgraphs of the implicit factor graph.
A question about geography activates different SAE features and different
factor connections than a question about arithmetic. If you can identify
the task-relevant subgraph at inference time, you can route computation
accordingly — running only the heads and FFN units that matter for the
active subgraph.

This is the theoretical foundation for mixture-of-experts and sparse
attention: they are approximations to task-specific factor graph routing,
and the BP framework gives a principled account of what they are
approximating.

## Distillation as Factor Graph Compression

Knowledge distillation — training a small model to mimic a large one —
can be understood as factor graph compression: finding a smaller factor
graph that approximates the posteriors of the larger one. The BP framework
gives a principled objective for distillation: minimize KL divergence
between the posteriors of the teacher and student factor graphs, not just
between their output distributions.

## The Pruning Target

The BP result gives a specific pruning target: identify the SAE features
that are active for a given task, trace the AND connections that route
evidence to those features, and the OR gates that update them. Everything
else can be pruned without affecting the relevant posteriors. This is
principled pruning, not heuristic pruning.