{{- define "risk-scoring.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "risk-scoring.labels" -}}
app.kubernetes.io/name: risk-scoring
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: fraud-risk
{{- end -}}

{{- define "risk-scoring.selectorLabels" -}}
app.kubernetes.io/name: risk-scoring
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
