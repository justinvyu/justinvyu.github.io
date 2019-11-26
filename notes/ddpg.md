---
layout: note
title: "DDPG: Continuous Control with Deep Reinforcement Learning"
---

**Link to the paper:** [https://arxiv.org/pdf/1509.02971.pdf](https://arxiv.org/pdf/1509.02971.pdf)

## TL;DR

Main contributions:

- Applying Q-learning with neural network function approximators to continuous action spaces
- Showing improvements in stability across various domains by borrowing techniques from the DQN paper (replay buffer, target Q networks)

## 1. Introduction

- Drawbacks of DQN (Mnih et al. 2015):
  - Can handle high dimensional observation spaces, but only low-dimensional action spaces (ex: Atari games only allow a small collection of actions from the agent)
- Naive solution is to discretize a continuous action space
  - Problem: action space dimensionality increases exponentially with the number of degrees of freedom (7 DOF discretized into 3 sections in each DOF gives $$3^7$$ dimensions in action space)
  - Problem: naive discretization of action space isn't optimal when only some parts of the action space are crucial for solving the task (throws away lots of useful information and manually defines the structure of the problem)
- Related work
  - Deterministic Policy Gradient (DPG) (Silver et al., 2014)
  - Deep Q-Network (DQN) (Mnih et al., 2013; 2015)
    - (Somewhat) stabilizing off-policy learning by minimizing correlation between data through sampling from a replay buffer
    - Trained with a target Q-network (with infrequent updates) to provide a better target in TD backups

## 2. Background

**Q-value:**

- Q-value is the expected return, starting from time t to the end of the trajectory, starting at state $$$$s_t$$$$ and taking action $$a_t$$:

  $$Q^\pi(s_t, a_t) = \mathop{\mathbb{E}}_{\tau \sim p(\tau)}[R_t | s_t, a_t]$$

**Bellman Equation:**

- The bellman equation is a recursive relationship between the current expected Q-value with respect to the expected Q-values of all possible future timesteps and actions:

  $$Q^\pi(s_t, a_t) = \mathop{\mathbb{E}}_{r_t, s_{t+1}}[r(s_t, a_t) + \mathop{\mathbb{E}}_{a_{t+1} \sim \pi(s_t, a_t)}[Q^\pi(s_{t+1}, a_{t+1})]]$$

**Q-learning:**

- Perform Q-learning by minimizing the Bellman error, which is basically just regressing onto the Q-value as described by the above recurrence. Calculate the expectation by taking the mean of the square error over many data points $$(s_t, a_t, r_t)$$.

- In practice, $$Q_{target}$$'s dependence on the parameters of the target Q network is ignored (use a `tf.stop_gradient(Q_target)`).

  $$\text{minimize } L(\theta_Q) = \mathop{\mathbb{E}}_{s_t, a_t, r_t}[(Q(s_t, a_t; \theta_Q) - Q_{target})^2]$$

  $$Q_{target} = r(s_t, a_t) + \gamma Q(s_{t+1}, \text{arg max}_{a_{t+1}} Q(s_{t+1}, a_{t+1}); \theta_Q))$$

## 3. Algorithm

- Hard to apply Q-learning to continous action spaces, because the step involving $$\text{arg max}_{a_{t+1}} Q(s_{t+1}, a_{t+1})$$ is hard in a continous setting (or even a high dimensional discrete action space), since a maximization procedure at every training step is very costly.

- Maintain a deterministic actor $$\mu(s; \theta_\mu)$$, which maps states to a specific action in the continuous action space

  - **Actor updates ascend the gradient of the Q-function to maximize the future return**
  - Chain rule allows the gradient on the deterministic policy to come out of the gradient of the Q function (see Silver et al., 2014 for this derivation)

  $$\begin{align}\nabla_{\theta_\mu} J &\approx \mathop{\mathbb{E}}_{s_t}[\nabla_a Q(s, a; \theta_Q)|_{s=s_t,a=\mu(s_t;\theta_\mu)}] \\ &= \mathop{\mathbb{E}}_{s_t}[\nabla_a Q(s, a; \theta_Q)|_{s=s_t,a=\mu(s_t)}\nabla_{\theta_\mu}\mu(s; \theta_\mu)|_{s=s_t}]\end{align}$$

- Other tricks

  - Sampling from a replay buffer the same as in DQN

  - Updating target Q network using exponentially moving average (for "soft" updates rather than directly copying weights)

    $$\theta_{target} \leftarrow \tau \theta + (1-\tau)\theta_{target}$$

  - Adding some noise $$N$$ to the output of the deterministic actor to imitate "sampling" from an action distribution

    $$\mu'(s_t) = \mu(s_t; \theta_\mu) + N$$

![DDPG Algorithm]({{site.baseurl}}/notes/images/ddpg/ddpg.png)
