+++
title = "ARM Templates vs Azure"
date = "2019-03-31"
author = "Josh"
tags = ["devops", "azure", "arm templates", "terraform"]
+++

# ARM Templates vs Terraform

After working with ARM templates for the last 3 months, I feel that [Terraform](terraform.io) is a much better solution.

## ARM Templates

- Yes, ARM Templates are native.

But....

- There's no way to run a `dry run` test to see what you're about to do, or **break**!
- Writing single purposed ARM Templates that can be reused in your organization is very difficult.
  - There's no way to publish them
  - There's no tool to resolve dependencies between templates
- Debugging is hard
  - Slow feedback from ARM engine
  - `az validate` doesn't mean it will deploy
  - Error messages are hard to understand
  - Finding where in the JSON file you're missing that `[` or `]`, or `,` is super painful

## Terraform

- Terrform has a large community.
- FAST to deploy!
- Fast to get feedback
- Error messages are quite clear
- `terraform plan` shows you what will change if you apply it
- It has a module registry for sharing and collaborating
- But, some resourece for Azure aren't created yet. So you may need to use an ARM template in Terraform
