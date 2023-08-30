cd /models;

python /SpeedML/train/read_train_config.py --root-path=/ 2>&1 | tee -a /workspace/log.txt;
mv /workspace/*.jpg /workspace/other;
mv /workspace/*.png /workspace/other
