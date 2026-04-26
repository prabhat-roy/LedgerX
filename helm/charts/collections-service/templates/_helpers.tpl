{{- define "collections-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "collections-service.labels" -}}
app.kubernetes.io/name: collections-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: lending
{{- end -}}

{{- define "collections-service.selectorLabels" -}}
app.kubernetes.io/name: collections-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
