{{- define "nostro-reconciliation.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "nostro-reconciliation.labels" -}}
app.kubernetes.io/name: nostro-reconciliation
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: reconciliation
{{- end -}}

{{- define "nostro-reconciliation.selectorLabels" -}}
app.kubernetes.io/name: nostro-reconciliation
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
