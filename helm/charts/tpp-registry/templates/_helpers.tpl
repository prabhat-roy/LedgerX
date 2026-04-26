{{- define "tpp-registry.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "tpp-registry.labels" -}}
app.kubernetes.io/name: tpp-registry
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: open-banking
{{- end -}}

{{- define "tpp-registry.selectorLabels" -}}
app.kubernetes.io/name: tpp-registry
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
