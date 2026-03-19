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

# creating tokenizer
!python -m Given_Files.train_tokenizer `
  --corpus-path Data/foundational_corpus.txt `
  --output-dir Data `
  --vocab-size 1000

# getting tokenizer data
!python -m Given_Files.show_token_table