resource "helm_release" "nvidia_gpu_operator" {
  name       = "gpu-operator"
  namespace  = "gpu-operator"
  repository = "https://nvidia.github.io/gpu-operator"
  chart      = "gpu-operator"
  version    = "v23.9.2"
  create_namespace = true
  values = [file("${path.module}/values/gpu-operator-values.yaml")]
}

resource "helm_release" "dcgm_exporter" {
  name       = "dcgm-exporter"
  namespace  = "gpu-operator"
  repository = "https://nvidia.github.io/dcgm-exporter"
  chart      = "dcgm-exporter"
  version    = "3.3.5"
  values     = [file("${path.module}/values/dcgm-values.yaml")]
}

resource "helm_release" "nvidia_network_operator" {
  name       = "network-operator"
  namespace  = "network-operator"
  repository = "https://nvidia.github.io/network-operator"
  chart      = "network-operator"
  version    = "24.3.0"
  create_namespace = true
  values     = [file("${path.module}/values/network-operator-values.yaml")]
}
