# openfasttrace-github-action

A GitHub Action for tracing requirements using OpenFastTrace.

Runs OpenFastTrace CLI's `trace` command using Temurin JRE 22 on the local workspace.

The action has the following inputs:

| Name | Description |
| :--- | :---------- |


The action has the following outputs:

| Name                             | Description                                                                                                                                               |
| :------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `requirements-tracing-exit-code` | 0: OFT has run successfully and all specification items are covered<br>1: OFT has either failed to run or at least one specification item is not covered. |
