{{- define "relationship-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "relationship-service.labels" -}}
app.kubernetes.io/name: relationship-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: customer-360
{{- end -}}

{{- define "relationship-service.selectorLabels" -}}
app.kubernetes.io/name: relationship-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
