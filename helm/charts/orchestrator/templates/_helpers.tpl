{{- define "orchestrator.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "orchestrator.labels" -}}
app.kubernetes.io/name: orchestrator
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: notifications
{{- end -}}

{{- define "orchestrator.selectorLabels" -}}
app.kubernetes.io/name: orchestrator
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
