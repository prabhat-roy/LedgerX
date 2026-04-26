{{- define "gateway-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "gateway-service.labels" -}}
app.kubernetes.io/name: gateway-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: payments
{{- end -}}

{{- define "gateway-service.selectorLabels" -}}
app.kubernetes.io/name: gateway-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
