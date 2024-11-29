# workshop-soft-eng

Hands-on workshop on good practices in software engineering. We're going to have a look at TDD, Unit Testing, Refactoring
and CI/CD.

# Gilded Rose Refactoring Kata

Today's workshop is based on a popular refactoring exercise you can find out more about [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/main).  

# Setup

We recommend using [Intellij](https://www.jetbrains.com/idea/download/) as the IDE.

You will have to install [Node](https://nodejs.org/en/download/package-manager) v18.20. This should also install `npm`,
which is a Node packet manager

# Getting started 

**First, fork this repository and clone it on your device.**

Then, install dependencies

```npm install```

# Run the unit tests from the Command-Line

We are using jest as a testing framework.

To run tests:

```npm run test:jest```

To run all tests in watch mode:

```npm run test:jest:watch```

# Running the app

You can run the application seeing how the `updateQuality()` function works:

```npm run app```

Or with the number of days as args:

```npm run app 10```

# Gilded Rose Requirements Specification

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in `Quality` as they approach their sell by date.

We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

- All `items` have a `SellIn` value which denotes the number of days we have to sell the `items`
- All `items` have a `Quality` value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, `Quality` degrades twice as fast
- The `Quality` of an item is never negative
- __"Aged Brie"__ actually increases in `Quality` the older it gets
- The `Quality` of an item is never more than `50`
- __"Sulfuras"__, being a legendary item, never has to be sold or decreases in `Quality`
- __"Backstage passes"__, like aged brie, increases in `Quality` as its `SellIn` value approaches;
  - `Quality` increases by `2` when there are `10` days or less and by `3` when there are `5` days or less but
  - `Quality` drops to `0` after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- __"Conjured"__ items degrade in `Quality` twice as fast as normal items

Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything
still works correctly. However, do not alter the `Item` class or `Items` property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the `UpdateQuality` method and `Items` property static if you like, we'll cover
for you).

Just for clarification, an item can never have its `Quality` increase above `50`, however __"Sulfuras"__ is a
legendary item and as such its `Quality` is `80` and it never alters.

# Continuous Integration

Now that we've improved the codebase through a thorough refactor, and we've added some much-needed tests, it's time 
to think about taking advantage of those.

We'd like to only be able to merge code if the test suite passes, otherwise the PR should fail. This way we're never adding
breaking changes. To do that, we're going to create a GitHub action to run the tests on Pull Request.

Start by looking in the [test.yml](.github/workflows/tests.yml) file.

1. Set the trigger to be when someone opens a PR against the `main` branch
2. Create a `test` job that runs on ubuntu
3. Firstly, we'd need to get the code - Hint: what are we doing when changing out a branch
4. Secondly, we'd need to make sure the environment is set - Hint: we're using Node
5. After we make sure we have the code and the environment set, we should install all dependencies and then run the tests.


Stretch goal: Sometimes we're too lazy to check the status each time. It might be easier to receive an email. What should 
we do to make sure we're receiving an email whenever a build passes or fails?
