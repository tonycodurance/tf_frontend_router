module "fastly" {
  source = "github.com/mergermarket/tf_fastly_frontend"

  domain_name               = "${var.fastly_domain}"
  bare_redirect_domain_name = "${var.bare_redirect_domain_name}"
  backend_address           = "${module.alb.alb_dns_name}"
  env                       = "${var.env}"
  caching                   = "${var.fastly_caching}"
  ssl_cert_check            = "${var.ssl_cert_check}"
  ssl_cert_hostname         = "${module.dns_record.fqdn}"
  connect_timeout           = "${var.connect_timeout}"
  first_byte_timeout        = "${var.first_byte_timeout}"
  between_bytes_timeout     = "${var.between_bytes_timeout}"
  custom_vcl_backends       = "${var.custom_vcl_backends}"
  custom_vcl_recv           = "${var.custom_vcl_recv}"
  custom_vcl_error          = "${var.custom_vcl_error}"
  custom_vcl_deliver        = "${var.custom_vcl_deliver}"
  bypass_busy_wait          = "${var.bypass_busy_wait}"
}
