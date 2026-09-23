# R-SIG
Collection of materials we talk about in the R-SIG

## Website previews

Pull requests from branches in this repository receive an online preview after
the Quarto workflow succeeds:

`https://iqb-research.github.io/IQB-Methods/pr-preview/pr-<PR number>/`

The preview link appears in the pull request's deployment section and in the
workflow summary. Each push updates the preview; closing or merging the pull
request removes it. Pull requests from forks are built and provide a downloadable
`website` artifact, but are not deployed.

The main website is published from `main`. Its deployment preserves the
`pr-preview/` directory so that previews of other open pull requests remain
available. GitHub Pages must continue to publish from the root of `gh-pages`.

The `github-pages` environment must allow deployments from the `gh-pages`
branch: this is where GitHub's final Pages deployment runs. The Quarto workflow
uses the separate `website-publish` environment when publishing from `main`,
and `pr-preview-<PR number>` for previews. Restricting `github-pages` to `main`
blocks the final deployment even when the Quarto workflow is green.
