{{- define "config-proxy.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "config-proxy.labels" -}}
app.kubernetes.io/name: config-proxy
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: platform
{{- end -}}

{{- define "config-proxy.selectorLabels" -}}
app.kubernetes.io/name: config-proxy
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
