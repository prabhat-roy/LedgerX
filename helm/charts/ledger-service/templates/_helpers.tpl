{{- define "ledger-service.name" -}}{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- define "ledger-service.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}{{- .Release.Name | trunc 63 | trimSuffix "-" -}}{{- else -}}{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}{{- end -}}
{{- end -}}
{{- define "ledger-service.serviceAccountName" -}}{{- if .Values.serviceAccount.create -}}{{- include "ledger-service.fullname" . -}}{{- else -}}{{- default "default" .Values.serviceAccount.name -}}{{- end -}}{{- end -}}
{{- define "ledger-service.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "ledger-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: core-banking
ledgerx.io/money-moving: "true"
{{- end -}}
{{- define "ledger-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ledger-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
