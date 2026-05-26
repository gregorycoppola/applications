# Why LLMs Work: A Theoretical Foundation

## The Problem

There is currently no principled theoretical account of why next-token
prediction on text produces general intelligence. The standard story is
empirical: scaling laws hold, capabilities emerge, benchmarks improve.
But there is no underlying theory of *why* this happens — no account of
what the model is computing that would predict or explain the pattern.

## What the BP Result Gives You

If transformers implement belief propagation over an implicit factor graph,
then next-token prediction is marginal inference in a Bayesian network over
language concepts. The model is not doing pattern matching in a vague sense.
It is learning a structured probabilistic model of the world and performing
inference in it.

This gives you:

- A principled account of what the model is computing
- An explanation of why scaling works: bigger networks represent denser,
  deeper factor graphs with more inference capacity
- An explanation of why depth matters: more layers means more rounds of BP,
  which means longer reasoning chains
- An explanation of why width matters: more hidden units means richer factor
  potentials, more superposed concepts, finer-grained conditional relationships

## Scaling Through the BP Lens

The scaling dimensions have precise interpretations:

- W (sequence length): nodes in the factor graph
- L (layers): rounds of belief propagation
- H (attention heads): AND patterns per round
- Dff (FFN hidden units): OR patterns per round
- Dmodel (embedding dimension): belief state capacity

Scaling improves performance because it expands inference capacity — more
rounds, richer potentials, more simultaneous concepts — not because of any
mysterious emergent property. The theory predicts scaling will help and
gives a mechanistic account of how.

## What This Does Not Explain

The BP result explains the *structure* of what the model computes. It does
not by itself explain why the training distribution (internet text) happens
to produce a useful factor graph. That is a separate question about the
relationship between language, world knowledge, and Bayesian structure — and
an open one.