{{- define "case-management.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "case-management.labels" -}}
app.kubernetes.io/name: case-management
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: fraud-risk
{{- end -}}

{{- define "case-management.selectorLabels" -}}
app.kubernetes.io/name: case-management
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
