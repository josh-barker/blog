+++
title = "Review Bots - The Tech"
date = "2021-08-09"
author = "Josh"
tags = ["github", "developer-tools"]
+++

Now that I had some ideas about what I wanted to build, I needed to make some technology decisions.

At my day job, I use Azure a lot. It would be easier to look there, but I wanted to learn some AI/ML. I had also used some AWS at work and personally, but I didn't have any experience with GCP.

I did some research to compare the AI/ML features of AWS, Azure and GCP and ended up choosing GCP.

A few factors led me to this.
- I hadn't touched GCP, so I get to learn something new.
- GCP had a good and free introduction [course](https://developers.google.com/machine-learning/crash-course) to AI/ML.

## Learning Machine Learning

I worked my way through the courses here and learned some of the big ideas to help guide me to solving the problems.

1. If you can write an algorithm, you probably don't need AI.

    ```
    Rules:
    If the number of lines changes < 10, the PR is XS.
    If the number of lines changes < 50, the PR is S.
    ```

    So, why did I choose to use ML here? More on this later.

1. Machine Learning models can be created using labelled and unlabelled data.

    - Labelled data is data that has already been classified, where as unlabelled does not.
    - Finding good labelled data can be hard.
    - Making good labelled data can be very time consuming.

1. Your model is as only good as your data.

    You could have clear labelled data, but if you don't have enough samples, it will be hard to predict results.

    You could have a problem that has a lot of overlap and it's hard to distinguish the category.

1. Your Machine Learning Models should be simple.

    Fewer features, or inputs, generally results in better models.

    It helps check that these inputs have strong predictive power.

## Machine Learning Models

I wanted to make 2 x ML models to classify a Pull Request by Kind and Size.

### Kind Model

The `Kind` model is a text classification problem. We feed in the title and body to classify it.

In my journey, I experimented with unsupervised learning and unlabelled data, but the results weren't great.
So, I moved to a different method with labelled data.

Originally, I wanted to have 5+ categories, but soon realised I didn't have enough samples.
I also learned that the sometimes the words had similar language across categories, or a Pull Request had multiple categories.
For example, someone could have fixed a bug and added a feature.

How do you classify that?

I reduced it down to 3 categories - `bug`, `feature` and `documentation`, as they were *usually* quite distinct categories.

### Size Model

Next, the `Size` model.

I know I said before that if you can use an algorithm you shouldn't use ML, but how do you even determine the size of a Pull Request? How do you gather enough people's opinions about an XS is compared to S, M, L and so on?

I also started with quite a few features, but came to the conclusion that less is more.

---

I ended up with 2 x Machine Learning models that I could use to classify a Pull Request.

But now, how do I integrate the to Github?

See the next [post](/posts/2021-08-25-the-bot-code)!

Lastly, if you're keen to learn more about Machine Learning, I'd suggest you try Google's free course or look at the training material on any top cloud provider.

Hopefully this might have inspired you to think about a problem, or to learn something new!
