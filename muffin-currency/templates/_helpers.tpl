{{/*
Release name
*/}}
{{- define "muffin-currency.release-name" -}}
{{ .Release.Name }}
{{- end }}

{{/*
Resource name
*/}}
{{- define "muffin-currency.resource-name" -}}
{{- .Values.appLabel -}}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "muffin-currency.selector" -}}
app: {{ .Values.appLabel }}
{{- end }}

{{/*
Resource labels
*/}}
{{- define "muffin-currency.labels" -}}
app: {{ .Values.appLabel }}
{{- end }}

{{/*
Liveness probe template
*/}}
{{- define "muffin-currency.liveness" -}}
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
{{- define "muffin-currency.readiness" -}}
readinessProbe:
  httpGet:
    path: {{ .Values.readinessProbe.httpGet.path }}
    port: {{ .Values.readinessProbe.httpGet.port }}
  initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds }}
  periodSeconds: {{ .Values.readinessProbe.periodSeconds }}
{{- end }}
