# Interpretability as Hypothesis Testing

## The Problem with Current Interpretability

Mechanistic interpretability is currently largely exploratory. Researchers
find circuits, name them, and describe what they do. This is valuable but
it is archaeology: you find things without knowing in advance what you are
looking for, and you cannot say what a *negative* result would mean.

## The BP Result Provides a Target

The BP framework generates specific, testable predictions about what trained
transformers should look like at the weight level:

- Boolean-AND heads should have approximately rank-1 Q/K circuits consistent
  with projectDim-style matching
- The dominant singular vector of the Q/K circuit should correspond to a
  monosemantic SAE feature
- The V circuit should show crossProject-style routing from a belief-encoding
  dimension to a scratch-slot dimension
- W1 rows of the FFN should cluster by input SAE feature
- W2 columns should correspond to interpretable belief updates
- The relationship between input and output SAE features for each FFN unit
  should be interpretable as a conditional probability table entry

These are not vague predictions. They are specific structural claims that
can be confirmed or falsified by inspecting the weights of a trained model
with a good SAE.

## What a Negative Result Would Mean

If boolean-AND heads do *not* show rank-1 Q/K structure, that would falsify
the constructive BP account for those heads — not just complicate it. The
BP framework is a genuine scientific hypothesis, not just an interpretive
lens, because it makes predictions that could be wrong.

## The Closing Experiment

The experiment that would most directly confirm the BP interpretation:

1. Take a model with a trained SAE
2. Identify boolean-AND heads by behavior
3. Project the Q/K matrix onto the SAE feature basis
4. Check if the dominant component corresponds to a monosemantic feature
5. Check if the V circuit routes from a belief dimension to a scratch slot
6. For active FFN units, check if input/output SAE feature pairs are
   interpretable as conditional relationships

If this succeeds, the implicit factor graph is legible: you can read the
factor potentials from the FFN weights and the graph structure from the
attention circuits.