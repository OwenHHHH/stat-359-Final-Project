# foundational_corpus bash
poetry run python -m Given_Files.generate_foundational_plaintext `
>>   --num-samples 100000 `
>>   --max-depth 5 `
>>   --num-range 0 99 `
>>   --invalid-rate 0.00 `
>>   --output-txt data/foundational_corpus.txt

# instruction corpus bash
poetry run python -m Given_Files.generate_instruction_corpus_mixed `
  --num-samples 20000 `
  --max-depth 5 `
  --num-range 0 99 `
  --invalid-rate 0.0 `
  --output-mixed data/instruction_corpus.txt

# generating test set pool
poetry run python -m Given_Files.generate_corpus `
    --instruction-only `
    --num-samples 70000 `
    --max-depth 5 `
    --num-range 0 99 `
    --invalid-rate 0.0 `
    --output-instruction data/test_pool.txt

# using created script to split test pool into specific depth for analysis
poetry run python -m Data.test_pool_splitter