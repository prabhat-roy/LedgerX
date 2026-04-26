{{- define "cash-pooling.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cash-pooling.labels" -}}
app.kubernetes.io/name: cash-pooling
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: treasury
{{- end -}}

{{- define "cash-pooling.selectorLabels" -}}
app.kubernetes.io/name: cash-pooling
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
