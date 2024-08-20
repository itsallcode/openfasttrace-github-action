#!/bin/sh

# [impl->req~run-oft-trace-command~1]

report_file_name=$1
report_format=$2
files=$3

echo "::notice::using OpenFastTrace JARs from: ${LIB_DIR}"

# Run OpenFastTrace
# shellcheck disable=SC2086
# we need to provide the file patterns unquoted in order for the shell to expand any glob patterns like "*.md"
if (java -cp "${LIB_DIR}/*" \
  org.itsallcode.openfasttrace.core.cli.CliStarter trace -o "${report_format}" \
  -f "${report_file_name}" \
  ${files})
then
  echo "oft-exit-code=0" >> "${GITHUB_OUTPUT}"
  echo "All specification items are covered." >> "${GITHUB_STEP_SUMMARY}"
else
  echo "oft-exit-code=$?" >> "${GITHUB_OUTPUT}"
  echo "Some specification items are not covered. See created report (${report_file_name}) for details." >> "${GITHUB_STEP_SUMMARY}"
fi
