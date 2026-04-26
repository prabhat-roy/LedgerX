{{- define "upi-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "upi-service.labels" -}}
app.kubernetes.io/name: upi-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: payments
{{- end -}}

{{- define "upi-service.selectorLabels" -}}
app.kubernetes.io/name: upi-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
