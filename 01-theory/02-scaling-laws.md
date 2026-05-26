# Scaling Laws Have a Mechanistic Interpretation

## The Empirical Observation

Kaplan et al. and subsequent work established that loss scales predictably
as a power law with compute, parameters, and data. This is an empirical
regularity. No principled explanation of *why* it holds has been
established, though several theoretical programs have attempted partial
accounts.

## The BP Interpretation

Under the BP interpretation, scaling adds inference capacity in well-defined
ways:

- More layers add rounds of BP: deeper reasoning chains become possible
- More Dff adds OR gate capacity: richer conditional relationships per round
- More Dmodel adds superposition capacity: more simultaneous concepts tracked
- More W adds factor graph nodes: reasoning over longer contexts

Each of these is a smooth, monotone increase in a well-defined quantity.
Power-law scaling in loss is qualitatively consistent with a system where
each additional unit of capacity provides diminishing but consistent
marginal improvement in inference quality over a fixed distribution.

## The AND Head Invariant

The empirical finding that boolean-AND head count stays roughly fixed within
a model family while hub and OR capacity scales is consistent with the BP
interpretation: the routing primitive (AND) is compact and does not need to
scale, while inference capacity (OR, hub communication) does. This is
consistent with what the BP framework would predict, though the evidence
is preliminary — three model families — and should not be overstated.

## An Open Question

The BP interpretation suggests *what* scales and *why* each dimension helps.
It does not give a derivation of the specific power-law exponents from first
principles. That would require a more detailed model of the relationship
between factor graph density and loss, which remains open.

## Status of the Claims

| Claim | Status |
|---|---|
| Scaling dimensions have BP interpretations | Mechanistic interpretation |
| More layers enable deeper reasoning chains | Mechanistic interpretation |
| AND head count invariance is consistent with BP | Empirical observation (preliminary) |
| BP explains power-law exponents | Not established |
| Inference capacity is the scaling bottleneck | Mechanistic interpretation |