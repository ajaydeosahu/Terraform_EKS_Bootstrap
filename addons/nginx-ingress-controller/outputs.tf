output "nginx_ingress_controller_dns_hostname" {
  description = "NGINX Ingress Controller DNS Hostname"
  value       = data.kubernetes_service.get_ingress_nginx_controller_svc.*.status.0.load_balancer.0.ingress.0.hostname
}