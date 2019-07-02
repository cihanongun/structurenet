set -ex
# name from filename
NAME=$0
NAME=${NAME##*/}
NAME=${NAME%.*}
NAME=${NAME#train_}

DATA_PATH='../data/partnetobb_chair'
DATASET='../data/partnetobb_chair/train_no_other_less_than_10_parts.txt'
VAL_DATASET='../data/partnetobb_chair/val_small.txt'
EPOCHS=5000
MODEL_VERSION='graphs_5_with_3_and_4'

python -m pdb -c c ./train_vae_v2.py \
  --name ${NAME} \
  --data_path ${DATA_PATH} \
  --dataset ${DATASET} \
  --val_dataset ${VAL_DATASET} \
  --data_type 'partnetobb' \
  --epochs ${EPOCHS} \
  --model_version ${MODEL_VERSION} \
  --edge_feat_type 'type_only' \
  --edge_feature_size 0 \
  --num_gnn_iterations 2 \
  --num_dec_gnn_iterations 2 \
  --child_encoder_type 'gnn' \
  --child_decoder_type 'gnn' \
  --symmetric_type 'max' \
  --edge_symmetric_type 'avg' \
  --dec_edge_symmetric_type 'avg' \
  --no_fold \
  --loss_weight_sym 1.0 \
  --loss_weight_adj 1.0 \
  --loss_weight_box 20 \
  --loss_weight_anchor 10