{{- define "accounting-bridge.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "accounting-bridge.labels" -}}
app.kubernetes.io/name: accounting-bridge
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: core-banking
{{- end -}}

{{- define "accounting-bridge.selectorLabels" -}}
app.kubernetes.io/name: accounting-bridge
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
