import os
import argparse

try:
    parser = argparse.ArgumentParser(description='Render isolated tfvars into one single tfvars.')
    parser.add_argument('--base-dir', type=str, required=True, help='The base directory to initiate tfvars rendering.')
    parser.add_argument('--regions', type=str, required=True, help='All regions for rendering region specific tfvar.')
    parser.add_argument('--env', type=str, required=True, help='Environment for rendering tfvars file.')
    args = parser.parse_args()
    base_dir = args.base_dir
    regions = args.regions
    env = args.env
except Exception as e:
    print(e)


def get_file_content(file_path: str, n: int) -> str:
    with open(file_path, 'r') as file:
        return '\n'.join('  ' * n + line.rstrip() for line in file.readlines())


def file_writer(subdir: str, env_dir: str, reg_dir: str, op_file_obj: object, n: int) -> None:
    elements = set()
    if os.path.isdir(os.path.join(env_dir, subdir)):
        elements = set(os.listdir(os.path.join(env_dir, subdir)))
    if os.path.isdir(os.path.join(reg_dir, subdir)):
        elements.update(os.listdir(os.path.join(reg_dir, subdir)))
    if "reusable" in elements:
        op_file_obj.write(f"# Found 'reusable' folder: {subdir}/reusable, rendered first. \n")
        file_writer(os.path.join(subdir, "reusable"), env_dir, reg_dir, op_file_obj, n)
        elements.remove("reusable")
    for file in elements:
        if os.path.isdir(os.path.join(env_dir, subdir, file)) or os.path.isdir(os.path.join(reg_dir, subdir, file)):
            if file == "static":
                file_writer(os.path.join(subdir, file), env_dir, reg_dir, op_file_obj, n)
            else:
                op_file_obj.write('  ' * n + file + " = {\n")
                file_writer(os.path.join(subdir, file), env_dir, reg_dir, op_file_obj, n + 1)
                op_file_obj.write('  ' * n + "}\n")
        elif file.endswith('.tfvars'):
            if os.path.isfile(os.path.join(reg_dir, subdir, file)):
                op_file_obj.write(f"# Content from folder: {reg_dir}/{subdir}/{file}\n")
                op_file_obj.write(get_file_content(os.path.join(reg_dir, subdir, file), n))
                op_file_obj.write("\n")
            else:
                op_file_obj.write(f"# Content from folder: {env_dir}/{subdir}/{file}\n")
                op_file_obj.write(get_file_content(os.path.join(env_dir, subdir, file), n))
                op_file_obj.write("\n")


if __name__ == "__main__":
    if os.path.isdir(base_dir):
        for region in [r.strip() for r in regions.split(',')]:
            env_dir = os.path.join(base_dir, "env", env)
            reg_dir = os.path.join(base_dir, "region", region, env)
            with open(f"{env}-{region}.tfvars", 'w') as output_file:
                file_writer("", env_dir, reg_dir, output_file, 0)
            print(f"Rendered file {env}-{region}.tfvars successfully.")
    else:
        print(f"Unable to located Base directory {base_dir}. Continuing without rendering tfvars.")

