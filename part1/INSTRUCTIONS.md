# Part I: Global Attention for Bi-LSTM seq2seq Model - Implementation Summary

## Completed Steps

### Step 0: Vocabulary Building ✅
- Vocabulary has been built by running `vocab.py`
- Vocabulary file saved to `vocab/vocab.json`
- Source vocabulary: 7000 words
- Target vocabulary: 8000 words

### Step 1: Dot-Product Attention Implementation ✅
- Implemented dot-product attention in the `step()` method of `nmt_model.py`
- The implementation includes:
  1. Computing attention scores (e_t) using batched matrix multiplication
  2. Applying masking to ignore padding tokens
  3. Applying softmax to get attention weights (alpha_t)
  4. Computing attention context vector
  5. Combining decoder hidden state with attention context
  6. Applying combined output projection, tanh, and dropout

### Step 2: Sanity Check ✅
- All sanity checks passed successfully
- Implementation verified to be correct

### Step 3: Training Setup ✅
- Created three model configuration files:
  - `model_config_small.yaml`: embed_size=16, hidden_size=16
  - `model_config_medium.yaml`: embed_size=64, hidden_size=64
  - `model_config_large.yaml`: embed_size=128, hidden_size=128
- Created training script: `train_all_models.ps1`
- Created evaluation script: `evaluate_all_models.ps1`

## Next Steps

### Training Models

You have two options:

**Option 1: Train all models sequentially using the script**
```powershell
cd cw2_2025_2026-students/part1
.\train_all_models.ps1
```

**Option 2: Train models individually**
```powershell
# Small model
python train.py --model-config model_config_small.yaml --train-config train_config.yaml --wandb-project nmt-project --wandb-run-name seq2seq-small --checkpoint-path ./models/small

# Medium model
python train.py --model-config model_config_medium.yaml --train-config train_config.yaml --wandb-project nmt-project --wandb-run-name seq2seq-medium --checkpoint-path ./models/medium

# Large model
python train.py --model-config model_config_large.yaml --train-config train_config.yaml --wandb-project nmt-project --wandb-run-name seq2seq-large --checkpoint-path ./models/large
```

**Note:** Training can take several hours depending on your hardware. Monitor progress via Weights & Biases dashboard.

### Evaluating Models

After training is complete, evaluate all models:

```powershell
.\evaluate_all_models.ps1
```

Or individually:
```powershell
# Small model
python test.py --checkpoint-path ./models/small/nmt.model --output-file ./outputs/small_results.json

# Medium model
python test.py --checkpoint-path ./models/medium/nmt.model --output-file ./outputs/medium_results.json

# Large model
python test.py --checkpoint-path ./models/large/nmt.model --output-file ./outputs/large_results.json
```

## Weights & Biases Setup

1. When you run `train.py` for the first time, you'll be prompted to enter your W&B API key
2. Create a project on W&B (or use the default "nmt-project")
3. Monitor training progress at https://wandb.ai

## Results Summary

After training and evaluation, you'll need to:
1. Create a table summarizing your experiments with:
   - Model size (small/medium/large)
   - Embedding size
   - Hidden size
   - BLEU score
   - Other relevant hyperparameters
2. Attach a screenshot from W&B showing training and dev loss curves
3. Write a discussion paragraph comparing model ablations

## File Structure

```
part1/
├── nmt_model.py              # Main model with attention implementation
├── vocab.py                  # Vocabulary building
├── train.py                  # Training script
├── test.py                   # Evaluation script
├── sanity_check.py           # Unit tests
├── model_config_small.yaml   # Small model config
├── model_config_medium.yaml  # Medium model config
├── model_config_large.yaml   # Large model config
├── train_config.yaml         # Training hyperparameters
├── train_all_models.ps1      # Batch training script
├── evaluate_all_models.ps1   # Batch evaluation script
└── vocab/
    └── vocab.json            # Built vocabulary
```



