{{- define "mesh-controller.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "mesh-controller.labels" -}}
app.kubernetes.io/name: mesh-controller
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: ledgerx
ledgerx.io/domain: platform
{{- end -}}

{{- define "mesh-controller.selectorLabels" -}}
app.kubernetes.io/name: mesh-controller
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
