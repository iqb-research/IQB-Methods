# R-SIG
Collection of materials we talk about in the R-SIG

## Website previews

Pull requests from branches in this repository receive an online preview after
the Quarto workflow succeeds:

`https://iqb-research.github.io/IQB-Methods/pr-preview/pr-<PR number>/`

The preview link appears under **PR preview** in the pull request's checks
(open **Details**) and in the workflow summary. Each push updates the preview.
Closing or merging the pull request removes the preview files and replaces the
check's preview link with a link back to the closed PR.
Previews do not create GitHub environments or deployment entries, so there are
no empty preview environments to remove from Settings. Deployment entries from
the previous preview workflow are still cleaned up when their PR closes.
Pull requests from forks are built and provide a downloadable
`website` artifact, but are not deployed.

The main website is published from `main`. Its deployment preserves the
`pr-preview/` directory so that previews of other open pull requests remain
available. GitHub Pages must continue to publish from the root of `gh-pages`.

The `github-pages` environment must allow deployments from the `gh-pages`
branch: this is where GitHub's final Pages deployment runs. The Quarto workflow
publishes files from `main` to `gh-pages` without a separate environment or
deployment entry. Previews also do not use an environment, so `github-pages`
is the only deployment environment. Restricting `github-pages` to `main`
blocks the final deployment even when the Quarto workflow is green.
