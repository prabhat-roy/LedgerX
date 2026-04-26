{{- define "swift-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "swift-service.labels" -}}
app.kubernetes.io/name: swift-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: payments
{{- end -}}

{{- define "swift-service.selectorLabels" -}}
app.kubernetes.io/name: swift-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
