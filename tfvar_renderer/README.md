# TFVAR RENDERER

The Script goes in the base-dir starts consolidating all files from env dir and reg dir into output tfvars file. If two file have same dir path and same file name then the file from reg dir is prioritized.
The intended purpose for prioritizing reg is, env tfvars files are general at an environment level and if some tfvar files' content is specific for a region that can be stored in reg dir with same path/file_name and that will be picked.
If a folder is named `reusable` then that file is processed first amoung all the files at that ojbect level and the content inside reusable is not wrapped in an object named reusable.
If a folder is named `static` then the content inside folder will not be wrapped in an ojbect. `\<path1\>/static/\<path2\> ~ \<path1\>/\<path2\>`

Example command to run 
```python3 render.py --env dev --region "asse1,asse2" --base-dir tf_inpts```

