{{- define "psd2-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "psd2-service.labels" -}}
app.kubernetes.io/name: psd2-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: open-banking
{{- end -}}

{{- define "psd2-service.selectorLabels" -}}
app.kubernetes.io/name: psd2-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
