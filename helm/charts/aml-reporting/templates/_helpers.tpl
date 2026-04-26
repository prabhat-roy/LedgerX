{{- define "aml-reporting.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "aml-reporting.labels" -}}
app.kubernetes.io/name: aml-reporting
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: compliance
{{- end -}}

{{- define "aml-reporting.selectorLabels" -}}
app.kubernetes.io/name: aml-reporting
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
