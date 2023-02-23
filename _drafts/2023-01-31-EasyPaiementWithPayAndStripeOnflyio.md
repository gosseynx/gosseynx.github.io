---
layout: single
title:  EasyPaiementWithPayAndStripeOnflyio
categories: Ruby On Rails
date:   2023-01-31 14:58:39 +0100
---

# Easy Payment with Ruby On Rails, Pay, Stripe in Production

I recently had to deploy a Rails app  which came with payment facilities on [fly.io](https://fly.io). I choosed [Stripe](https://stripe.comStripe) for convenience because the other solutions were not as "Rails friendly".

The [Pay gem](https://github.com/pay-rails/pay) makes the implementation of all the payment machinery really straightforward especially in development with the `stripe-cli` tool and for basics payment (but complete ones) the Stripe's checkout solution. The only sensible  gap in my opinion is when it turns to production.

For this reason and considering the lack of documentation concerning this step I decided to write a short post about it. 

We start when your development application is ready for deployment : you have your `checkouts_controller.rb` in charge of the making of your request to Stripe, your associated views your `billing_controller.rb` 

