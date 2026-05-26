# Training Objectives Through the BP Lens

## What Current Training Optimizes

Next-token prediction optimizes cross-entropy loss on the training
distribution. This is equivalent to maximum likelihood estimation of the
implicit factor graph parameters. The model learns conditional relationships
by seeing which tokens follow which in training data.

The BP result shows this process works: gradient descent reliably finds
approximately correct BP weights (bayes-learner val MAE 0.000752). The
training objective is implicitly fitting a Bayesian network to the
data distribution.

## What This Suggests About Alternative Objectives

If the model is learning a Bayes net, you can ask what objectives would
produce *better* Bayes nets — ones with better-calibrated beliefs, more
grounded representations, or more verifiable inference.

Candidates:

- **Calibration objectives**: penalize overconfident or underconfident
  posteriors directly, not just cross-entropy. This would push the model
  toward beliefs that are accurate in probability, not just in argmax.

- **Grounding objectives**: reward the model for producing outputs that
  are verifiable against a declared knowledge base. This would push toward
  grounded inference.

- **BP consistency objectives**: penalize violations of the BP fixed-point
  equations. If the model's beliefs across layers are inconsistent with
  iterative BP, penalize that directly.

## The Uniqueness Theorem as a Training Target

The companion paper proves a uniqueness result: exact posteriors uniquely
force BP weights. This means there is a well-defined target for training —
the weights that implement exact BP — and the question is how well current
training objectives approach it. Better objectives would close this gap.