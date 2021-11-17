+++
title = "Commit Messages and Automated Releases"
date = "2021-11-17"
author = "Josh"
tags = ["git", "commits", "communication", "automation", "releases]
+++

Writing software is interesting.

At one level, we write code to build a product, solve problems and make our lives easier. Whilst we're building a product, we need to communicate to current and future selves and team members about what we're doing and how our code works.

Some of this communication is directly in code. Our function names, our variable names, our class names, our comments, and the list goes on. However, there's another way we communicate our changes; through `commit messages`.

Now why a blog on `commit messages`?

I think they're quite important. They're a key way for us to communicate change, impact, and help ourselves understand why we did what we did. They're also critical in troubleshooting bugs.

## Conventional Commits

Personally, I have become a fan of [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/). This standard works together with [SemVer](https://semver.org) and enables automated tooling to help manage versioning for you!

### The format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Type

This is a list of common types. The are ordered from common to infrequent.

Notably, different style guides have different sets of topics.

| Type  | Description | Semantic Version Increment|
|-------|-------------|--------|
| fix | A bug fix | A `patch` change | 
| feat | A new feature | A `minor` change |
| (xxx)! | A Breaking change. `(any)` could be any type. | A `major` change |
| (any): <br> BREAKING CHANGE: This is a breaking change | A Breaking change. `(any)` could be any type. | A `major` change |
| docs | Documentation only changes | None |
| chore | Other changes that don't change source or test files | None |
| test | Adding missing tests or correcting existing tests | None |
| perf | A code change that improves performance | None |
| refactor | A code change that neither fixes a bug nor adds a feature | None |
| build | Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm) | None |
| ci | Changes to our CI configuration files and scripts (example scopes: Github, Travis, Circle) | None |
| style | Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc) | None |

### Examples


1.  Breaking change with breaking change footer.

    I think this style is more obvious and should be used.

    ```
    feat: add name as required parameter

    BREAKING CHANGE: The name parameter is now required, not optional.
    ```

1. Breaking Change with `!`.

    I think this style is less obvious and can be avoided.

    ```
    feat!: add name as required parameter
    ```

1. Minor Change.

    ```
    feat: add optional secondary email
    ```

1. Minor change with a scope.

    ```
    feat(lang): add polish language
    ```

1. Patch change.

    ```
    fix: handle timeout gracefully
    ```

1. Documentation change.

    ```
    docs: update usage in README
    ```

1. Chore change.

    ```
    chore: fix lint issue
    ```

## Tooling

The below tools can help automate the release process!

### Commit Lint

Provides feedback when commit messages aren't in the correct format.

Website: https://commitlint.js.org

### Semantic Release Github PR

Creates a comment on a Github PR showing you the preview of the new release

Based on `Semantic Release`.

Website: https://github.com/pmowrer/semantic-release-github-pr

### Semantic Release

Automates the release process for you

- Detects version increment based on commits
- Generates a Github Release based on commits
- Generates a CHANGELOG.md based on commits

Website: https://semantic-release.gitbook.io/

Github: https://github.com/semantic-release/semantic-release

