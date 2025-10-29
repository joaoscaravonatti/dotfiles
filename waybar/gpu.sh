while [[ true ]]; do
  nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits
  sleep 1
done
