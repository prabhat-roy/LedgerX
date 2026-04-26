{{- define "robo-advisor.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "robo-advisor.labels" -}}
app.kubernetes.io/name: robo-advisor
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: wealth
{{- end -}}

{{- define "robo-advisor.selectorLabels" -}}
app.kubernetes.io/name: robo-advisor
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
