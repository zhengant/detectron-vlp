#!/bin/bash 

# Usage:
# ./extract_feat_flickr30k.sh [proc_split]
# where proc_split indicates the last a few digits of the image IDs.
# For example, proc_split can go from 000 to 999, when proc_split=000,
# images with name *000.jpg will be processed.
# Hence, you can submit 1000 jobs in parallel to extract the features
# for the entire dataset.

DATA_ROOT=/home/jzda/storage/zhengant/fake_media_vlp
CKPT_ROOT=/home/jzda/storage/zhengant/detectron-vlp

python tools/extract_features.py \
    --featcls-output-dir $DATA_ROOT/region_feat_gvd_wo_bgd/feat_cls_1000 \
    --box-output-dir $DATA_ROOT/region_feat_gvd_wo_bgd/raw_bbox \
    --output-file-prefix fake_media_detection_vg_100dets_vlp_checkpoint_trainval \
    --max_bboxes 100 --min_bboxes 100 \
    --cfg $CKPT_ROOT/vlp_config.yaml \
    --wts $CKPT_ROOT/detectron_vlp_ckpt.pkl \
    --proc_split $1 --dataset Flickr30k \
    $DATA_ROOT/edited_images \
    | tee $CKPT_ROOT/log/log_extract_features_vg_100dets_fake_media_editsonly_"$1"
