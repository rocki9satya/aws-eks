{{/*
Expand the name of the chart.
*/}}
{{- define "myapp.name" -}}
myapp
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "myapp.fullname" -}}
{{- printf "%s-%s" .Release.Name "myapp" | trunc 63 | trimSuffix "-" -}}
{{- end -}}