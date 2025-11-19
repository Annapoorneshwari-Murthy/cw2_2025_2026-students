# Script to train all three models (small, medium, large)
# Note: Training can take several hours depending on your hardware

Write-Host "Starting training for small model (embed_size=16, hidden_size=16)..." -ForegroundColor Green
python train.py --model-config model_config_small.yaml --train-config train_config.yaml --wandb-project nmt-project --wandb-run-name seq2seq-small --checkpoint-path ./models/small

Write-Host "Starting training for medium model (embed_size=64, hidden_size=64)..." -ForegroundColor Green
python train.py --model-config model_config_medium.yaml --train-config train_config.yaml --wandb-project nmt-project --wandb-run-name seq2seq-medium --checkpoint-path ./models/medium

Write-Host "Starting training for large model (embed_size=128, hidden_size=128)..." -ForegroundColor Green
python train.py --model-config model_config_large.yaml --train-config train_config.yaml --wandb-project nmt-project --wandb-run-name seq2seq-large --checkpoint-path ./models/large

Write-Host "All training completed!" -ForegroundColor Green



