---
layout: project
title: "Goal-Directed Exploration in RL via Empowerment Estimation"
date_string: December 2021
date: 2021-12
image: images/cs285-empowerment.png
---

**Paper:** [CS 285 Final Project Report]({{site.baseurl}}/public/documents/cs285_final_project.pdf)

#### Technologies Used
Python, PyTorch

#### Summary

Intrinsic motivation in reinforcement learning has seen many successes in the past, from achieving higher performance on Atari games to allowing for robots to learn diverse sets of skills. However, augmenting the reward of a MDP can lead to another source of instability for the algorithm, causing it to chase a moving reward. By instead conditioning the reward by the goal and amortizing the task of exploration onto choosing appropriate goals, we avoid the instabilities of count-based methods.

We consider how to efficiently explore an environment through a goal-conditioned MDP. By decoupling deep RL policies trained with intrinsic motivation vs. extrinsic reward, we are able to achieve better, more directed exploration than exploration methods that combine the two. We define a goal-conditioned MDP featuring equivalent dynamics as the original MDP as well as a goal space containing elements of the state space. To explore the environment, we sample a goal according to some strategy, then traverse the MDP with a goal-conditioned policy. By choosing promising goals in the replay buffer to return to and explore from, we are able to directly explore desired parts of the state space.

Our goal-sampling strategy utilizes two assumptions: (1) some goals are more promising than others for future exploration, and (2) the dynamics of certain regions of the state space are similar to others, allowing for generalized behaviors from goal-conditioned policies. We show that empowerment---a measure of the controllability of a state in an MDP---serves as a powerful heuristic to select goals by. We estimate empowerment by estimating the number of reachable states originating from a certain state. By choosing goals with empowerment, we were able to achieve results comparable to SkewFit.

<div class="container" style="margin: 2rem 0;">
  <div class="row">
    <div class="col-sm-12">
    <div class="card">
        <img src="{{site.baseurl}}/projects/images/cs285-empowerment-estimates.png" class="card-img-top" alt="...">
    </div>
    </div>
  </div>
</div>
