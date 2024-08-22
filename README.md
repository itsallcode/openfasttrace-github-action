# OpenFastTrace Action

A GitHub Action for tracing requirements using OpenFastTrace.

Runs OpenFastTrace CLI's `trace` command using Temurin JRE 22 on the local workspace.

The action has the following inputs:

| Name              | Required | Description                                                                                                                                                                                                                                         |
| :---------------- | :------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `file-patterns`   | `false`  | A whitespace separated list of (Bash standard) glob patterns which specify the files and directories to include in the OFT trace run.<br>If not specified, the local workspace directory is used.                                                   |
| `report-filename` | `true`   | The name of the file that OpenFastTrace should write the analysis results to.                                                                                                                                                                       |
| `report-format`   | `false`  | The format of the report that OpenFastTrace should produce. Default value is `plain`.                                                                                                                                                               |
| `fail-on-error`   | `false`  | By default, the action will never fail but indicate the result of running the trace command in the `oft-exit-code` output variable.<br>Setting this parameter to `true` will let the Action return the exit code produced by running OpenFastTrace. |

The action has the following outputs:

| Name            | Description                                                                                                                                                    |
| :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `oft-exit-code` | `0`: OFT has run successfully and all specification items are covered<br>`>1`: OFT has either failed to run or at least one specification item is not covered. |
