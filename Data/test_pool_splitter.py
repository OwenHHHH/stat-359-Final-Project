import json
import os
from Given_Files.evaluator import ArithmeticEvaluator

def get_tree_depth(node):
    if node is None or node.kind == 'num':
        return 0
    return 1 + max(get_tree_depth(node.left), get_tree_depth(node.right))

def filter_corpus_by_strict_depth(input_path, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    
    # Initialize buckets for depths 1-5
    depth_buckets = {i: [] for i in range(1, 6)}
    
    with open(input_path, 'r') as f:
        for line in f:
            if not line.strip(): continue
            data = json.loads(line)
            expr = data['expression']
            
            try:
                evaluator = ArithmeticEvaluator(expr)
                evaluator.root = evaluator.parse_expression()
                actual_depth = get_tree_depth(evaluator.root) # getting depth using existing function
                
                if actual_depth in depth_buckets:
                    depth_buckets[actual_depth].append(data)
            except Exception:
                continue

    # Save the filtered results
    for d, samples in depth_buckets.items():
        output_file = os.path.join(output_dir, f"test_depth_{d}.txt")
        with open(output_file, 'w') as f:
            for s in samples[:500]:  # only taking 500 samples
                f.write(json.dumps(s) + "\n")
        print(f"Saved {len(samples[:500])} samples to {output_file}") # ensuring 500 samples are produced

if __name__ == "__main__":
    filter_corpus_by_strict_depth("data/test_pool.txt", "data/test_sets")