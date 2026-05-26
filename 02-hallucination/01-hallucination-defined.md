# Hallucination Has a Formal Definition

## The Standard Account

Hallucination is typically described informally: the model says something
false or unsupported. This is a behavioral description, not a mechanistic
one. It gives no account of *why* hallucination happens or what would
prevent it.

## The BP Definition

In the BP framework, hallucination is precisely defined: a model hallucinates
when its output beliefs diverge from the correct posterior given the evidence.

For a grounded transformer with a declared ontology and verifier, this
divergence is measurable: b(j) ≠ P_true(j), where P_true is the correct
posterior induced by the knowledge base and observed evidence.

For an ungrounded transformer, the comparison is not well-defined because
there is no formally declared ground truth to compare against. Hallucination
in ungrounded models is not a numerical error in the inference procedure —
it is a consequence of operating without a fully specified and verifiable
grounding structure.

## What Grounding Requires

A fully grounded transformer would need:

1. A declared concept space: propositions explicitly represented and bounded
2. A declared relational structure: dependencies between concepts specified
3. A grounding procedure: natural language mapped into the declared system
4. A verification mechanism: outputs checked against the ontology

RAG is a partial form of grounding: it temporarily constrains the inference
space via retrieved documents. But it does not provide persistent ontological
structure or a verifier. It reduces hallucination empirically without
eliminating it formally.

## The Implication

Hallucination cannot be fully eliminated by scaling, RLHF, or any training
intervention applied to an ungrounded model. These improve empirical
reliability but do not provide formal correctness guarantees. Formal
guarantees require grounding. The BP result makes this precise.