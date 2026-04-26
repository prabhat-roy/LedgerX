{{- define "market-data.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "market-data.labels" -}}
app.kubernetes.io/name: market-data
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: wealth
{{- end -}}

{{- define "market-data.selectorLabels" -}}
app.kubernetes.io/name: market-data
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
