{{- define "payment-router.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "payment-router.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- end -}}
{{- define "payment-router.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "payment-router.fullname" . -}}{{- else -}}{{- default "default" .Values.serviceAccount.name -}}{{- end -}}{{- end -}}
{{- define "payment-router.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "payment-router.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: payments
ledgerx.io/money-moving: "true"
{{- end -}}
{{- define "payment-router.selectorLabels" -}}
app.kubernetes.io/name: {{ include "payment-router.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
