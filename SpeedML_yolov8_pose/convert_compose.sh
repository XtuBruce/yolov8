mv /workspace/model.pth /workspace/yolov8.pt;
python /SpeedML/convert_compose/read_convert_config.py 2>&1 | tee -a /workspace/log.txt;

trtexec --onnx=/workspace/yolov8.onnx --saveEngine=/workspace/model.plan --fp16 2>&1 | tee -a /workspace/log.txt
