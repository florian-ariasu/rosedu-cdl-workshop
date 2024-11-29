# Markdown Workshop

This is a practical workshop about the syntax and the use of the [Markdown format](https://www.markdownguide.org/basic-syntax/).
In particular, we will focus on the [GitHub Flavored Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax), used by GitHub.
See the full specification of the GitHub Flavored Markdown [here](https://github.github.com/gfm/).

First of all, fork [this repository](https://github.com/rosedu/workshop-markdown).
And then create a clone of your fork:

```console
git clone https://github.com/<your-github-username>/workshop-markdown
# Or git clone git@github.com:<your-github-username>/workshop-markdown
cd workshop-markdown/
```

Choose one of the two clone commands above to either clone via HTTPS (personal access token is required) or via Git (public SSH key needs to be configured).
Replace `<your-github-username>` above with your GitHub username.

Add the `upstream` remote to point to the [upstream repository](https://github.com/rosedu/workshop-markdown):

```console
git remote add upstream https://github.com/rosedu/workshop-markdown
git fetch upstream
```

And let's get going! 🚀

## Markdown Use in Public Repositories

Let's start with checking how Markdown is being used in public repositories.

### This Repository

Firstly, see this `README.md` file:

```console
cat README.md
```

You could also edit it using your preferred editor (Vim, Emacs, Nano, VS Code, Sublime) to also have syntax highlighting.

Also check the [`README.github.md` file](#README.github.md), a direct copy of the [`README.md` file in the `workshop-github` repository](https://github.com/rosedu/workshop-github).
To see the actual contents of a file on GitHub (such as the [`README.md` file in the `workshop-github` repository](https://github.com/rosedu/workshop-github)), click the `Raw` button in the top-right corner.
You'll get to [this page](https://raw.githubusercontent.com/rosedu/workshop-github/refs/heads/main/README.md) in raw format.

Identify syntax aspects from those list in the documentation for [GitHub Flavored Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).
See:

- The use of `#`, `##`, `###` for section headings.
- The use of backticks for typewriter font, used for the names of files, functions, and 
- The use `-` and `\*` for unordered lists.
- The use of `1.` for ordered lists.
- The syntax used for links.
- The use of triple backticks for code snippets.
- And many others.

See how the Markdown syntax is rendered on GitHub for [this `README.md` file](https://github.com/rosedu/workshop-markdown/blob/main/README.md) and [the `README.github.md` file](https://github.com/rosedu/workshop-markdown/blob/main/README.github.md).

### Operating Systems (from Open Education Hub)

See Markdown files in the [Operating Systems (Open Education Hub / `cs-pub-ro`) repository](https://github.com/cs-pub-ro/operating-systems).
For files in the repository, check the raw format.
And check how they are rendered on [the website](https://cs-pub-ro.github.io/operating-systems/).

### Unikraft Docs

See Markdown files in the [Unikraft Docs repository](https://github.com/unikraft/docs).
For files in the repository, check the raw format.
And check how they are rendered on [the website](https://unikraft.org/)

### OWASP Website

See Markdown files in the [`owasp.github.io` repository](https://github.com/OWASP/owasp.github.io).
For files in the repository, check the raw format.
And check how they are rendered on [the website](https://owasp.org/).

## Using the Repository Fork

The [upstream repository](https://github.com/rosedu/workshop-markdown) already has branches numbered `cdl-00` to `cdl-99`.
The instructors will assign each of you a branch.

After the branch is assigned, create a local version of that branch locally:

```console
git branch <assigned-branch> upstream/<assigned-branch>
```

You will create pull requests **to** your assigned branch.

This means you will follow the steps:

1. Create a branch.
   Make sure you are on that branch.
1. Make changes.
1. Create commits.
1. Push changes to your fork.
1. Create a pull request from that push.
   The pull request must be target **to** your assigned branch (**not** the `main` branch).

## Correct Markdown File

The [`dynamic-linking.ro.md` Markdown file](dynamic-linking.ro.md) has errors in it.
Fix these errors as part of a pull request.

Follow the instructions above to create the pull request.
Make sure you have good commit messages and a good pull request description.

Target the pull request **to** your assigned branch.

Ask the instructors to review your pull request.
Make updates as required.
Have your pull request approved and merged on top of your assigned branch.

Check the GitHub web view of the [upstream repository](https://github.com/rosedu/workshop-markdown) for your assigned branch.

### Clean Up After Pull Request

After the pull request is merged, clean up your work environment.
That is:

1. Go the pull request GitHub view and delete the remote branch.

1. Remove the reference to the remove branch in your clone:

   ```console
   git remote prune origin
   ```

1. Checkout the `main` branch:

   ```console
   git checkout main
   ```

1. Remove the local branch that you used for creating the pull request.
   It has the same name as the one you remote branch you removed above:

  ```console
  git branch -D <work-branch-used-for-PR>
  ```

1. Fetch the updates for your assigned branch.
   Your assigned branch is now updated after the pull request was merged:

   ```console
   git fetch upstream
   git checkout <your-assigned-branch>
   git rebase upstream/<your-assigned-branch>
   ```

1. Check the branch:

   ```console
   git log
   ```

## Create Markdown File

The `helloworld-print.pdf` file is a PDF print of a GitHub view of a Markdown file.
Create the `helloworld.md` file that will generate that precise GitHub view.

**Note**: The first large "Hello, World!" message is an image file: the file `helloworld.png` in the repository.

Make sure you do the following:

- Start by creating a branch where you do you work.
  This will be the branch **from** where you will create a pull request.
  As usual, the future pull request will target your assigned branch in the [upstream repository](https://github.com/rosedu/workshop-markdown).

- Copy-paste contents from the PDF file.
  Do not write programs by hand.

- Use correct syntax items for typewriter format, links to sections, code snippet format, tables.
  See [the GitHub Markdown spec](https://github.github.com/gfm/).

- Create and or update commits.
  Do periodic (force) pushes of the work branch:

  ```console
  git push --force origin <work-branch>
  ```

  After each push, check the GitHub view of the work branch in your fork of the GitHub repository.

After completing the task, submit the `helloworld.md` Markdown file as part of a pull request.

Follow the instructions above to create the pull request.
Make sure you have good commit messages and a good pull request description.

Target the pull request **to** your assigned branch.

Ask the instructors to review your pull request.
Make updates as required.
Have your pull request approved and merged on top of your assigned branch.

Check the GitHub web view of the [upstream repository](https://github.com/rosedu/workshop-markdown) for your assigned branch.

### Clean Up After Pull Request

After the pull request is merged, go to the same steps as above to clean your pull request.

## Your Turn

Add a Markdown file with contents of your own.
Use as many Markdown syntax features as possible.

Be sure to have at least:

- a link
- a code snippet
- a table
- an ordered list
- an unordered list
- headings
- an image
- an emoticon / emoji

Submit the Markdown file as part of a pull request.

Follow the instructions above to create the pull request.
Make sure you have good commit messages and a good pull request description.

Target the pull request **to** your assigned branch.

Ask the instructors to review your pull request.
Make updates as required.
Have your pull request approved and merged on top of your assigned branch.

Check the GitHub web view of the [upstream repository](https://github.com/rosedu/workshop-markdown) for your assigned branch.

### Clean Up After Pull Request

After the pull request is merged, go to the same steps as above to clean your pull request.

## GitHub Profile Page

GitHub provides you to option to have a GitHub profile page, that you can use as a form of open source CV / portfolio.
You can check the profile pages below as examples:

- [Andreia Ocănoaia](https://github.com/andreia-oca)
- [Gabi Mocanu](https://github.com/gabrielmocanu)
- [Cezar Crăciunoiu](https://github.com/craciunoiuc)
- [Maria Sfîrăială](https://github.com/mariasfiraiala)

The profile pages are rendered from a standard repository named **exactly** as the account name.
See the contents of each account repository for the above accounts:

- https://github.com/andreia-oca/andreia-oca
- https://github.com/gabrielmocanu/gabriel-mocanu
- https://github.com/craciunoiuc/craciunoiuc
- https://github.com/mariasfiraiala/mariasfiraiala

The repository consists of a single `README.md` Markdown file.
This `README.md` file in the `.github` repository is automatically rendered by GitHub on the account profile page.

Check the raw contents of `README.md` files above to see how the profile page is created.

### Create Your Own GitHub Profile Page

Create your own GitHub profile page.
Follow the steps:

1. Create a repository called `.github` repository on GitHub.
   Initialize it with a simple `README.md` file as instructed in the repository creation screen.
   This is the profile repository.

1. See the initial output of the repository on your GitHub page.

1. Clone the profile repository locally:

   ```console
   git clone https://github.com/<your-github-username>/.github
   # Or git clone git@github.com:<your-github-username>/.github
   cd .github
   ```

   Choose one of the two clone commands above to either clone via HTTPS (personal access token is required) or via Git (public SSH key needs to be configured).

1. Update the `README.md` file in the repository with the contents you want for your profile.
   Take inspiration from the GitHub profile pages above.

1. Create commits with the updates to the `README.md` file.
   Push commits to the GitHub remote repository.
   Now check your resulting profile page on GitHub.
