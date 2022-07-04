python3 xla_spawn.py \
  --num_cores 8 \
  train.py \
  --resume_from_checkpoint ./checkpoints/colbertv2.0 \
  --kd_teacher_model_name_or_path ./checkpoints/colbertv2.0 \
  --model_name_or_path bert-base-uncased \
  --config_name bert-base-uncased \
  --output_dir ./checkpoints/tctcolbertv2.msmarco-psg \
  --train_file ../data/msmarco-psgs/marco_psg.train.triples.jsonl \
  --eval_file ../data/msmarco-psgs/marco_psg.train.triples.sample.jsonl \
  --max_q_seq_length 32 \
  --max_p_seq_length 150 \
  --colbert_type 'tctcolbert' \
  --dim 128 \
  --remove_unused_columns false \
  --per_device_train_batch_size 12 \
  --evaluation_strategy 'steps'\
  --max_steps 160000 \
  --save_steps 40000 \
  --eval_steps 40000 \
  --do_train \
  --do_eval