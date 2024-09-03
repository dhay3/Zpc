// Define main function (script entry)
function main(config) {
  const rules = [
    "AND,((IP-CIDR,23.94.117.200/32),(DST-PORT,22)),DIRECT",
    "DOMAIN-SUFFIX,embey.local,DIRECT",
    ...config.rules
  ]
  config["rules"] = rules 
  return config;
}
