resource "helm_release" "prometheus" {
  name       = "kube-prometheus-stack"
  namespace  = "monitoring"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "51.0.0"
  create_namespace = true
  values = [file("${path.module}/values/prometheus-values.yaml")]
}

resource "helm_release" "loki" {
  name       = "loki"
  namespace  = "monitoring"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki"
  version    = "6.6.2"
  values     = [file("${path.module}/values/loki-values.yaml")]
}

resource "helm_release" "promtail" {
  name       = "promtail"
  namespace  = "monitoring"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "promtail"
  version    = "6.15.3"
  values     = [file("${path.module}/values/promtail-values.yaml")]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  namespace  = "monitoring"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "7.3.7"
  values     = [file("${path.module}/values/grafana-values.yaml")]
}