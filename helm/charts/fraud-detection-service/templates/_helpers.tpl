{{- define "svc.name" -}}{{ .Chart.Name }}{{- end -}}
{{- define "svc.fullname" -}}{{- $n := .Chart.Name -}}{{- if contains $n .Release.Name -}}{{ .Release.Name | trunc 63 | trimSuffix "-" }}{{- else -}}{{ printf "%s-%s" .Release.Name $n | trunc 63 | trimSuffix "-" }}{{- end -}}{{- end -}}
{{- define "svc.sa" -}}{{- if .Values.serviceAccount.create -}}{{ include "svc.fullname" . }}{{- else -}}{{ default "default" .Values.serviceAccount.name }}{{- end -}}{{- end -}}
{{- define "svc.labels" -}}
app.kubernetes.io/name: {{ include "svc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: fraud-risk
{{- end -}}
{{- define "svc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "svc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
