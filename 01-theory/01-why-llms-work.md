# Why LLMs Work: A Theoretical Foundation

## The Problem

There is currently no widely accepted mechanistic theory of why next-token
prediction on text produces general intelligence. The standard story is
empirical: scaling laws hold, capabilities emerge, benchmarks improve.
Other theoretical programs exist — information-theoretic accounts,
compression views, in-context learning theory, grokking — but none has
achieved consensus as a mechanistic explanation of what the model is
computing.

## What the BP Framework Suggests

If transformers implement belief propagation over an implicit factor graph,
then next-token prediction can be interpreted as marginal inference in a
Bayesian network over language concepts. Under this interpretation, the
model behaves as though it is learning a structured probabilistic model of
the world and performing inference in it.

This suggests:

- A mechanistic account of what the model is computing
- An interpretation of why scaling works: bigger networks represent denser,
  deeper factor graphs with more inference capacity
- An interpretation of why depth matters: more layers means more rounds of
  BP, which means longer reasoning chains
- An interpretation of why width matters: more hidden units means richer
  factor potentials, more superposed concepts, finer-grained conditional
  relationships

These are mechanistic interpretations, not derived consequences of the
formal theorem. The theorem establishes that the architecture can implement
BP; whether any particular trained model does is an empirical question.

## Scaling Through the BP Lens

The scaling dimensions have natural BP interpretations:

- W (sequence length): nodes in the factor graph
- L (layers): rounds of belief propagation
- H (attention heads): AND patterns per round
- Dff (FFN hidden units): OR patterns per round
- Dmodel (embedding dimension): belief state capacity

Scaling may improve performance because it expands inference capacity —
more rounds, richer potentials, more simultaneous concepts. This is
qualitatively consistent with the BP interpretation, though the specific
power-law exponents are not derived from BP theory.

## What This Does Not Explain

The BP framework suggests a structure for what the model computes. It does
not by itself explain why the training distribution (internet text) happens
to produce a useful factor graph. That is a separate question about the
relationship between language, world knowledge, and Bayesian structure —
and an open one.

## Status of the Claims

| Claim | Status |
|---|---|
| Sigmoid transformers can implement BP | Formal theorem |
| Trained LLMs implement BP | Empirical hypothesis |
| Next-token prediction fits a Bayes net | Mechanistic interpretation |
| Scaling expands BP inference capacity | Mechanistic interpretation |
| BP explains power-law scaling exponents | Not established |