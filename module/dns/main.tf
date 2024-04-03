resource "google_dns_record_set" "record_set" {
  name         = var.name
  type         = var.type
  ttl          = var.ttl
  managed_zone = var.managed_zone
  rrdatas      = [var.instance_ip]
}

resource "google_dns_record_set" "dkim_record_set" {
  name         = "krs._domainkey.jasonlidevelop.com."
  type         = "TXT"
  ttl          = var.ttl
  managed_zone = var.managed_zone
  rrdatas      = ["k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDW5hFJyrR+cOd/Y8tnl2DcVsPApj9JTxakwTqcTXhJKEP97/j0aPlHeA00vkd7RW6DbYuIvMKergA2vJ/9emdnHftkYc8Ha6vurA7s/411PlVEFcfqCvvV8JWbaEDKzIEEx3i3wavKtj8dFhlrvLAZV4MMEE3ZCaPwcBlGCwZRBQIDAQAB"]
}

resource "google_dns_record_set" "spf_record_set" {
  name         = "jasonlidevelop.com."
  type         = "TXT"
  ttl          = var.ttl
  managed_zone = var.managed_zone
  rrdatas      = ["v=spf1 include:mailgun.org ~all"]
}

resource "google_dns_record_set" "mx_record_set" {
  name         = "jasonlidevelop.com."
  type         = "MX"
  ttl          = var.ttl
  managed_zone = var.managed_zone
  rrdatas      = ["10 mxa.mailgun.org.", "10 mxb.mailgun.org."]
}

resource "google_dns_record_set" "cname_record_set" {
  name         = "email.jasonlidevelop.com."
  type         = "CNAME"
  ttl          = var.ttl
  managed_zone = var.managed_zone
  rrdatas      = ["mailgun.org."]
}

