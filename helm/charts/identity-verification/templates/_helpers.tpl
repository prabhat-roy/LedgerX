{{- define "identity-verification.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "identity-verification.labels" -}}
app.kubernetes.io/name: identity-verification
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: kyc
{{- end -}}

{{- define "identity-verification.selectorLabels" -}}
app.kubernetes.io/name: identity-verification
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
