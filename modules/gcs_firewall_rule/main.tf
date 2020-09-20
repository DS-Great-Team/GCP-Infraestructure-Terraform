#"Copyright 2019 Globant LLC
#
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License."

resource "google_compute_firewall" "firewall_rule" {
  name    = var.firewall_rule_name
  network = var.firewall_vpc
  allow {
    protocol = var.firewall_protocol
    ports    = var.firewall_ports
  }
  target_tags   = var.firewall_target_tags
  source_ranges = var.firewall_source_ranges
}