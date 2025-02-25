# theSTASH

### This repo has the helper scripts/packages that I use/think-of to use in a workflow
I am planning to write scripts in python & GO. I will develop in one and will try to recreate in another.

### ITEMS
1) [**Terraform Renderer**](./tfvar_renderer/)
    Useful when the tfvar file gets big and maintaining it becomes a hassle. 
    Instead finding the current object in a file that is thousands of lines long we can just split it into multple small tfvar files orgyanized neatly into appropriate directories. 
    The name of the directory is the id of the object in which the tfvar elements inside the dir are going to be enclosed.

2) [**tfvar parser** *abandoned*](./tfvars_parser/README.md)
    A lot of times there are helper scripts that wants to use the inputs provided in tfvar file but it is not readily readable so we can either end taking/calculating the input another way or running the script from inside the tf scripts in a null_resource. Instead of this we can just use this script to convert tfvar into json and then easily pick up all the elements required. Also we could just need one value from the plethora of lines in tfvar, then we can just get the one value instead of parsing all the files.

3) **TF bootstrapping** *planned*
    Starting with GCP then to AWS and finally to Azure targets.
    create an encrption key for the resources and using the key deploy a backend bucket and an artifactory repo.
    Rationale to not use TF: there is actually just one reason, not being able to check if the resource already exists in the cloud. As we dont even have a backend so we cant track the infra state.

4) [**Location Mapping**](./location_mapping/)
    I have a map of region_abbreviation:region in a JSON but all the regions in which deployment can happen a resource is not available for some regions. 
    This is a bash script to create a JSON available_region:available_region, unavailable_region:\<available_region with least Levenshtein distance from unavailable_region\>.
    I am using Levenshtein distance as calculating actual distance between regions will be a serious overkill and the regions that are close are generally named similar, ex: us-east3 will us-east1.
    For testing the logic I am using GCP cloud schedular. I wrote this script with the intention of using it in CICD before going ahead with tf plan but i think it can also be used using a null_resource (Not tested with null res).
