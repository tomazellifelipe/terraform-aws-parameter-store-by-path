# terraform-aws-parameter-store-by-path

Return values from an AWS Parameter Store by path already formated.

For example lets say you have these parameter values:

- Name: /network/vpc_id
  - Type: String
  - Value: my-vpc
- Name: /network/subnet_ids
  - Type: StringList
  - Value: "subnet-a,subnet-b,subnet-c"
- Name: /network/secure_id
  - Type: SecureString
  - Value: "super-secret-value"


Using this module will have the outputs:
```hcl
values = {
  vpc_id = "my-vpc"
  subnet_ids = ["subnet-a", "subnet-b", "subnet-c"]
}
sensitive_values = {
  secure_id = (sensitive)
}
```