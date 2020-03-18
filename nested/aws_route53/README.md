## usage
```bash
 terraform plan \
   -var aws_access_key="$(cat aws_access.key)" \
   -var aws_secret_key="$(cat aws_secret.key)"
``` 