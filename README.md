# OpenFastTrace Action

A GitHub Action for tracing requirements using OpenFastTrace.

Runs OpenFastTrace CLI's `trace` command using Temurin JRE 25 on the local workspace.

The action has the following inputs:

| Name              | Required | Description                                                                                                                                                                                                                                                                                 |
| :---------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `file-patterns`   | `false`  | A whitespace separated list of (Bash standard) glob patterns which specify the files and directories to include in the OFT trace run.<br>If not specified, the local workspace directory is used.                                                                                           |
| `report-filename` | `true`   | The name of the file that OpenFastTrace should write the analysis results to.                                                                                                                                                                                                               |
| `report-format`   | `false`  | The format of the report that OpenFastTrace should produce. Default value is `plain`.                                                                                                                                                                                                       |
| `tags`            | `false`  | A comma separated list of tags to use for [filtering specification items](https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md#distributing-the-detailing-work).<br>If not set explicitly, all specification items from files matching the file patterns are considered. |
| `fail-on-error`   | `false`  | By default, the action will never fail but indicate the result of running the trace command in the `oft-exit-code` output variable.<br>Setting this parameter to `true` will let the Action return the exit code produced by running OpenFastTrace.                                         |

The action has the following outputs:

| Name            | Description                                                                                                                                                    |
| :-------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `oft-exit-code` | `0`: OFT has run successfully and all specification items are covered<br>`>1`: OFT has either failed to run or at least one specification item is not covered. |

## Example workflow

The following workflow illustrates how the action can be used to trace requirements in the local workspace. The report will always be uploaded as an attachment to the workflow run, even if the trace run fails.

```yaml
on:
  pull_request:

jobs:
  tracing:
    name: Run OpenFastTrace
    runs-on: ubuntu-latest
    env
      TRACING_REPORT_FILE_NAME: oft-tracing-report.html
    outputs:
      tracing-report-url: ${{ steps.upload-tracing-report.artifact-url }}
    steps:
    - uses: actions/checkout@v4

    - name: Run OpenFastTrace
      id: run-oft
      uses: itsallcode/openfasttrace-github-action@v0
      with:
        file-patterns: *.md *.adoc src/
        report-format: "html"
        report-filename: ${{ env.TRACING_REPORT_FILE_NAME }}
        tags: Priority1,OtherComponent

    - name: Upload tracing report (html)
      uses: actions/upload-artifact@v4
      id: upload-tracing-report
      if: ${{ steps.run-oft.outputs.oft-exit-code != '' }}
      with:
        name: tracing-report-html
        path: ${{ env.TRACING_REPORT_FILE_NAME }}

    - name: "Determine exit code"
      run: |
        exit ${{ steps.run-oft.outputs.oft-exit-code }}
```