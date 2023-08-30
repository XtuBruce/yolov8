cd /models;
cp -r /workspace/dataset/test/* /workspace/dataset/val;
mkdir /workspace/result;
python /SpeedML/test/read_test_config.py --root-path=/ 2>&1 | tee -a /workspace/log.txt;
mv /workspace/*.jpg /workspace/result;
mv /workspace/*.png /workspace/result;
python /SpeedML/test/plot_tensorboard.py
