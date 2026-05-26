# Applications of Transformers are Bayesian Networks

Source for a paper on what follows from the result that transformers implement
belief propagation. Each section develops one concrete application or
implication of the formal result.

**Greg Coppola, 2026**

The compiled PDF will be `index.pdf`.

## The Core Result

A sigmoid transformer can exactly realize belief propagation under a
constructive weight mapping (Coppola 2026). This is not a loose analogy.
The forward pass implements the BP update equations directly. The applications
in this repo follow from taking that result seriously.

## Map of Literatures

| Literature | Main Idea | BP Connection |
|---|---|---|
| Mechanistic interpretability | Circuits and routing heads | Message passing structure |
| In-context learning | Bayesian updating from examples | Posterior inference per forward pass |
| Graph neural networks | Node message passing over graphs | Explicit graph BP |
| Sparse autoencoders | Monosemantic semantic features | Latent factor graph nodes |
| RAG / tool use | External evidence injection | Conditioning on observed evidence |
| Scaling laws | Power-law improvement with compute | Expanding inference capacity |
| Planning / RL | MDP policy evaluation | BP over state-transition factor graph |
| Formal logic | Deduction and consistency | Deterministic limit of probabilistic BP |

## Levels of Analysis

This framework operates at several distinct levels that should not be conflated:

| Level | Description | Example |
|---|---|---|
| Exact constructive | Formally verified theorem | Sigmoid transformer realizes exact BP |
| Mechanistic interpretation | Component-level account | Attention = evidence gathering |
| Empirical hypothesis | Testable prediction about trained models | AND heads have rank-1 Q/K circuits |
| Architectural proposal | Design suggestion following from theory | Grounded transformer + QBBN hybrid |
| Speculative extension | Interpretive extrapolation | Planning as MDP inference |

Claims throughout this repo operate at different levels. The level is marked
in each doc's status table.

## Structure

- `01-theory/` — theoretical foundations and explanations
- `02-hallucination/` — grounding, hallucination, and reliability
- `03-agents/` — unified account of LLM agents
- `04-interpretability/` — interpretability as hypothesis testing
- `05-training/` — implications for training objectives
- `06-efficiency/` — pruning, compression, and sparse inference
- `07-limitations/` — what the theory does not prove
- `08-uncertainty/` — calibration, confidence, and uncertainty propagation