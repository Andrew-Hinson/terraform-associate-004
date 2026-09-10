# label module

Local source: `source = "./modules/label"`. No `version` argument.

If this lived on the registry it would look like:

```hcl
module "label" {
  source  = "example-org/label/local"
  version = "~> 1.0"
  name    = "004"
}
```
