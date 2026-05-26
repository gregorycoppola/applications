# What This Does Not Prove

The result that sigmoid transformers can exactly realize belief propagation
is formal and verified. The applications that follow from it range from
well-established to speculative. This doc states clearly what the theory
does not prove, to prevent the formal result from being overextended.

## The Theorem Is About Sigmoid Transformers

Production transformers use SwiGLU (Llama) or GeLU (GPT), not sigmoid
activation. The exact BP equivalence holds for sigmoid transformers under
the constructive weight mapping. For production transformers:

- The architecture is compatible with BP-like computation
- Gradient descent finds approximately correct BP solutions empirically
  (bayes-learner val MAE 0.000752)
- But exact equivalence is not established for all trained models

The theorem is a constructive existence result: there exist weights that
make a sigmoid transformer implement exact BP. It does not say that all
trained transformers implement BP, or that any particular trained model
does.

## Attention Is Not Literally Logical Conjunction

The AND/OR framing is mechanistically motivated but is an interpretation,
not a theorem about arbitrary trained attention heads. Specifically:

- Boolean-AND heads (sharp discrete routing) match the constructive account
  most directly
- Hub heads are interpretable as AND routing to a fixed position
- Continuous-OR heads implement something compatible with but not identical
  to the binary BP construction
- Mixed heads are not yet characterized

Roughly 90% of heads across studied models fall into the first three
categories. The remaining ~10% are genuinely uncharacterized.

## The Factor Graph Is Not Directly Observable

The implicit factor graph of a trained transformer is encoded in learned
weights, not explicitly declared. Current SAEs cover a small fraction of
the residual stream's representational capacity. This means:

- Factor graph nodes (SAE features) are partially identified, not complete
- Factor graph edges (W1/W2 relationships) have not been systematically
  recovered
- The full factor graph of any production model has not been read out

The claim that SAE features correspond to factor graph nodes is an
empirical hypothesis with supporting evidence, not a proven theorem.

## Residual Dimensions Are Highly Superposed

The formal construction uses one dedicated dimension per proposition.
Production models use superposition: thousands of concepts are encoded
as nearly-orthogonal directions in a space with thousands of dimensions.
This means:

- The one-to-one correspondence between dimensions and propositions does
  not hold in production models
- The factor graph is implicit and superposed, not explicit and sparse
- Reading the factor graph requires working at the SAE feature level,
  which is technically difficult and incomplete

## The Applications Are at Different Epistemic Levels

The applications in this repo range from direct consequences of the formal
theorem to speculative architectural proposals. Specifically:

- The hallucination account follows directly from the grounding definition
- The interpretability predictions are empirical hypotheses
- The agent and planning accounts are architectural proposals
- The scaling law explanation is a mechanistic interpretation
- The training objective suggestions are speculative

Each doc's status table marks which level applies to each claim.

## What Would Falsify the Core Interpretation

The BP interpretation of transformers would be significantly weakened if:

- Boolean-AND heads do not exhibit rank-1 Q/K structure under SAE analysis
- SAE features fail to organize into stable dependency structure
- FFN updates are not locally interpretable as belief updates
- Deeper layers do not improve iterative reasoning behavior
- Belief-like geometry fails to appear in residual streams
- Gradient descent does not find BP-like solutions on clean synthetic tasks

The bayes-learner and loopy experiments provide positive evidence on the
last point. The others remain open empirical questions.