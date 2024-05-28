# sparse model change the parallel config
python convert.py \
    --model-type mixtral \
    --loader transformers \
    --saver mcore \
    --load-dir Mixtral-8x7B-v0.1 \
    --save-dir output \
    --target-tensor-parallel-size 2 \
    --target-pipeline-parallel-size 2 \
    --target-expert-parallel-size 2 \
    --target-params-dtype fp32 \
    --megatron-path <xxx>


# dense model convert to sparse model, mlp weight copy to all experts weight
# padding vocab_size with default value 64
python convert.py \
    --model-type mistral mixtral \
    --loader transformers \
    --saver mcore \
    --load-dir Mistral-7B-v0.1 \
    --save-dir output \
    --target-tensor-parallel-size 2 \
    --target-pipeline-parallel-size 2 \
    --target-expert-parallel-size 2 \
    --target-params-dtype fp32 \
    --target-num-experts 8 \
    --true-vocab-size 151851 \
    --megatron-path <xxx>

python convert.py \
    --model-type llama \
    --loader transformers \
    --saver mcore \
    --load-dir meta-llama3/Meta-Llama-3-8B \
    --save-dir outputs_llama3/checkpoint_mc \
    --target-tensor-parallel-size 4 \
    --target-pipeline-parallel-size 2 \
    --target-expert-parallel-size 1 \
    --target-params-dtype bf16 \
    --true-vocab-size 128256 \
    --megatron-path <xxx>
