{{- define "sms-alert.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "sms-alert.labels" -}}
app.kubernetes.io/name: sms-alert
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: notifications
{{- end -}}

{{- define "sms-alert.selectorLabels" -}}
app.kubernetes.io/name: sms-alert
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
