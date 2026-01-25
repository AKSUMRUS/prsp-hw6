{{/*
Release name
*/}}
{{- define "muffin-wallet.release-name" -}}
{{ .Release.Name }}
{{- end }}
{{- define "muffin-wallet-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}
{{/*
Resource name
*/}}
{{- define "muffin-wallet.resource-name" -}}
{{- .Values.appLabel -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "muffin-wallet.selector" -}}
app: {{ .Values.appLabel }}
{{- end }}

{{/*
Resource labels
*/}}
{{- define "muffin-wallet.labels" -}}
app: {{ .Values.appLabel }}
{{- end }}

{{/*
Liveness probe template
*/}}
{{- define "muffin-wallet.liveness" -}}
livenessProbe:
  httpGet:
    path: {{ .Values.livenessProbe.httpGet.path }}
    port: {{ .Values.livenessProbe.httpGet.port }}
  initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.livenessProbe.periodSeconds }}
{{- end }}

{{/*
Readiness probe template
*/}}
{{- define "muffin-wallet.readiness" -}}
readinessProbe:
  httpGet:
    path: {{ .Values.readinessProbe.httpGet.path }}
    port: {{ .Values.readinessProbe.httpGet.port }}
  initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.readinessProbe.periodSeconds }}
{{- end }}
