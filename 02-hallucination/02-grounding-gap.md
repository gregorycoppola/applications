# The Grounding Gap

## Two Kinds of Reliability

There are two distinct kinds of reliability a language model can have:

1. **Empirical reliability**: the model produces correct outputs most of the
   time on a given distribution, as measured by benchmarks, human evaluation,
   or calibration studies.

2. **Formal reliability**: the model's outputs are guaranteed correct relative
   to a specified knowledge base and ontology, by a verifiable proof.

Current LLMs have empirical reliability. Grounded BP systems — transformers
operating over a declared factor graph with a verifier — have formal
reliability in restricted settings. The gap between these two is the
grounding gap.

## Why Scaling Does Not Close It

Scaling improves empirical reliability monotonically. But it does not create
a declared ontology, a finite concept space, or a verifier. A 405B parameter
model with no grounding structure still cannot provide formal correctness
guarantees, regardless of how low its hallucination rate is on benchmarks.

The grounding gap is not a quantitative gap that more parameters will close.
It is a structural gap between two different kinds of system.

## What Would Close It

Closing the grounding gap requires building systems that combine:

- Neural inference (the transformer's BP computation) with
- Symbolic grounding (a declared ontology and verifier)

This is the QBBN program. The LLM does the inference; the logical structure
provides the grounding. Together they produce a system that is both
flexible (can reason over natural language) and formally reliable (outputs
are verifiable against a declared knowledge base).