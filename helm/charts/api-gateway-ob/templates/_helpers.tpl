{{- define "api-gateway-ob.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "api-gateway-ob.labels" -}}
app.kubernetes.io/name: api-gateway-ob
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: open-banking
{{- end -}}

{{- define "api-gateway-ob.selectorLabels" -}}
app.kubernetes.io/name: api-gateway-ob
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
