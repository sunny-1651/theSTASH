# TFVAR Parser

This module essentially converts tfvars file to json file.

Where possible, Terraform automatically converts values from one type to another in order to produce the expected type. If this isn't possible, Terraform will produce a type mismatch error and you must update the configuration with a more suitable expression.
Terraform automatically converts number and bool values to strings when needed. It also converts strings to numbers or bools, as long as the string contains a valid representation of a number or bool value.
- `true` converts to `"true"`, and vice-versa
- `false` converts to `"false"`, and vice-versa
- `15` converts to `"15"`, and vice-versa

The module doesn't handlke this type conversion, it spits out json with tfvar contents as is.
the output json file is of same name as the input tfvar file.

### Example
input -> test.tfvars
```
var = val
```

output -> test.json
```
{
    var = val
}
```

> **Note:**
> The GO version already exists: [alisdair/tfvars-json](https://github.com/alisdair/tfvars-json.git)
> -------------------------------------------------------------------------------------------------------
> Apparently there is a python library as well. [amplify-education/python-hcl2](https://github.com/amplify-education/python-hcl2.git)  
> **USAGE**
> ```
> import json
> import hcl2
> 
> with open('foo.tf', 'r') as file:
>     dict = hcl2.load(file)
> 
> with open("foo.json", "w") as file_out:
>   file_out.write(json.dumps(dict, indent=4))
> ```
