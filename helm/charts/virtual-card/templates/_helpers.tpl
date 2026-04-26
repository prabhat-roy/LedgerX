{{- define "virtual-card.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "virtual-card.labels" -}}
app.kubernetes.io/name: virtual-card
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: cards
{{- end -}}

{{- define "virtual-card.selectorLabels" -}}
app.kubernetes.io/name: virtual-card
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
