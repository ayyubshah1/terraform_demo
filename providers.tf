provider "vault" {
  address = "https://sample-cluster-public-vault-2567d08f.86c723bb.z1.hashicorp.cloud:8200"
  token   = "hvs.CAESIN70S7I_Ea-cuG-3AJAdl6kwVgn7unH-iWUNTrfE5JUTGicKImh2cy5UNVk5ZnN3OFJ2dElRdHN3SkFpcTdMMjUucUtxc0gQtgI"
}
provider "aws" {
  region     = "eu-west-1"
  access_key = data.vault_generic_secret.vaultkeys.data["access_key"]
  secret_key = data.vault_generic_secret.vaultkeys.data["secret_access_key"]
}