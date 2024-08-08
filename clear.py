import os
import re

# 配置路径
assets_file = 'lib/generated/assets.dart'  # 资源定义文件的路径
lib_dir = 'lib'  # 项目的lib目录

def find_unused_images():

    # 读取资源定义文件
    with open(assets_file, 'r') as file:
        lines = file.readlines()

    # 正则表达式匹配资源定义
    pattern = re.compile(r"static const String (\w+) = '([^']+)'")

    # 检查每个资源是否在lib目录中被引用
    for line in lines:
        match = pattern.search(line)
        if match:
            # print(f"Match found: {match.groups()}")
            var_name = match.group(1)
            image_path = match.group(2)
            # print(f"Match found: {is_referenced(var_name)}")
            # 检查变量名和文件路径是否被引用
            if not is_referenced(var_name) and not is_referenced(image_path):
                # 删除未使用的图片文件
                delete_image(image_path)

def is_referenced(text):
    # 遍历lib目录下的所有文件
    for root, dirs, files in os.walk(lib_dir):
        for file in files:
            file_path = os.path.join(root, file)
            # 确保当前文件不是资源定义文件
            if file_path.endswith('.dart') and file_path != assets_file:
                with open(file_path, 'r') as f:
                    if text in f.read():
                        return True
    return False

def delete_image(image_path):
    # 删除基本图像文件
    delete_file(image_path)
    # 构建并删除分辨率变体文件
    base_dir, filename = os.path.split(image_path)
    for scale in ['2.0x', '3.0x']:
        scaled_image_path = os.path.join(base_dir, scale, filename)
        delete_file(scaled_image_path)

def delete_file(file_path):
    full_path = os.path.join(os.getcwd(), file_path)
    if os.path.exists(full_path):
        os.remove(full_path)
        print(f"Deleted unused image: {file_path}")
    else:
        print(f"File not found: {file_path}")
if __name__ == '__main__':
    find_unused_images()