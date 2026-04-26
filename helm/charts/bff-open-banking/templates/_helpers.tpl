{{- define "bff-open-banking.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "bff-open-banking.labels" -}}
app.kubernetes.io/name: bff-open-banking
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: platform
{{- end -}}

{{- define "bff-open-banking.selectorLabels" -}}
app.kubernetes.io/name: bff-open-banking
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
