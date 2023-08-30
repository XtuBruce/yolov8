mv /workspace/model.pth /workspace/yolov8.pt;
python /SpeedML/convert_compose/read_convert_config.py 2>&1 | tee -a /workspace/log.txt;

python /yolo2trt/export.py -o /workspace/yolov8.onnx -e /workspace/yolov8.trt --end2end --v8 2>&1 | tee -a /workspace/log.txt;
mv /workspace/yolov8.trt /workspace/model.plan