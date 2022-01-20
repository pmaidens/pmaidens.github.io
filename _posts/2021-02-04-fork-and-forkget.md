---
layout: post
title: fork and forkget
---


[Picture of an old fork - Cover Image](../public/assets/fork-and-frokget.webp)

###### Photo credit: "Floating fork" by matley0 is licensed under CC BY-NC-ND 2.0

---

> Please fork the repo and make a pull request.

Do those words fill your heart with dread? Do you hate having to try to keep your local and your fork up to date with the base repo? Do you wish that you could just work with the base repo and not have to deal with a silly fork?

Don't worry friend!

Working with a forked repo doesn't need to be hard. In fact, I often fork a repo, and then totally forget about it! I'll explain the few steps I take after forking a repo that make it so that my local setup is almost identical to working directly off of a non-forked repo. You will never have to worry about mentioning `upstream` or `origin` or having things get out of sync again! Ready?

*(What are we supposed to call a non-forked repo anyways? We need something straight. A knife repo? A chopstick repo? I digress...)*

## Assumptions

Before we can get started, let me lay out a few assumptions.

1. We'll call the base remote repository `upstream`, and we'll call your fork of it `origin`. Fairly standard practice.
1. You already have a remote repo. I will assume the url for your remote repo is `git@github.com:upstream/example.git`. Anytime you see me use this url, replace it with your own upstream.
1. You already have a forked repo. I will assume the url for your fork repo is `git@github.com:origin/example.git`. Anytime you see me use this url, replace it with your own origin.
1. Your repo uses the `main` branch as its default branch.

## Let's go!

1. Clone the origin.
    
    ```
    git clone git@github.com:origin/example.git
    ```

1. Move into the newly created folder

    ```
    cd example/
    ```

1. Add the upstream to our remotes
    
    ```
    git remote add upstream git@github.com:upstream/example.git
    git fetch upstream
    ```

    Now when you check your remotes

    ```
    git remote -v
    ```

    you should get an output along the lines of

    ```
    origin	git@github.com:origin/example.git (fetch)
    origin	git@github.com:origin/example.git (push)
    upstream	git@github.com:upstream/example.git (fetch)
    upstream	git@github.com:upstream/example.git (push)
    ```
    If  your output looks similar, you are on the right track! Otherwise, you need to make sure that your origin and upstream have been properly added. If you are missing upstream, try repeating this step and check for any errors.

1. Make our master branch track upstream instead of origin

    ```
    git branch --set-upstream-to upstream/main
    ```

1. All set!

You're now good to go! If you check out `git status`, you should get something similar to:

    
    On branch main
    Your branch is up to date with 'upstream/main'.

    nothing to commit, working tree clean
    

If your fork is old, it might tell you that you are behind `upstream/main`. That is fine! In fact, that is awesome! Because now you can totally forget about your origin's main branch and just care about the upstream's main branch.

## Conclusion

So what did all this fancy finger work get you? Well, now you can pretty much forget about your fork. You get the latest updates from `upstream` whenever you checkout your `main` branch and `git pull`, and just have to `git push` in your local branch and it will go to your fork. It's almost like you get to pretend that you are working on the upstream, but the upstream will stay clean! So now everyone (including the grumpy upstream maintainers like me) stay happy and you stay productive!

Now git to it!

---

Thanks to my friends and colleagues Mary Maciejewski, Sonia May-Patlan, and Jordan Burgess for providing amazing suggestions and feedback about great ways I could make this article better!