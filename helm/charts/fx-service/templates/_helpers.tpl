{{- define "fx-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fx-service.labels" -}}
app.kubernetes.io/name: fx-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: treasury
{{- end -}}

{{- define "fx-service.selectorLabels" -}}
app.kubernetes.io/name: fx-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
