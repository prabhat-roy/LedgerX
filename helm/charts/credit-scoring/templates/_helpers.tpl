{{- define "credit-scoring.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "credit-scoring.labels" -}}
app.kubernetes.io/name: credit-scoring
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: lending
{{- end -}}

{{- define "credit-scoring.selectorLabels" -}}
app.kubernetes.io/name: credit-scoring
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
