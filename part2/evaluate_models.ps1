# Evaluation script for Transformer models
# Run this after training is complete

# Evaluate Small Model
Write-Host "Evaluating Small Model..."
python test.py `
    --checkpoint-path models/small/nmt.model `
    --model-config model_config_small.yaml

# Evaluate Medium Model
Write-Host "Evaluating Medium Model..."
python test.py `
    --checkpoint-path models/medium/nmt.model `
    --model-config model_config_medium.yaml

# Evaluate Large Model
Write-Host "Evaluating Large Model..."
python test.py `
    --checkpoint-path models/large/nmt.model `
    --model-config model_config_large.yaml

