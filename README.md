# yolov8
yolov8----训练到部署

**维护更新的思路：**
1. 利用基础镜像构建训练、转换环境镜像
2. 将相应 `SpeedML`、`ultralytics`、`models` 文件夹复制到环境镜像中

## [ultralytics](ultralytics) 文件夹：yolov8 源码
- [trainer.py](ultralytics%2Fultralytics%2Fengine%2Ftrainer.py)：更改训练代码适配平台
- [tensorboard.py](ultralytics%2Fultralytics%2Futils%2Fcallbacks%2Ftensorboard.py)：更改 Tensorboard 日志保存路径
- [dist.py](ultralytics%2Fultralytics%2Futils%2Fdist.py)：不删除save_dir


## yolov8 训练镜像制作
### 方法一：从零开始构建
详情见：

### 方法一：原始镜像
pytorch原始镜像：nvcr.io/nvidia/pytorch:22.07-py3

将 [ultralytics](ultralytics) 和 [SpeedML](SpeedML) 拷贝至根目录，切换工作目录至 `/ultralytics`，
依次执行
```bash
python setup.py build
python setup.py install
```

### 方法二：基础镜像（已配置好基础环境）
使用 [Dockerfile](SpeedML_yolov8/train/Dockerfile.train) 构建镜像



## [SpeedML](SpeedML) 文件夹：平台适配文件
- [train.sh](SpeedML%2Ftrain.sh)：模型训练自启动脚本
- [train](SpeedML%2Ftrain)：
  - [read_train_config.py](SpeedML%2Ftrain%2Fread_train_config.py)：读取平台配置更改默认参数启动模型训练
  - [train_labelme2yolo.py](SpeedML%2Ftrain%2Ftrain_labelme2yolo.py)：labelme 标注文件转 yolo 格式

## [workspace](workspace) 文件夹：
- [complete_config.yaml](workspace%2Fcomplete_config.yaml)：当前训练所有参数的配置文件
- [dataset.yaml](workspace%2Fdataset.yaml)：当前训练数据集的配置文件

具体细节参考 `git master` 分支的push更改记录。

## 支持功能
- 多卡训练
- 多模型选择（yolov8n, yolov8s, yolov8m, yolov8l, yolov8x）
- 断点续训
- 预训练模型上传启动训练 
- 训练日志简洁版/完整版 
- 简要参数/全部参数版配置文件 
- Tensorboard 日志 
- 训练进度显示 
- 模型测试
- 集群模型转换