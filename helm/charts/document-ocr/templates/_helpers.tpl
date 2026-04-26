{{- define "document-ocr.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "document-ocr.labels" -}}
app.kubernetes.io/name: document-ocr
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: kyc
{{- end -}}

{{- define "document-ocr.selectorLabels" -}}
app.kubernetes.io/name: document-ocr
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
