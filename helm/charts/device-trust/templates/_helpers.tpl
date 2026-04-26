{{- define "device-trust.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "device-trust.labels" -}}
app.kubernetes.io/name: device-trust
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: identity
{{- end -}}

{{- define "device-trust.selectorLabels" -}}
app.kubernetes.io/name: device-trust
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
