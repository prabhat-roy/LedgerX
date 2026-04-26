{{- define "hold-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "hold-service.labels" -}}
app.kubernetes.io/name: hold-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: core-banking
{{- end -}}

{{- define "hold-service.selectorLabels" -}}
app.kubernetes.io/name: hold-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
