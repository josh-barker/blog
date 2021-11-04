+++
title = "Review Bots - The Code"
date = "2021-08-25"
author = "Josh"
tags = ["github", "developer-tools", "javascript", "typescript"]
+++

Great. I have some Machine Learning models to categorise Pull Requests. But, how do I build a bot?

Do I make a Github Action or a Github Application?

How could I implement it?

Well, part of the motivation for this was to make these bots simple to use and manage across many repositories.

If I made a Github Action, I'd need to create a workflow in every repository. But, if I used a Github Application, I could install it once and it could be run on every repo! There's also another benefit, where the Github Application has a market place and would allow me to charge for the bot(s) to recoup costs.

---

## The Code

Plenty of people have written Github Applications.

On my first attempt, I found an example app written in NodeJS which relied on some packages like `@octokit/graphql` and `@google-cloud/automl`. This took quite a bit of time to put together, as I had to refresh myself on how to write in JavaScript.

Then, I found [ProBot](https://probot.github.io/)! It was a delight to refactor the code and simplify it. In the process, I also moved from JavaScript to TypeScript.

[TypeScript](https://www.typescriptlang.org/) is like JavaScript, but it has more safety. It must be compiled and variables are declared for a particular type, i.e. `string`, `number`,  etc.

It's fantastic, but the transition was painful.


Anyway, back to ProBot. It's great. It has a tonne of functionality built in, with clear documentation and it's all open source.
Also, you can write in Javascript or Typescript.

I'd highly recommend starting there.

---

### What did I learn?

#### Do you research.

Search more before making a decision. If I had spent more time researching, I would have found the ProBot project earlier.

This would have allowed me to build the bots quicker. However, by using the lower level packages, I did learn more about Github App authentication, which helped in troubleshooting some issues.

Sometimes, the slower path gives you a wider understanding.

#### Frameworks are great, but don't forget to upgrade

The ProBot framework has been great. The only thing that caught me out was an odd bug for authentication to Github. I checked and double checked everything, but I couldn't find anyone else reporting anything similar.

I finally decided to upgrade, and :tada: it was fixed.

#### Testing

Using ProBot also made testing quite straight forward as it comes with an example. This enables you to experiment and understand how to write your own tests, create mock data and validate your bot is working correctly.

However, I found it harder to write small unit tests for specific functions, as the normal entry point is a Github payload being sent to the app. 

---

Now that I've got this bot working, I need to deploy it!

See the next [post](/posts/2021-09-08-the-bot-gcp)!