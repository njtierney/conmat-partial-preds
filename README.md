
# conmat-partial-preds

<!-- badges: start -->
<!-- badges: end -->

The goal of conmat-partial-preds is to generate partial dependence plots of the
terms used in conmat.

Eventually these might make their way into conmat, as a way for users to
understand and reason about these individual terms from conmat.

# How to run the code

For some reason I cannot get renv to reliably work, so here are some more bespoke instructions.

1. Ensure you have all packages installed in [packages.R](packages.R).
2. Run `targets::tar_make()` to run the pipeline

