{{- define "churn-prediction.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "churn-prediction.labels" -}}
app.kubernetes.io/name: churn-prediction
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: analytics
{{- end -}}

{{- define "churn-prediction.selectorLabels" -}}
app.kubernetes.io/name: churn-prediction
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
