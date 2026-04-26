{{- define "financial-rules-engine.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "financial-rules-engine.labels" -}}
app.kubernetes.io/name: financial-rules-engine
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: core-banking
{{- end -}}

{{- define "financial-rules-engine.selectorLabels" -}}
app.kubernetes.io/name: financial-rules-engine
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
