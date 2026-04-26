{{- define "rate-limiter.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "rate-limiter.labels" -}}
app.kubernetes.io/name: rate-limiter
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: platform
{{- end -}}

{{- define "rate-limiter.selectorLabels" -}}
app.kubernetes.io/name: rate-limiter
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
