# Script to evaluate all three trained models on the test set

Write-Host "Evaluating small model..." -ForegroundColor Green
python test.py --checkpoint-path ./models/small/nmt.model --output-file ./outputs/small_results.json

Write-Host "Evaluating medium model..." -ForegroundColor Green
python test.py --checkpoint-path ./models/medium/nmt.model --output-file ./outputs/medium_results.json

Write-Host "Evaluating large model..." -ForegroundColor Green
python test.py --checkpoint-path ./models/large/nmt.model --output-file ./outputs/large_results.json

Write-Host "All evaluations completed! Check the output files in ./outputs/ for BLEU scores." -ForegroundColor Green

