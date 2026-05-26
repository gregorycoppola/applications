# Applications of Transformers are Bayesian Networks

**Greg Coppola, 2026**

This repo develops the applications and implications of the result that
sigmoid transformers can exactly realize belief propagation under a
constructive weight mapping. The companion paper proving this result is
[Transformers are Bayesian Networks](https://arxiv.org/abs/2603.17063).

## The Paper

The compiled paper is `index.pdf`. Source is `index.tex` with chapter
files `ch00-introduction.tex` through `ch14-research-roadmap.tex`. Build
with `make`.

The paper is organized in seven parts: introduction and framework,
theoretical consequences, grounding and hallucination, agents and planning,
interpretability, training and efficiency, and limitations and open problems.

## The Markdown Notes

The `01-theory/` through `08-uncertainty/` folders contain the working
notes and braindump documents that the paper is drawn from. Each note
includes a status table distinguishing formal theorems, empirical
hypotheses, architectural proposals, and speculative extensions.

## The Core Result

A sigmoid transformer can exactly realize belief propagation under a
constructive weight mapping. Within the constructive setting, the forward
pass implements the BP update equations directly. The applications in this
repo follow from taking that result seriously — while being careful to
distinguish what the theorem establishes from what is interpretation,
hypothesis, or proposal.

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

Claims throughout this repo operate at several distinct levels:

| Level | Description | Example |
|---|---|---|
| Exact constructive | Formally verified theorem | Sigmoid transformer realizes exact BP |
| Mechanistic interpretation | Component-level account | Attention = evidence gathering |
| Empirical hypothesis | Testable prediction about trained models | AND heads have rank-1 Q/K circuits |
| Architectural proposal | Design suggestion following from theory | Grounded transformer + QBBN hybrid |
| Speculative extension | Interpretive extrapolation | Planning as MDP inference |

## Structure

- `01-theory/` — why LLMs work, scaling laws, formal reasoning
- `02-hallucination/` — grounding, hallucination, and reliability
- `03-agents/` — BP vocabulary for agents and planning
- `04-interpretability/` — interpretability as hypothesis testing
- `05-training/` — implications for training objectives
- `06-efficiency/` — pruning, compression, and sparse inference
- `07-limitations/` — what the theory does not prove, research roadmap
- `08-uncertainty/` — calibration, confidence, and uncertainty propagation