# SAE Features as Factor Graph Nodes

## The Right Level of Abstraction

FFN hidden units are not the right unit for understanding the implicit
factor graph. A single hidden unit may participate in multiple factor
relationships via superposition, and a single factor relationship may
require multiple hidden units to implement accurately with non-sigmoid
activations.

The right unit is the SAE feature. Each monosemantic SAE feature — one
that activates for a single coherent concept — corresponds to one node
in the implicit factor graph. The feature direction in residual stream
space is where the belief value for that concept lives.

## What This Means for Interpretability Work

SAE features are not just a useful decomposition of the residual stream.
They are the semantic primitives of the implicit Bayesian network. Finding
a monosemantic SAE feature is finding a factor graph node. Finding the
relationship between two SAE features — how activating one changes the
probability of another — is finding a factor graph edge.

The "Golden Gate Claude" experiment is a direct demonstration of this:
clamping one SAE feature propagates structured downstream effects through
the model, exactly as injecting evidence into a factor graph node would.

## The Factor Graph is Readable

In principle, the full implicit factor graph of a trained transformer is
readable from its weights, given a complete SAE:

- Factor graph nodes: monosemantic SAE features
- Factor graph edges: W1 rows that respond to pairs of input features,
  whose W2 columns write to output features
- Factor potentials: the learned weights connecting input to output features

Current SAEs cover a small fraction of the residual stream's representational
capacity. As coverage improves, the factor graph becomes more legible. The
BP result gives interpretability research a specific target: complete the
SAE, then read the graph.