
# conmat-partial-preds

<!-- badges: start -->
<!-- badges: end -->

The goal of conmat-partial-preds is to generate partial dependence plots of the
terms used in conmat.

Eventually these might make their way into conmat, as a way for users to
understand and reason about these individual terms from conmat.

# How to reproduce

## Step 1: install capsule

```r
install.packages(
   "capsule", 
   repos = c(mm = "https://milesmcbain.r-universe.dev", getOption("repos")))
```

[`capsule` is an R package](https://github.com/MilesMcBain/capsule) that provides an inversion around renv. It doesn't mean you need to setup a specific activate script, and in general I've found it slightly nicer to work with than renv.

## Step 2: Reproduce the libraries used

```r
capsule::reproduce_lib()
```

This recreates all of the R packages used in the analysis on your computer. Importantly, this will not change where your existing R packages are installed. It is just for this repository. So no need to be concerned about this impacting other analyses you run.

## Step 3: Run the target workflow

```r
capsule::run(targets::tar_make())
```

This runs our targets workflow using the R packages specified.

This will check if the targets are written, and if they aren’t, it will re-run the necessary ones.

## Step 4: Add new dependencies into “packages.R”?

Run:

```r
capsule::recreate("packages.R")
```

## Step 4: issues with recreate

If you get some weird installation error that looks like a compiler error for a package, I've found that I just need to install that given package locally...not a great fix, and definitely not smooth, but it seems to work.

## Step 5 - ?

Make some changes to the code and want to see them? Run the capsule again:

```r
capsule::run(targets::tar_make())
```

And the paper will be recreated.

## Alternative installation instructions

1. Ensure you have all packages installed in [packages.R](packages.R).
2. Run `targets::tar_make()` to run the pipeline

