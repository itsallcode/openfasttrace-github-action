# System Requirement Specification OpenFastTrace GitHub Action

## Introduction

[OpenFastTrace](https://github.com/itsallcode/openfasttrace) (OFT) is a requirement tracing suite written in Java.
The OpenFastTrace Action wraps the execution of the OpenFastTrace `trace` command in a [GitHub Action](https://docs.github.com/en/actions).

### Goals

The main goal of the OFT Action is to provide an easy way to execute OpenFastTrace as part of [CI/CD pipelines implemented by means of GitHub Actions workflows](https://docs.github.com/en/actions/about-github-actions/about-continuous-integration-with-github-actions).

## Features

### Standard GitHub Action
`feat~standard-github-action~1`

The OFT Action is a standard GitHub Action which allows running the OpenFastTrace `trace` command on files in the local workspace.

Rationale:

Verifying that all requirements are covered by the code base is an important aspect of a CI build. Projects hosted on GitHub often use GitHub Actions based CI workflows. It has always been possible to run OFT from within a shell script executed as part of a workflow job. However, the script code tends to be rather boilerplate so it seems reasonable to provide a standard GitHub Action that can be used as easily as other already existing Actions.

Needs: req

## Functional Requirements

### Run OFT trace command
`req~run-oft-trace-command~1`

The OFT Action runs the OpenFastTrace `trace` command.

Needs: impl
